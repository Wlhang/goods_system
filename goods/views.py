from django.shortcuts import render
from django.http import HttpResponseRedirect,HttpResponse
from django.urls import reverse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .forms import *
from .models import *
from users.models import User_Profile
import os
import time
import math
from cart.cart import Cart
from django.contrib import messages
from django.db.models import Count
from django.core.paginator import Paginator,EmptyPage, PageNotAnInteger
from itertools import chain


def check(request,a):
	if not request.session['identity'] in a:
		# print(111)
		# exit(0)
		return HttpResponse(
			'<div style="position:absolute;left:45%;top:10%;"><h1 style="color:red;">非法访问</h1></div>')


def get_goods(s,s_t,a,key,status):
	if s_t == None:
		s_t = 1
	order = ""
	s_t = int(s_t)
	if s != '2' and s != '3' and s != '4':
		s = '1'
	dic_s = {
		'1': 'id',
		'2': 'sales',
		'3': 'price',
		'4': 'remain',
	}
	if s_t & int(math.pow(2, int(s)-1)) == 0:
		order = '-'
	if a != -1:
		goodses = Goods.objects.filter(store_id=a).order_by(order + dic_s[s])
	else:
		dic_s['1'] = 'modify_time'
		# print(order + dic_s[s])
		goodses = Goods.objects.all().order_by(order + dic_s[s])
	if key!=None:
		goodses = goodses.filter(name__contains=key)
	if status!=-1:
		goodses = goodses.filter(status=status)
	return goodses
	
# Create your views here.
@login_required
def goods_manage(request,a):
	request.session['goods_manage'] = request.get_full_path()
	shop = Shop.objects.get(id=a)
	if request.user.is_authenticated and shop.owner == request.user:
		s = request.GET.get('sort')
		s_t = request.GET.get('v')
		page = request.GET.get('Page')
		key = request.GET.get('search')
		status = request.GET.get('status')
		if status==None:
			status = '全部'
		status_dic = {
			'全部':-1,
			'已上架':1,
			'待审核':0,
			'已拒绝':2,
			'已下架':3,
		}
		if page != None:
			page = int(page)
		else:
			page = 1
		if s == None:
			s = 1
		if s_t == None:
			s_t = 1
		goodses = get_goods(s,s_t,a,key,status_dic[status])
		
		goods_form = GoodsAddForm()
		search = SearchForm({
					'search':key,
		})
		total_goods = len(goodses)
		total_page = total_goods//24+1
		page_a = (page - 1) * 24
		page_b = page * 24
		if page_b>total_goods:
			page_b = total_goods
		goodses = goodses[page_a:page_b]
		context = {
			"goodses": goodses,
			"shop": shop,
			"form": goods_form,
			"time": time.time(),
			"s_t": s_t,
			'sort': s,
			'form2': search,
			"total_page": total_page,
			"total_goods": total_goods,
			'page': page,
			'key': key,
			'status_sort':status,
		}
		# print(s,type(s))
		return render(request, 'goods/goods_manage.html', context)
	else:
		return HttpResponseRedirect(reverse('users:login'))
			
			
@login_required
def shops(request):
	if request.user.is_superuser or request.session['identity'] == 2:
		shops = Shop.objects.filter(owner=request.user)
		form = ShopCreateForm()
		context = {
			"shops":shops,
			"form":form,
		}
		return render(request, 'goods/shops.html', context)
	else:
		return HttpResponseRedirect(reverse('users:login'))


@login_required
def create_shops(request):
	if request.method == 'POST' and request.session['identity']==2:
		shop_form = ShopCreateForm(data=request.POST)
		context = {'form':shop_form}
		if shop_form.is_valid():
			form = shop_form.cleaned_data
			# print(form)
			shop = Shop.objects.filter(owner=request.user, name=form['name'])
			if len(shop)>0:
				context['status'] = '该商铺已存在'
				return HttpResponse(0)
			else:
				Shop.objects.create(owner=request.user, name=form['name'], instruction=form['instruction'])
				context['status'] = '添加成功'
				return HttpResponse(1)
			
			
