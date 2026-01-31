from django.db import models
from datetime import datetime
from mainapp.models import User_Register

class Request_Token(models.Model):
    id = models.AutoField(primary_key=True)
    
    user_name = models.CharField(verbose_name='User_Name', db_column="user_name", 
    max_length=50, blank=False,null=False)
    
    user_email = models.EmailField(db_column='user_email', verbose_name='User_Email', 
    max_length=100, null=True, blank=True)

    request_token = models.CharField(verbose_name='Request_Token', db_column="request_token", 
    max_length=50, blank=True, null=True)

    post_token = models.CharField(verbose_name='Post_Token', db_column="post_token", 
    max_length=50, blank=True, default="Pending")

    datetime_created = models.DateTimeField(default=datetime.now)

    class Meta:
        db_table='Request_Token'