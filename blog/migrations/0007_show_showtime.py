# Generated by Django 4.1.7 on 2023-04-01 18:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0006_show'),
    ]

    operations = [
        migrations.AddField(
            model_name='show',
            name='showtime',
            field=models.CharField(default=None, max_length=100),
        ),
    ]