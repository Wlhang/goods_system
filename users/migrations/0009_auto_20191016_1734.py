# Generated by Django 2.2.5 on 2019-10-16 17:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0008_auto_20191016_1726'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goods',
            name='sales',
            field=models.CharField(max_length=10),
        ),
    ]
