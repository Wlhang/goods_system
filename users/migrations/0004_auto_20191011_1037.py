# Generated by Django 2.2.5 on 2019-10-11 10:37

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_user_confirm'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='user_confirm',
            options={'ordering': ['c_time'], 'verbose_name': 'confirm_code', 'verbose_name_plural': 'confirm_code'},
        ),
    ]
