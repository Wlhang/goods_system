# Generated by Django 2.2.5 on 2019-10-18 21:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0003_remove_goods_picture'),
    ]

    operations = [
        migrations.AddField(
            model_name='goods',
            name='picture',
            field=models.CharField(default=None, max_length=50),
        ),
    ]