@login_required
def update_shop(request):
	if request.method == 'POST' and request.session['identity']==2:
		name = request.POST.get("name")
		instruction = request.POST.get("instruction")
		shop_id = int(request.POST.get("shop_id"))
		shop = Shop.objects.get(id=shop_id)
		shop.name = name
		shop.instruction = instruction
		shop.save()
		return HttpResponseRedirect(reverse('goods:goods_manage',kwargs={'a':shop_id}))
	
	
@login_required
def delete_shops(request):
	if request.session['identity']==2:
		id = request.GET.get('shop_id')
		shop = Shop.objects.filter(id=id)
		if len(shop)<1:
			return HttpResponse(0)
		elif len(shop)==1:
			shop = shop[0]
			if shop.owner == request.user:
				goodses = shop.goods_set.all()
				for goods in goodses:
					os.remove(os.getcwd() + "\\goods\\media\\picture\\" + str(shop.id) + "\\" + goods.picture.split('\\')[-1])
				os.removedirs(os.getcwd() + "\\goods\\media\\picture\\" + str(shop.id))
				shop.delete()
				return HttpResponse(1)
			else:
				return HttpResponse(2)


@login_required
def delete_goods(request):
	if request.session['identity'] == 2 or request.session['identity'] == 3:
		id = request.GET.get('good_id')
		goods = Goods.objects.filter(id=id)
		if len(goods)<1:
			return HttpResponse(0)
		elif len(goods)==1:
			goods = goods[0]
			shop = Shop.objects.get(id=goods.store_id.id)
			if shop.owner == request.user:
				os.remove(os.getcwd() + "\\goods\\media\\picture\\" + str(shop.id) + "\\" + goods.picture.split('\\')[-1])
				goods.delete()
				return HttpResponse(1)
			else:
				return HttpResponse(2)
		

@login_required
def create_goods(request):
	if request.method == 'POST' and request.session['identity'] == 2:
		goods_form = GoodsAddForm(request.POST, request.FILES)
		context = {'form':goods_form}
		if goods_form.is_valid():
			form = goods_form.cleaned_data
			shop = Shop.objects.get(id=int(request.POST.get('shop_id')))
			goods = Goods.objects.create(store_id=shop,picture="")
			try:
				goods.goods_type = form['goods_type']
				goods.name = form['name']
				goods.price = form['price']
				goods.sales = 0
				goods.remain = int(form['remain'])
				goods.instruction = form['instruction']
				goods.location = form['location']
				path = os.getcwd() + "\\goods\\media\\picture\\" + str(request.POST.get('shop_id'))
				if not os.path.exists(path):
					os.mkdir(path)
				ti = str(form['picture']).split('.')[-1].lower()
				goods.picture = "\\media\\picture\\" + str(request.POST.get('shop_id')) + "\\" + str(goods.id) + "." + ti
				# print(goods.picture)
				doc = open(os.getcwd() + "\\goods" + goods.picture, "wb")
				for chunk in request.FILES.get('picture').chunks():
					doc.write(chunk)
				doc.close()
				goods.save()
			except Exception as e:
				# print(e)
				goods.delete()
				return HttpResponse(0)
			context['status'] = '添加成功'
			return HttpResponse(1)
		else:
			return HttpResponse(0)


