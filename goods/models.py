from django.db import models
from users.models import Shop,User
from cart.cart import Cart
from cart.models import Cart as Ca,Item


# Create your models here.
class Goods(models.Model):
	store_id = models.ForeignKey(Shop, on_delete=models.CASCADE)
	goods_type = models.CharField(max_length=20)
	name = models.CharField(max_length=50)
	price = models.FloatField(default=0)
	sales = models.IntegerField(default=0)
	remain = models.IntegerField(default=0)
	instruction = models.TextField(max_length=200)
	location = models.CharField(max_length=20)
	picture = models.CharField(max_length=50,default=None)
	status = models.IntegerField(default=0) # 0：待审核；1：已通过；2：已拒绝；3：已下架
	modify_time = models.TimeField(auto_now=True)
	
	def __str__(self):
		return self.name
	

class Search(models.Model):
	name = models.ForeignKey(User, on_delete=models.CASCADE)
	key = models.CharField(max_length=30)
	time = models.DateTimeField(auto_now_add=True)
	# time.editable = True
	
	def __str__(self):
		return self.key


class Order(models.Model):
	user = models.ForeignKey(User,on_delete=models.CASCADE)
	full_name = models.CharField(max_length=20)
	address = models.CharField(max_length=200)
	phone = models.CharField(max_length=15)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	paid = models.BooleanField(default=False)
	totalprice = models.FloatField(default=0)
	status = models.BooleanField(default=False)# 商家是否确认

	class Meta:
		ordering = ('-created_at',)

	def __str__(self):
		return 'Order:{}'.format(self.id)


class OrderItem(models.Model):
	order = models.ForeignKey(Order,on_delete=models.CASCADE,related_name='items')
	product = models.ForeignKey(Goods,on_delete=models.CASCADE)
	price = models.DecimalField(max_digits=8,decimal_places=2)
	quantity = models.PositiveIntegerField(default=1)
	name = models.CharField(max_length=50, default=None)
	status = models.BooleanField(default=False)
	
	def total(self):
		return self.price * self.quantity

	def __str__(self):
		return '{}'.format(self.id)
