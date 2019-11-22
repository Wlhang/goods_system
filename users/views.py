from django.shortcuts import render
from django.http import HttpResponseRedirect,HttpResponse
from django.urls import reverse
from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from users.forms import *
import datetime
from django.conf import settings
import smtplib
from email.mime.text import MIMEText
from email.header import Header
import hashlib
from .models import *
import random
from django.db.models import Q
from cart.cart import Cart
from goods.models import Goods


def hash_code(s,salt):
	h = hashlib.sha256()
	s += salt
	h.update(s.encode())
	return h.hexdigest()
	

def make_confirm_str(user):
	now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
	code = hash_code(user.username,now)
	User_Confirm.objects.create(code=code,user=user)
	return code


def send_email(email,code):
	# 发送邮件主题和内容
	subject = "A confirmation email from buy_or_not"
	
	text_content = '''Thanks for registering buy_or_not,if you see the message,
						please copy the link and open it in the browser.
						http://{}/confirm/?code={}
						'''.format('47.102.150.129/user',code)
	html_content = """<p>Thanks for registering buy_or_not,</p>
					<p>Please click the link to finish registration,</p>
					<p>The link is valid for {} days.<a href="http://{}/confirm?code={}" target=blank>47.102.150.129/user/confirm</a></p>
					<p></p>
					""".format(settings.CONFIRM_DAYS,'47.102.150.129/user',code)
	message = MIMEText(html_content, 'html', 'utf-8')
	message['Subject'] = Header(subject, 'utf-8')
	message['From'] = Header(settings.EMAIL_SENDER, 'utf-8')
	message['To'] = Header(email, 'utf-8')
	
	smtp = smtplib.SMTP_SSL(settings.EMAIL_HOST, 465)
	smtp.helo()
	smtp.ehlo()
	# 登录邮箱服务器用户名和密码
	smtp.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)
	
	# print("开始发送邮件...")
	# smtp.sendmail(settings.EMAIL_HOST_USER, [email], message.as_string())
	# smtp.quit()
	# return False
	try:
		# print(settings.EMAIL_HOST_USER, [email], message.as_string())
		smtp.sendmail(settings.EMAIL_HOST_USER, [email], message.as_string())
	except:
		smtp.quit()
		return False
	smtp.quit()
	return True
	

def confirm(request):
	code = request.GET.get('code',None)
	message = ''
	try:
		confirm = User_Confirm.objects.get(code=code)
	except:
		message = 'Invalid confirmation request,the window will jump to login in '
		return render(request,'users/confirm.html',{"message":message,"la":"login"})
	c_time = confirm.c_time
	now = datetime.datetime.now()
	if now > c_time + datetime.timedelta(settings.CONFIRM_DAYS):
		confirm.user.delete()
		message = 'you email has expired,please register again,the page will jump in '
		return render(request, 'users/confirm.html', {"message":message,"la":"'registration'"})
	else:
		# print(confirm.user)
		confirm.user.is_active = True
		confirm.user.save()
		login(request, confirm.user)
		user_profile = User_Profile.objects.get(user=confirm.user)
		request.session['identity'] = user_profile.status
		if not request.session.get('CART-ID'):
			if user_profile.shopping_cart != 0:
				request.session['CART-ID'] = user_profile.shopping_cart
			else:
				cart = Cart(request)
				user_profile.shopping_cart = request.session['CART-ID']
				user_profile.save()
		confirm.delete()
		message = 'Thanks for your registration,the page will jump in '
		return render(request, 'users/confirm.html', {"message":message,"la":"login"})
	

