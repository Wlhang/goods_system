# Generated by Django 2.2.5 on 2019-10-16 17:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0007_auto_20191016_1723'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goods',
            name='price',
            field=models.FloatField(default=0),
        ),
    ]
