# -*- coding:utf-8 -*-

from django.urls import path,include,re_path
from . import views

urlpatterns = [
	# 商铺页面
	path('shops',views.shops, name='shops'),
	# 添加商铺
	path('create_shops',views.create_shops, name='create_shops'),
	# 删除商铺
	path('delete_shops',views.delete_shops, name='delete_shops'),
	# 更新商铺
	path('update_shop',views.update_shop, name='update_shop'),
	# 商品管理页面
	path('manage/<int:a>',views.goods_manage, name='goods_manage'),
	# 添加商品
	path('create_goods',views.create_goods, name='create_goods'),
	# 修改商品信息
	path('detail/<int:a>/<int:b>',views.goods_detail, name='goods_detail'),
	# 审核主页
	path('check',views.check, name='check'),
	# 审核商品
	path('check_goods',views.check_goods, name='check_goods'),
	# 管理商铺
	path('manage_shops',views.manage_shops, name='manage_shops'),
	# 删除商铺
	path('delete_shops_<int:shop_id>',views.delete_shop, name='delete_shop'),
	# 管理搜索记录
	path('manage_search',views.manage_search, name='manage_search'),
	# 删除搜索记录
	path('delete_search_<int:search_id>',views.delete_search, name='delete_search'),
	# 审核商品详细信息
	path('check_goods_detail/<int:a>',views.check_goods_detail, name='check_goods_detail'),
	# 上架/下架/拒绝商品
	path('check_goods_operate',views.check_goods_operate, name='check_goods_operate'),
	# 删除商铺
	path('delete_goods',views.delete_goods, name='delete_goods'),
	# 消费者主页
	path('consumer',views.consumer,name='consumer'),
	# 商品详情
	path('c_goods_detail/<int:product_id>',views.c_goods_detail,name='c_goods_detail'),
	# 查看购物车
	path('shoppingcar',views.shoppingcar,name = 'shoppingcar'),
	# 增加商品到购物车
	path('additem/<int:product_id>/<int:quantity>',views.add_to_cart,name='additem-url'),
	# 从购物车删除商品
	path('removeitem/<int:product_id>',views.remove_from_cart,name='removeitem-url'),
	# 订单
	path('order',views.order,name='order'),
	# 我的订单
	path('myorders',views.myorders,name='myorders'),
	# 订单详情
	path('order_detail/<int:orderid>', views.order_detail, name='order_detail'),
	# 主页搜索
	path('search',views.search,name='search'),
	# 修改购物车中商品数量
	path('cart_modify/<int:product_id>/<int:quantity>',views.cart_modify,name='cart_modify'),
	# 商品类型
	path('consumer/<str:type>',views.type,name='type'),
	# 修改订单
	path('modifyorder/<int:orderid>', views.modify_order, name='modifyorder-url'),
	# 取消订单
	path('removeorder/<int:orderid>', views.remove_from_order, name='removeorder-url'),
	#付款页面
	path('pay/<int:orderid>',views.pay,name='pay-url'),
	#支付成功
	path('paymaney/<int:orderid>',views.pay_money,name='paymoney-url'),
	# 热搜
	path('hot_search',views.hot_search,name='hot_search'),
	# 管理订单
	path('manage_order', views.manage_order, name='manage_order'),
	# 管理删除订单
	path('deleteorder/<int:orderid>', views.deleteorder, name='deleteorder-url'),
	# 商家管理订单
	path('Merchant_orders', views.Merchant_orders,name='Merchant_orders'),
	# 商家确认订单
	path('confirm_order/<int:orderitem_id>', views.confirm_order,name='confirm_order'),
	# 立即购买订单
	path('buyorder/<int:product_id>/<int:quantity>',views.buyorder,name='buyorder'),
]



# TODO:bug 用隐藏层遮挡的文字依然能被鼠标选中，点击不放后拖动粘贴

