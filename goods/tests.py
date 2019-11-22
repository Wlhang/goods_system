from django.test import TestCase

# Create your tests here.
result_sale = '2+'
if result_sale[-1] == '+':
	result_sale = result_sale[:-1]
print(result_sale)