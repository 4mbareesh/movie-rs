# Generated by Django 4.1.7 on 2023-03-26 03:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_staff_thtr_theatre_add'),
    ]

    operations = [
        migrations.RenameField(
            model_name='theatre',
            old_name='add',
            new_name='address',
        ),
    ]