def goods_detail(request,a,b):
	if request.method != 'POST' and request.session['identity']==2:
		goodss = Goods.objects.filter(id=b)
		if len(goodss)==1:
			goods = goodss[0]
			form = GoodsAddForm({'goods_type': goods.goods_type,
								 'name': goods.name,
								 'price': goods.price,
								 'remain': goods.remain,
								 'instruction': goods.instruction,
								 'location': goods.location,
								 })
			context = {
				'form':form,
				'picture': goods.picture +"?"+ str(time.time()),
				'shop_id': a,
				'code': 0,
				'goods_id':b,
				'goods':goods,
				'url':request.session['goods_manage']
			}
			# print(request.session['goods_manage'])
			return render(request,'goods/edit_goods.html',context)
		else:
			return HttpResponse('<div style="position:absolute;left:45%;top:10%;"><h1 style="color:red;">非法访问</h1></div>')
	else:
		form = GoodsAddForm(request.POST, request.FILES)
		goodss = Goods.objects.filter(id=b)
		context = {'form': form}
		if len(goodss) == 1:
			goods = goodss[0]
			# 'name', 'picture', 'goods_type', 'price', 'remain', 'location','instruction'
			try:
				goods.goods_type = form['goods_type'].data
				goods.name = form['name'].data
				goods.price = form['price'].data
				goods.remain = int(form['remain'].data)
				goods.instruction = form['instruction'].data
				goods.location = form['location'].data
				goods.status = 0
				if form['picture'].data != None:
					doc = open(os.getcwd() + "\\goods" + goods.picture, "wb")
					# print(os.getcwd() + "\\goods" + goods.picture)
					for chunk in request.FILES.get('picture').chunks():
						doc.write(chunk)
					doc.close()
				goods.save()
			except Exception as e:
				# print(e)
				context['picture'] = goods.picture +"?"+ str(time.time())
				context['code'] = 0
				return render(request,'goods/edit_goods.html',context)
			context['code'] = 1
			context['shop_id'] = a
			context['picture'] = goods.picture +"?"+ str(time.time())
			context['success'] = 1
			# print(context)
			return render(request,'goods/edit_goods.html',context)
		else:
			return HttpResponse(
				'<div style="position:absolute;left:45%;top:10%;"><h1 style="color:red;">非法访问</h1></div>')


def check_goods(request):
	if request.method == 'GET':
		request.session['goods_manage'] = request.get_full_path()
		if request.user.is_authenticated and request.session['identity']==3:
			s = request.GET.get('sort')
			s_t = request.GET.get('v')
			page = request.GET.get('Page')
			key = request.GET.get('search')
			status = request.GET.get('status')
			if status == None:
				status = '全部'
			status_dic = {
				'全部': -1,
				'已上架': 1,
				'待审核': 0,
				'已拒绝': 2,
				'已下架': 3,
			}
			if page != None:
				page = int(page)
			else:
				page = 1
			if s == None:
				s = 1
			if s_t == None:
				s_t = 1
			goodses = get_goods(s, s_t, -1, key, status_dic[status])
			goods_form = GoodsAddForm()
			search = SearchForm({
				'search': key,
			})
			total_goods = len(goodses)
			total_page = total_goods // 24 + 1
			page_a = (page - 1) * 24
			page_b = page * 24
			if page_b > total_goods:
				page_b = total_goods
			goodses = goodses[page_a:page_b]
			context = {
				"goodses": goodses,
				"form": goods_form,
				"time": time.time(),
				"s_t": s_t,
				'sort': s,
				'form2': search,
				"total_page": total_page,
				"total_goods": total_goods,
				'page': page,
				'key': key,
				'status_sort': status,
			}
			context['active1'] = 'active'
			# print(s,type(s))
			return render(request, 'goods/check_goods.html', context)
		else:
			return HttpResponseRedirect(reverse('users:login'))


@login_required
def check_goods_detail(request,a):
	if not request.session['identity']==3:
		return HttpResponse('<div style="position:absolute;left:45%;top:10%;"><h1 style="color:red;">非法访问</h1></div>')
	if request.method != 'POST':
		goodss = Goods.objects.filter(id=a)
		if len(goodss)==1:
			goods = goodss[0]
			context = {
				'picture': goods.picture +"?"+ str(time.time()),
				'code': 0,
				'goods_id':a,
				'goods':goods,
				'url':request.session['goods_manage']
			}
			# print(request.session['goods_manage'])
			return render(request,'goods/check_goods_detail.html',context)
		else:
			return HttpResponse('<div style="position:absolute;left:45%;top:10%;"><h1 style="color:red;">非法访问</h1></div>')


