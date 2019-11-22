from django.contrib import admin

# Register your models here.

from django.apps import apps
from .models import *

admin.site.register(User_Profile)
admin.site.register(User_Confirm)
admin.site.register(Shop)

