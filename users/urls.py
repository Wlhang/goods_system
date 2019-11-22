# -*- coding:utf-8 -*-
# 为应用程序users定义URL模式

from django.urls import path,include,re_path
from . import views


urlpatterns = [
	# 登录页面
	path('login',views.login_view, name='login'),
	# 注销
	path("logout",views.logout_view,name='logout'),
	# 注册界面
	re_path(r'register/$',views.register,name='register'),
	# confirm
	path('confirm',views.confirm,name='confirm'),
	# 修改用户信息
	path('modify',views.modify,name='modify'),
	# 找回密码
	path('m_pwd',views.m_pwd,name='m_pwd'),
	# 找回密码
	path('fdpassword',views.fdpassword,name='fdpassword'),
	# 发送验证码
	path('send_code',views.send_code,name='send_code'),
	# 注销账户
	path('logoff',views.logoff,name='logoff'),
	# test
	path('test',views.test, name='test'),

	path('index', views.index, name='index'),
]