@login_required
def check_goods_operate(request):
	if request.session['identity']==3:
		goods_id = request.GET.get('goods_id')
		operate = request.GET.get('operate')
		# print(goods_id)
		goods = Goods.objects.get(id=goods_id)
		goods.status = int(operate)
		goods.save()
		return HttpResponse(1)
	elif request.GET.get('operate') == '3':
		goods_id = request.GET.get('goods_id')
		goods = Goods.objects.get(id=goods_id)
		shop = Shop.objects.get(id=goods.store_id.id)
		if shop.owner == request.user:
			goods.status = 3
			goods.save()
			return HttpResponse(1)
		else:
			return HttpResponse(2)
	else:
		return HttpResponse(2)


@login_required
def consumer(request):
	if 'identity' not in request.session or (request.session['identity'] != 1 and request.session['identity'] != 3):
		return HttpResponseRedirect(reverse('users:login'))
	s = request.GET.get('sort')
	s_t = request.GET.get('v')
	page = request.GET.get('Page')
	key = request.GET.get('search')
	if key != None:
		Search.objects.create(name=request.user, key=key)
	if page != None:
		page = int(page)
	else:
		page = 1
	if s == None:
		s = 1
	if s_t == None:
		s_t = 1
	all_goods = get_goods(s, s_t, -1, key, 1)
	paginator = Paginator(all_goods,12)
	try:
		products = paginator.page(page)
	except PageNotAnInteger:
		products = paginator.page(1)
	except EmptyPage:
		products = paginator.page(paginator.num_pages)
	# print(products.paginator.num_pages)
	search = SearchForm({'search': key,})
	context = {"products":products,
			   "form2": search,
			   'key': key,
			   's_t': s_t,
			   's': s,
			   }
	return render(request, 'goods/consumer.html',context)


@login_required
def c_goods_detail(request,product_id):
	try:
		product = Goods.objects.get(id =product_id)
	except:
		product =None
	return render(request,'goods/c_goods_detail.html',{"product":product})


@login_required
def add_to_cart(request,product_id,quantity):
	if request.session['identity']!=2:
		try:
			product = Goods.objects.get(id =product_id)
			cart = Cart(request)
			cart.add(product,product.price,quantity)
			return HttpResponse(1)
		except:
			return HttpResponse(2)


@login_required
def remove_from_cart(request,product_id):
	if request.session['identity'] != 2:
		product = Goods.objects.get(id=product_id)
		cart = Cart(request)
		cart.remove(product)
		return HttpResponseRedirect(reverse('goods:shoppingcar'))


@login_required
def shoppingcar(request):
	if request.session['identity'] != 2:
		return render(request,'goods/shoppingcar.html',{'cart': Cart(request)})


@login_required
def order(request):
	if request.session['identity'] == 1 or request.session['identity']==3:
		cart = Cart(request)
		if request.method =='POST':
			user = User.objects.get(username=request.user.username)
			new_order =Order(user=user)
			form = OrderForm(request.POST, instance = new_order)
			if form.is_valid():
				order = form.save()
				total= cart.summary()
				order.totalprice =total
				order.save()
				for item in cart:
					it = OrderItem.objects.create(order=order,product =item.product,price = item.product.price,quantity=item.quantity,name =item.product.name)
					it.product.sales += item.quantity
					it.product.remain -= item.quantity
					it.product.save()
			cart.clear()
			messages.add_message(request,messages.INFO,"订单已保存，我们会尽快处理！")
			return HttpResponseRedirect(reverse('goods:myorders'))
		else :
			form = OrderForm()
		return render(request,'goods/order.html',{'cart': Cart(request),'form':form})