# 登陆账户
def login_view(request):
	if request.method == "POST":
		login_form = LoginForm(request.POST)
		if login_form.is_valid():
			cd = login_form.cleaned_data
			user = User.objects.filter(Q(username=cd['username'])|Q(email=cd['username']))
			# print(list(user))
			if len(user)>0:
				if user[0].check_password(cd['password']):
					user = user[0]
				else:
					user = None
			else:
				user = None
			if user:
				if user.is_active:
					# request.session["info"] = "infomation"
					'''用户登陆后，Django会自动调用默认的session应用，
						将用户的id存至session中，通常情况下，login与authenticate
						配合使用'''
					login(request, user)
					# request.session.set_expiry(0)  # 关闭浏览器自动退出登录
					user_profile = User_Profile.objects.get(user=user)
					request.session['identity'] = user_profile.status
					if not request.session.get('CART-ID'):
						if user_profile.shopping_cart != 0:
							request.session['CART-ID'] = user_profile.shopping_cart
						else:
							cart = Cart(request)
							user_profile.shopping_cart = request.session['CART-ID']
							user_profile.save()
					# print(user_profile)
					if user_profile.status == 1:
						return HttpResponseRedirect(reverse('goods:consumer'))
					elif user_profile.status == 2:
						return HttpResponseRedirect(reverse('goods:shops'))
					elif user_profile.status == 3 or user.is_superuser:
						return HttpResponseRedirect(reverse('goods:check_goods'))
				else:
					return render(request, 'users/login.html',
								  {"form": login_form,
								   'status': 'Please click the link in the confirm email to active your account!'})
			else:
				return render(request, 'users/login.html',
							  {"form": login_form, 'status': 'Incorrect username or password'})
		else:
			return render(request, 'users/login.html', {"form": login_form, 'status': '输入不合法'})
	elif request.method == "GET":
		if request.user.is_authenticated:
			user_profile = User_Profile.objects.get(user=request.user)
			if user_profile.status == 1:
				return HttpResponseRedirect(reverse('goods:consumer'))
			elif user_profile.status == 2:
				return HttpResponseRedirect(reverse('goods:shops'))
			elif user_profile.status == 3 or request.user.is_superuser:
				return HttpResponseRedirect(reverse('goods:check_goods'))
		else:
			login_form = LoginForm()
			return render(request, 'users/login.html', {"form": login_form})


# 注销账户
@login_required
def logout_view(request):
	request.session.clear()
	logout(request)
	return HttpResponseRedirect(reverse('users:login'))


def register(request):
	# 注册新用户
	if request.method != 'POST':
		# 显示空的注册表
		form = UserRegistrationForm()
		context = {'form': form}
		return render(request, 'users/register.html', context)
	else:
		# 处理填写好的表单
		form = UserRegistrationForm(data=request.POST)
		context = {'form':form}
		if form.is_valid():
			new_user = form.save()
			# authenticate_user = authenticate(username=new_user.username, password=request.POST['password1'])
			code = make_confirm_str(new_user)
			st = send_email(new_user.email, code)
			if st:
				context['success'] = 'A confirm email has sent to your email,please click the link to active your account'
			else:
				context['success'] = 'Email fail to send,please check you Email address'
				new_user.delete()
			# print(authenticate_user)
		return render(request, 'users/register.html',context)
		



def test(request):
	goodses = Goods.objects.filter(goods_type='韩都衣舍')
	for goods in goodses:
		goods.goods_type = '女装'
		goods.save()
	context = {}
	return render(request, "users/test.html", context)


@login_required
def modify(request):
	if request.method == 'GET':
		user = User_Profile.objects.filter(user=request.user)
		form = UserModifyForm({'username':request.user.username,'telephone':user[0].telephone})
		context = {'form': form}
		request.session['username'] = request.user.username
		request.session['email'] = request.user.email
		return render(request, 'users/modify.html', context)
	else:
		form1 = UserModifyForm(data=request.POST)
		status1 = ''
		if form1.is_valid():
			
			form = form1.cleaned_data
			
			username = form['username']
			if len(username) < 4:
				status1 = "Your username must be at least 4 characters."
			elif len(username) > 50:
				status1 = "Your username must be less than 50 characters."
			else:
				filter_result = User.objects.filter(username__exact=username)
				if len(filter_result) > 0 and filter_result[0].username != request.user.username:
					status1 = "Your username already exists."
				else:
					user = User_Profile.objects.filter(user=request.user)
					user = user[0]
					user.telephone = form['telephone']
					user.username = username
					user.save()
					# request.user.commit()
					status1 = 'Confirm successfully!'

		context = {'form':form1,'status':status1}
		return render(request,'users/modify.html',context)


