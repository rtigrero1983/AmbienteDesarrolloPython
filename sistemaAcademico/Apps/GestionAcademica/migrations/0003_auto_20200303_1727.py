# Generated by Django 2.2.5 on 2020-03-03 17:27

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('GestionAcademica', '0002_auto_20200303_1726'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='confaccion',
            name='id_menu',
        ),
        migrations.AlterField(
            model_name='usuariotemp',
            name='fecha_creacion',
            field=models.DateField(blank=True, default=datetime.datetime(2020, 3, 3, 17, 26, 59, 42581, tzinfo=utc), null=True),
        ),
    ]