@login_required
def myorders(request):
	if request.session['identity'] != 2:
		orders = Order.objects.filter(user = request.user)
		return render(request,'goods/myorders.html',{"orders": orders})


@login_required
def order_detail(request,orderid):
	if request.session['identity'] != 2:
		try:
			orders = OrderItem.objects.filter(order_id = orderid)
		except:
			orders =None
	
		return render(request,'goods/order_detail.html',{"orders":orders})


@login_required
def search(request):
	s = request.GET.get('sort')
	s_t = request.GET.get('v')
	page = request.GET.get('Page')
	key = request.GET.get('search')
	if key != None:
		Search.objects.create(name=request.user, key=key)
	if page != None:
		page = int(page)
	else:
		page = 1
	if s == None:
		s = 1
	if s_t == None:
		s_t = 1
	goodses = get_goods(s, s_t, -1, key, 1)
	search = SearchForm({
		'search': key,
	})
	paginator = Paginator(goodses, 12)
	try:
		products = paginator.page(page)
	except PageNotAnInteger:
		products = paginator.page(1)
	except EmptyPage:
		products = paginator.page(paginator.num_pages)
	# print(products.paginator.num_pages)
	context = {"products": products,
			   "form2": search,
			   'key': key,
			   's_t': s_t,
			   's': s,
			   }
	return render(request, 'goods/consumer.html', context)


def cart_modify(request,product_id,quantity):
	if request.session['identity'] == 1 or request.session['identity'] == 3:
		try:
			product = Goods.objects.get(id =product_id)
			cart = Cart(request)
			if quantity < 0:
				quantity = 0
			remain = Goods.objects.get(id=product_id).remain
			if quantity <= remain:
				cart.update(product,quantity,product.price)
				summary = cart.summary()
				return HttpResponse(str(product.price * quantity) + ' ' + str(summary) + ' 1')
			else:
				summary = cart.summary()
				return HttpResponse(str(product.price*quantity) + ' ' + str(summary) +' 库存不足')
		except:
			return HttpResponse(-1)
	

# def check(request):
# 	return render(request,'goods/check.html')


@login_required
def type(request,type):
	# print(request.session['identity'])
	if 'identity' not in request.session or (request.session['identity'] != 1 and request.session['identity'] != 3):
		return HttpResponseRedirect(reverse('users:login'))
	s = request.GET.get('sort')
	s_t = request.GET.get('v')
	page = request.GET.get('Page')
	key = request.GET.get('search')
	if key != None:
		Search.objects.create(name=request.user, key=key)
	if page != None:
		page = int(page)
	else:
		page = 1
	if s == None:
		s = 1
	if s_t == None:
		s_t = 1
	goodses = get_goods(s, s_t, -1, key, 1)
	all_goods = goodses.filter(goods_type=type)
	paginator = Paginator(all_goods,12)
	try:
		products = paginator.page(page)
	except PageNotAnInteger:
		products = paginator.page(1)
	except EmptyPage:
		products = paginator.page(paginator.num_pages)
	# print(products.paginator.num_pages)
	search = SearchForm({'search': key,})
	context = {"products":products,
			   "form2": search,
			   'key': key,
			   's_t': s_t,
			   's': s,
			   }
	return render(request, 'goods/consumer.html',context)


@login_required
def manage_shops(request):
	if request.session['identity'] == 3:
		if request.method == 'GET':
			shops = Shop.objects.all()
			paginator = Paginator(shops, 10)
			shops = paginator.page(1)
			return render(request,'goods/manage_shop.html',{'shops': shops,'page':1,'active2':'active'})
		elif request.method == 'POST':
			search_dict = {}
			if request.POST['shop_name'] != '':
				search_dict['name__contains'] = request.POST['shop_name']
			if request.POST['shop_instruction'] != '':
				search_dict['instruction__contains'] = request.POST['shop_instruction']
			if request.POST['shop_owner'] != '':
				search_dict['owner__username__contains'] = request.POST['shop_owner']
			# tr = lambda x:"" if x== None else x
			shops = Shop.objects.filter(**search_dict)
			paginator = Paginator(shops, 10)
			try:
				shops = paginator.page(request.POST['page'])
			except PageNotAnInteger:
				shops = paginator.page(1)
			except EmptyPage:
				shops = paginator.page(paginator.num_pages)
			search_dict['shops'] = shops
			search_dict['active2'] = 'active'
			return render(request,'goods/manage_shop.html',search_dict)