@login_required
def logoff(request):
	request.user.delete()
	request.session.clear()
	return HttpResponseRedirect(reverse('users:login'))


def fdpassword(request):
	if request.method != 'POST':
		# 显示空的注册表
		form = FdPasswordForm()
		context = {'form': form}
		return render(request, 'users/forgetpassword.html', context)
	else:
		# 处理填写好的表单
		form = FdPasswordForm(data=request.POST)
		if form.is_valid():
			form = form.cleaned_data
			user = User.objects.get(email=form['email'])
			if user.is_active:
				context = {'form': FdPasswordForm(data=request.POST)}
				code = form['code']
				try:
					confirm = User_Confirm.objects.get(user=user)
				except:
					context['status'] = 'wrong email address!'
					return render(request, 'users/forgetpassword.html', context)
				c_time = confirm.c_time
				now = datetime.datetime.now()
				if now > c_time + datetime.timedelta(1):
					confirm.user.delete()
					context['status'] = '验证码已过期！'
					return render(request, 'users/forgetpassword.html', context)
				else:
					# print(confirm.user)
					confirm.user.set_password(form['password2'])
					confirm.user.save()
					login(request, confirm.user)
					confirm.delete()
					context['status'] = '密码重置成功！'
					return render(request, 'users/forgetpassword.html', context)
		
	
def send_code(request):
	email = request.GET.get('email')
	# print(email)
	user = User.objects.filter(email__exact=email)
	if len(user)<1:
		return HttpResponse('邮箱未注册！')
	user = user[0]
	if not user.is_active:
		return HttpResponse('Please confirm your email to active your account')
	filter_result = User_Confirm.objects.filter(user=user)
	if len(filter_result)==0:
		code = random.randint(1000, 9999)
		User_Confirm.objects.create(code=code,user=user)
	else:
		code = filter_result[0].code
	# 发送邮件主题和内容
	subject = "A email to modify password from buy_or_not"

	html_content = """<p>Your verification code is <U><B>{}</B></U>.If it's not your operation,please ignore.</p>
						<p></p>
						""".format(code)
	message = MIMEText(html_content, 'html', 'utf-8')
	message['Subject'] = Header(subject, 'utf-8')
	message['From'] = Header(settings.EMAIL_SENDER, 'utf-8')
	message['To'] = Header(email, 'utf-8')
	
	smtp = smtplib.SMTP_SSL(settings.EMAIL_HOST, 465)
	smtp.helo()
	smtp.ehlo()
	# 登录邮箱服务器用户名和密码
	smtp.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)
	
	# print("开始发送邮件...")
	try:
		smtp.sendmail(settings.EMAIL_HOST_USER, [email], message.as_string())
	except:
		smtp.quit()
		return HttpResponse(0)
	smtp.quit()
	return HttpResponse(1)


@login_required
def m_pwd(request):
	if request.method == 'GET':
		form = PwdModifyForm()
		context = {'form': form}
		return render(request, 'users/resetpassword.html', context)
	else:
		form1 = PwdModifyForm(data=request.POST)
		status1 = ''
		if form1.is_valid():
			
			form = form1.cleaned_data
			
			password = form['password']
			user = authenticate(username=request.user.username,password=password)
			if user is not None:
				# user = User.objects.get(id=request.user.id)
				user.set_password(form['password1'])
				user.save()
				login(request,user)
				status1 = 'Confirm successfully!'
			else:
				status1 = 'Old password is error!'

		context = {'form': form1, 'status': status1}
		return render(request, 'users/resetpassword.html', context)


def index(request):
		return render(request, 'users/index.html')
