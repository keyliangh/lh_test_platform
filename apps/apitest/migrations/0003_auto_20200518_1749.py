# Generated by Django 2.2 on 2020-05-18 09:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apitest', '0002_host'),
    ]

    operations = [
        migrations.AlterField(
            model_name='host',
            name='host',
            field=models.CharField(max_length=1024, verbose_name='Host地址'),
        ),
    ]