@login_required
def delete_shop(request,shop_id):
	# print(shop_id)
	try:
		shop = Shop.objects.get(id=shop_id)
	except:
		return HttpResponse('error')
	if shop.owner == request.user or request.session['identity'] == 3:
		shop.delete()
	else:
		return HttpResponse('error')
	return HttpResponseRedirect(reverse('goods:manage_shops'))


@login_required
def manage_search(request):
	if request.method == 'GET':
		searches = Search.objects.all().order_by('time')
		paginator = Paginator(searches, 10)
		searches = paginator.page(1)
		return render(request,'goods/manage_search.html',{'searches': searches,'page':1,'active3':'active'})
	elif request.method == 'POST':
		search_dict = {}
		if request.POST['key'] != '':
			search_dict['key__contains'] = request.POST['key']
		if request.POST['name'] != '':
			search_dict['name__username__contains'] = request.POST['name']
		# tr = lambda x:"" if x== None else x
		searches = Search.objects.filter(**search_dict).order_by('time')
		paginator = Paginator(searches, 10)
		try:
			searches = paginator.page(request.POST['page'])
		except PageNotAnInteger:
			searches = paginator.page(1)
		except EmptyPage:
			searches = paginator.page(paginator.num_pages)
		search_dict['searches'] = searches
		search_dict['active3'] = 'active'
		return render(request,'goods/manage_search.html',search_dict)


@login_required
def delete_search(request,search_id):
	# print(shop_id)
	try:
		search = Shop.objects.get(id=search_id)
	except:
		return HttpResponse('error')
	if search.owner == request.user or request.session['identity'] == 3:
		search.delete()
	else:
		return HttpResponse('error')
	return HttpResponseRedirect(reverse('goods:manage_shops'))


@login_required
def modify_order(request,orderid):
	orders = Order.objects.get(id =orderid)
	if request.method =='POST':
		try:
			form = OrderForm(request.POST, instance = orders)
			if form.is_valid():
				orders = form.save()
				orders.save()
				return render(request, 'goods/modify.html', {"orders": orders, 'form': form,'a':1})
		except:
			return render(request, 'goods/modify.html', {"orders": orders, 'form': form,'a':2})
	else :
		form = OrderForm()
		return render(request,'goods/modify.html',{"orders":orders,'form':form,'a':0})


@login_required
def remove_from_order(request,orderid):
	orders = Order.objects.get(id =orderid)
	items = OrderItem.objects.filter(order=orders)
	for item in items:
		item.product.sales -= item.quantity
		item.product.remain += item.quantity
		item.product.save()
		print(item.quantity, item.product.sales, item.product.remain)
	orders.delete()
	return HttpResponseRedirect(reverse('goods:myorders'))


@login_required
def pay(request,orderid):
	try:
		orders = OrderItem.objects.filter(order_id = orderid)
		order1 = Order.objects.get(id=orderid)
	except:
		orders = None
		order1 = None
	return render(request,'goods/pay.html',{"orders":orders,'order1':order1})


@login_required
def pay_money(request,orderid):
	try:
		orders = Order.objects.get(id=orderid)
		orders.paid = 1
		orders.save()
		return HttpResponse(1)
	except:
		return HttpResponse(0)

@login_required
def hot_search(request):
	hot_search = Search.objects.values('key').annotate(Count=Count("key"))
	hot_s = ""
	count = 0
	for s in hot_search:
		if s['key'] != '' and count < 3:
			hot_s += s['key'] + ' '
			count += 1
	return HttpResponse(hot_s)


