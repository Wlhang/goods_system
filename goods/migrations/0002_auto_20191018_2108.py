# Generated by Django 2.2.5 on 2019-10-18 21:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goods',
            name='sales',
            field=models.CharField(default=0, max_length=10),
        ),
    ]
