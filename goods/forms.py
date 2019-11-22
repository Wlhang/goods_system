# -*- coding:utf-8 -*-
from django import forms
from django.forms import widgets
from .models import Shop
from django.forms import ModelForm
from . import models


class ShopCreateForm(forms.Form):
    name = forms.CharField(required=True,max_length=10)
    instruction = forms.CharField(required=True, max_length=100)
    
    class Meta:
        fields = {'name','instruction'}


class GoodsAddForm(forms.Form):
    goods_type = forms.CharField(required=True, max_length=10,widget=forms.TextInput(attrs={'style':'width:250px;'}))
    name = forms.CharField(required=True, max_length=50,widget=forms.TextInput(attrs={'style':'width:250px;'}))
    price = forms.FloatField(required=True, min_value=0,widget=forms.NumberInput(attrs={'style':'width:250px;'}))
    remain = forms.IntegerField(required=True, min_value=0, widget=forms.NumberInput(attrs={'style':'width:250px;'}))
    instruction = forms.CharField(required=True, max_length=200)
    location = forms.CharField(required=True, max_length=20)
    picture = forms.ImageField(required=True, label='',widget=forms.FileInput(attrs={'onchange':'changepic(this,"show")',
                            'style':'position:absolute;top:53%;right:10%;width:200px'}))
    
    class Meta:
        fields = {'name', 'picture', 'goods_type', 'price', 'remain', 'location','instruction'}
        
    
class SearchForm(forms.Form):
    search = forms.CharField(required=False, max_length=15)


class OrderForm(forms.ModelForm):
    class   Meta :
        model = models.Order
        fields = ['full_name','address','phone']
    def _init_(self, *args, **kwargs):
        super(OrderForm, self)._init_(*args, **kwargs)
        self.fields['full_name'].label = '收件人姓名'
        self.fields['address'].label = '邮寄地址'
        self.fields['phone'].label = '联络电话'


class Search_shops(forms.Form):
    name = forms.CharField(required=False, max_length=15)
    
    class Meta:
        fields = {'name','instruction'}
        
    def _init_(self, *args, **kwargs):
        super(Search_shops, self)._init_(*args, **kwargs)
        self.fields['full_name'].label = '收件人姓名'
        self.fields['address'].label = '邮寄地址'
        self.fields['phone'].label = '联络电话'