@login_required
def manage_order(request):
		if request.method == 'GET':
			orders = Order.objects.all().order_by('created_at')
			paginator = Paginator(orders, 10)
			orders = paginator.page(1)
			return render(request, 'goods/manage_order.html', {'orders': orders, 'page': 1,'active4':'active'})
		elif request.method == 'POST':
			order_dict = {}
			if request.POST['address'] != '':
				order_dict['address__contains'] = request.POST['address']
			if request.POST['phone'] != '':
				order_dict['phone__contains'] = request.POST['phone']
			if request.POST['user'] != '':
				order_dict['full_name__contains'] = request.POST['user']
			# tr = lambda x:"" if x== None else x
			orders = Order.objects.filter(**order_dict)
			paginator = Paginator(orders, 10)
			try:
				orders = paginator.page(request.POST['page'])
			except PageNotAnInteger:
				orders = paginator.page(1)
			except EmptyPage:
				orders = paginator.page(paginator.num_pages)
			order_dict['orders'] = orders
			order_dict['active4'] = 'active'
			return render(request,'goods/manage_order.html',order_dict)


@login_required
def deleteorder(request,orderid):
	if request.session['identity'] == 3:
		orders = Order.objects.get(id =orderid)
		orders.delete()
		return HttpResponseRedirect(reverse('goods:manage_order'))


@login_required
def Merchant_orders(request):
	if request.session['identity'] == 2:
		if request.method == 'GET':
			orders =  OrderItem.objects.filter(product__store_id__owner=request.user, order__paid=1).order_by('status')
			paginator = Paginator(orders, 8)
			orders = paginator.page(1)
			return render(request, 'goods/merchant_orders.html', {'orders': orders, 'page': 1})
		elif request.method == 'POST':
			order_dict = {}
			if request.POST['product_id'] != '':
				order_dict['product__id__contains'] = request.POST['product_id']
			if request.POST['product_name'] != '':
				order_dict['product__name__contains'] = request.POST['product_name']
			if request.POST['order_id'] != '':
				order_dict['order__id__contains'] = request.POST['order_id']
			# tr = lambda x:"" if x== None else x
			orders = OrderItem.objects.filter(**order_dict,product__store_id__owner=request.user,order__paid=1)
			# orders = orders.filter()
			paginator = Paginator(orders, 8)
			try:
				orders = paginator.page(request.POST['page'])
			except PageNotAnInteger:
				orders = paginator.page(1)
			except EmptyPage:
				orders = paginator.page(paginator.num_pages)
			order_dict['orders'] = orders
			return render(request, 'goods/merchant_orders.html', order_dict)
	

def confirm_order(request,orderitem_id):
	try:
		orderitem = OrderItem.objects.get(id=orderitem_id)
		if orderitem.product.store_id.owner == request.user:
			orderitem.status = True
			orderitem.order.status = True
			orderitem.save()
			orderitem.order.save()
			return HttpResponse(1)
		else:
			return HttpResponse(0)
	except:
		return HttpResponse(0)


@login_required
def buyorder(request,product_id,quantity):
	# print(quantity)
	product = Goods.objects.get(id =product_id)
	if request.method =='POST':
		user = User.objects.get(username=request.user.username)
		new_order =Order(user=user)
		form = OrderForm(request.POST, instance = new_order)
		if form.is_valid():
			order = form.save()
			order.totalprice = product.price
			order.save()
			it = OrderItem.objects.create(order = order,product = product,price =product.price,quantity=quantity,name=product.name)
			it.product.sales += quantity
			it.product.remain -= quantity
			it.product.save()
		messages.add_message(request,messages.INFO,"订单已保存，我们会尽快处理！")
		return HttpResponseRedirect(reverse('goods:myorders'))
	else :
		form = OrderForm()
		return render(request, 'goods/buy_order.html', {'product': product, 'form': form, 'quantity': quantity})