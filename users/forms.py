# -*- coding:utf-8 -*-
from django import forms
from .models import *
import re


def email_check(email):
	pattern = re.compile(r"\"?([-a-zA-Z0-9.`?{}]+@\w+\.\w+)\"?")
	return re.match(pattern, email)


class LoginForm(forms.Form):
	username = forms.CharField()
	password = forms.CharField(widget=forms.PasswordInput)


class UserRegistrationForm(forms.Form):
	username = forms.CharField(label='username', max_length=50, required=True)
	password1 = forms.CharField(label='password', max_length=50, widget=forms.PasswordInput, required=True)
	password2 = forms.CharField(label='Password Confirmation', widget=forms.PasswordInput, required=True)
	identity = forms.ChoiceField(choices=[(1, '消费者'), (2, '商家')], required=True)
	email = forms.EmailField(required=True)
	# status = forms.IntegerField(initial=0)# 0:未激活，1：消费者，2：商家，3：管理员
	telephone = forms.CharField(max_length=15, required=False)
	
	# Use clean methods to define custom validation rules
	
	def clean_username(self):
		username = self.cleaned_data.get('username')
	
		if len(username) < 4:
			raise forms.ValidationError("Your username must be at least 4 characters.")
		elif len(username) > 50:
			raise forms.ValidationError("Your username must be less than 50 characters.")
		else:
			filter_result = User.objects.filter(username__exact=username)
			if len(filter_result) > 0:
				raise forms.ValidationError("Your username already exists.")
	
		return username
	
	def clean_email(self):
		email = self.cleaned_data.get('email')
		
		if email_check(email):
			filter_result = User.objects.filter(email__exact=email)
			if len(filter_result) > 0:
				raise forms.ValidationError('Your email is exist')
		else:
			raise forms.ValidationError('Please enter a valid email')
		
		return email
	
	def clean_password2(self):
		password1 = self.cleaned_data.get('password1')
		password2 = self.cleaned_data.get('password2')
	
		if password2 != password1:
			raise forms.ValidationError("Password don't match")
		
		return password2
		
	class Meta:
		fields = ("identity", "username", "email", "password1", "password2", "telephone")
	
	def save(self, commit=True):
		# 使用内置User自带create_user方法创建用户，不需要使用save()
		user = User.objects.create_user(
			username=self.cleaned_data.get('username'),
			password=self.cleaned_data.get('password2'),
			email=self.cleaned_data.get('email'))
		user.is_active = False
		user.save()
		# 如果直接使用objects.create()方法后不需要使用save()
		user_profile = User_Profile(user=user)
		user_profile.status = self.cleaned_data["identity"]
		print(self.cleaned_data['identity'])
		user_profile.telephone = self.cleaned_data["telephone"]
		if commit:
			user_profile.save()
		return user


class UserModifyForm(forms.Form):
	username = forms.CharField(label='username', max_length=50, required=True)
	telephone = forms.CharField(max_length=15, required=False)
	
	class Meta:
		
		fields = ("username","telephone")


class FdPasswordForm(forms.Form):
	password1 = forms.CharField(label='New password', max_length=50, widget=forms.PasswordInput, required=True)
	password2 = forms.CharField(label='Password Confirmation', widget=forms.PasswordInput, required=True)
	email = forms.EmailField(required=True)
	code = forms.CharField(label='verification_code',required=True,max_length=5)
	
	# Use clean methods to define custom validation rules
	
	def clean_email(self):
		email = self.cleaned_data.get('email')
		
		if email_check(email):
			filter_result = User.objects.filter(email__exact=email)
			if len(filter_result) != 1:
				raise forms.ValidationError("Your email isn't exist")
		else:
			raise forms.ValidationError('Please enter a valid email')
		
		return email
	
	def clean_password2(self):
		password1 = self.cleaned_data.get('password1')
		password2 = self.cleaned_data.get('password2')
		
		if password2 != password1:
			raise forms.ValidationError("Password don't match")
		return password2
	
	
	class Meta:
		fields = ( "password1", "password2","email")


class PwdModifyForm(forms.Form):
	password = forms.CharField(label='Old_password', max_length=50, required=True)
	password1 = forms.CharField(label='New_password', max_length=50, widget=forms.PasswordInput, required=True)
	password2 = forms.CharField(label='Password Confirmation', widget=forms.PasswordInput, required=True)
	
	def clean_password2(self):
		password1 = self.cleaned_data.get('password1')
		password2 = self.cleaned_data.get('password2')
		
		if password2 != password1:
			raise forms.ValidationError("Password don't match")
		return password2
	
	class Meta:
		fields = ("password", "password1","password2")