from django.contrib import admin

# Register your models here.
from .models import *


admin.site.register(Goods)
admin.site.register(Search)
admin.site.register(Order)
admin.site.register(OrderItem)
admin.site.register(Ca)
admin.site.register(Item)