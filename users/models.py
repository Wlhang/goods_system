from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class User_Profile(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
	status = models.IntegerField(default=0)# 0:未激活，1：消费者，2：商家，3：管理员
	telephone = models.CharField('telephone',max_length=15,blank=True)
	shopping_cart = models.IntegerField(default=0)
	
	class Meta:
		verbose_name = 'User_Profile'
		
	def __str__(self):
		return self.user.__str__()
	

class User_Confirm(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	code = models.CharField(max_length=100)
	c_time = models.DateTimeField(auto_now_add=True)
	
	def __str__(self):
		return self.user.username + ": " + self.code
	
	class Meta:
		ordering = ["c_time"]
		verbose_name = 'confirm_code'  # admin中管理界面的显示
		verbose_name_plural = 'confirm_code'  # 显示的复数形式
	
		
class Shop(models.Model):
	owner = models.ForeignKey(User,on_delete=models.CASCADE)
	name = models.CharField(max_length=50)
	instruction = models.CharField(max_length=100,default="")
	
	def __str__(self):
		return self.name
	
	

	
