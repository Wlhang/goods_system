# -*- coding:utf-8 -*-
from urllib.request import urlretrieve
import random
import re
import django
import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "goods_system.settings")
django.setup()
from goods.models import *
import time
import requests
from io import BytesIO

# def get_ip_list(urlip, headers2):
# 	web_data = requests.get(urlip, headers=headers2)
# 	soup = BeautifulSoup(web_data.text, 'lxml')
# 	ips = soup.find_all('tr')
# 	ip_list = []
# 	for k in range(1, len(ips)):
# 		ip_info = ips[k]
# 		tds = ip_info.find_all('td')
# 		ip_list.append(tds[1].text + ':' + tds[2].text)
# 	return ip_list
#
#
# # -从代理IP列表里面随机选择一个
#
# def get_random_ip(ip_list):
# 	proxy_list = []
# 	for ip in ip_list:
# 		proxy_list.append('http://' + ip)
# 	proxy_ip = random.choice(proxy_list)
# 	proxie = {'http': proxy_ip}
# 	return proxie

def get_data(url):
	shop_id = input('请输入商铺id:')
	# shop_id = 1
	goods_type = input('请输入商品类型:')
	# goods_type = '男装'
	shop = Shop.objects.get(id=int(shop_id))
	url = url.format(goods_type)
	data1 = requests.get(url, headers=headers)
	if data1.status_code != 200:
		print("访问失败")
		exit(1)
	# data1 = '","view_sales":"1360人付款","comment_count":"763","user_'
	p_name = re.compile(r'\"raw_title\":\"(.*?)"')
	result_name = p_name.findall(data1.text)
	p_title = re.compile(r'\",\"title\":\"(.*?)"')
	result_title = p_title.findall(data1.text)
	p_pic = re.compile(r'\"pic_url\":\"(.*?)"')
	result_pic = p_pic.findall(data1.text)
	p_price = re.compile(r'\"view_price\":\"(\d+.\d+)\"')
	result_price = p_price.findall(data1.text)
	p_detail = re.compile(r'\"nid\":\"(.*?)\"')
	result_detail = p_detail.findall(data1.text)
	p_location = re.compile(r'\"item_loc\":\"(.*?)"')
	result_location = p_location.findall(data1.text)
	# headers['referer'] = "https://detail.tmall.com/item.htm?id=36612612630"
	# result_detail = ["601080271595"]
	result_sales = []
	result_remains = []
	print('共',len(result_detail),'件')
	for i in range(0, len(result_detail)):
		headers['referer'] = "https://detail.tmall.com/item.htm?id=" + result_detail[i]
		url = "https://mdskip.taobao.com/core/initItemDetail.htm?addressLevel=2&itemId=" + result_detail[i]
		# print(url)
		data1 = requests.get(url, headers=headers)
		p_sales = re.compile(r'\{\"sellCount\":\"(\d+.*?)\"')
		result_sale = p_sales.findall(data1.text)
		result_sale = result_sale[0]
		if result_sale[-1]=='+':
			result_sale = result_sale[:-1]
		if result_sale[-1] == '万':
			result_sale = int(float(result_sale[:-1])*10000)
		else:
			result_sale = int(result_sale)
		# result_sales.append(result_sale[0])
		p_remain = re.compile(r'\"icTotalQuantity\":(\d+),')
		result_remain = p_remain.findall(data1.text)
		# result_remains.append(result_remain[0])
		goods = Goods.objects.create(store_id=shop,picture='')
		try:
			goods.goods_type = goods_type
			goods.name = result_name[i]
			goods.price = float(result_price[i])
			goods.sales = result_sale
			goods.remain = int(result_remain[0])
			goods.instruction = result_title[i]
			goods.location = result_location[i]
			goods.status = 1
			path = os.getcwd() + "\\media\\picture\\" + str(shop_id)
			if not os.path.exists(path):
				os.mkdir(path)
			goods.picture = "\\media\\picture\\" + str(shop_id) + "\\" + str(goods.id)+".jpg"
			urlretrieve("https:" + result_pic[i], path + "\\" + str(goods.id)+".jpg")
			goods.save()
		except:
			goods.delete()
		print(i+1, result_name[i])
		

if __name__ == '__main__':
	headers = {
		"Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
		"Accept-Encoding": "gzip, deflate, br",
		"Accept-Language": "zh-CN,zh;q=0.9",
		"Connection": "keep-alive",
		"Cookie": "cna=tjMpE9YauGECAXLeZGFLUznk; sm4=320100; _uab_collina=152058413897913145216031; pnm_cku822=; otherx=e%3D1%26p%3D*%26s%3D0%26c%3D0%26f%3D0%26g%3D0%26t%3D0; x=__ll%3D-1%26_ato%3D0; _m_h5_tk=7c6dab5ccb42198ade6ec1daad34e39b_1520862817482; _m_h5_tk_enc=b9e1cbaca8ccf57974949163bc2a803c; enc=hkaY3ygXQxunIOmcGTFafCWDWshcTDyH3k%2BeFF4udFWgiY9zbzxj5enKRh8urFfF2OAuKlnjGjlmHaZrs2e6Qg%3D%3D; cq=ccp%3D1; _umdata=ED82BDCEC1AA6EB9E432E398B8AD2D71586383BB7CF4661452A95DBBFD222F83C42B68B5EFF22D0FCD43AD3E795C914C70B4D2BBDC563BCF2A3612DABA6ABF7A; t=1b3ad2958e360beb21fb446af63c4fe9; uc3=nk2=F6k3HMWzuBrPC%2BRLIiAII%2BQ%3D&id2=UUGq11NV4uvldQ%3D%3D&vt3=F8dBz4W93ZR%2BpG1n%2Fy8%3D&lg2=U%2BGCWk%2F75gdr5Q%3D%3D; tracknick=t_1478791923577_0; lgc=t_1478791923577_0; _tb_token_=7a5353575678f; cookie2=18297d50aa5d67d47b4155b80ba4b7f6; isg=BA8PV-0eia4wjo1YVPh-bYNZnqPZnGIxQAl-zyEcq36F8C_yKQTzpg3h9iDOiDvO",
		"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36"
	}
	headers2 = {
		"User-Agent": "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36",
		"referer": "https://detail.tmall.com/item.htm?&id=564330402319"
	}
	url = "https://s.taobao.com/search?q={}&imgfile=&js=1&stats_click=search_radio_all%3A1&initiative_id=staobaoz_20191016&ie=utf8&bcoffset=0&ntoffset=6&p4ppushleft=1%2C48&s=132"
	# url = "https://mdskip.taobao.com/core/initItemDetail.htm?itemId=36612612630"
	get_data(url)
	
	
	




