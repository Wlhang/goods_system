from django.test import TestCase

# Create your tests here.
import smtplib
from email.mime.text import MIMEText
from email.header import Header


# 发送邮箱服务器
smtpserver='smtp.yeah.net'
password = 'Wulihang12'
user = str('lihangw@yeah.net')

sender = 'lihangw@yeah.net'
receivers = ['2380383965@qq.com']  # 接收邮件，可设置为你的QQ邮箱或者其他邮箱

# smtpserver='smtp.qq.com'
# password = 'yvzizseqgwczeaca'
# user = str('2380383965@qq.com')
#
# sender = '2380383965@qq.com'

#发送邮件主题和内容
subject='Web Selenium 自动化测试报告'
content='<html><h1 style="color:red">自动化测试报告!</h1>' \
		'<p><a href="http://www.runoob.com">这是一个链接</a></p>' \
		'</html>'

message = MIMEText(content, 'html', 'utf-8')
message['Subject'] = Header(subject, 'utf-8')
message['From'] = Header("菜鸟教程", 'utf-8')
message['To'] = Header("测试", 'utf-8')




smtp = smtplib.SMTP_SSL(smtpserver,465)
smtp.helo()
smtp.ehlo()
# 登录邮箱服务器用户名和密码
smtp.login(user,password)

print("开始发送邮件...")
smtp.sendmail(sender,receivers,message.as_string())
smtp.quit()
