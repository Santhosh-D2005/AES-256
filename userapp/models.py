
from django.db import models
from datetime import datetime
from mainapp.models import User_Register

# Create your models here.
class Upload_file(models.Model):
    id = models.AutoField(primary_key=True)

    user = models.ForeignKey(User_Register,max_length=100,null=True,on_delete=models.CASCADE)

    user_name = models.CharField(verbose_name='User_Name', db_column="user_name", max_length=50, blank=True,
                                  null=True)

    file_name = models.CharField(verbose_name='File_Name', db_column="file_name", max_length=50, blank=True,
                                  null=True)
    file_type = models.CharField(verbose_name='File_Type', db_column="file_type", max_length=50, blank=True,
                                  null=True)
    file_size = models.TextField(verbose_name='File_Size', db_column="file_size",  blank=True,
                                  null=True)
    Key= models.TextField(verbose_name='Key', db_column="key", max_length=500, blank=True,
                                  null=True)
    file_data= models.TextField(verbose_name='File_Data', db_column="file_data", max_length=100, blank=True,
                                  null=True)
    decription= models.TextField(verbose_name='Decription', db_column="decription", max_length=50, blank=True,
                                  null=True)

    user_file = models.FileField(verbose_name='User_File', db_column="user_file", upload_to='User/Files/', blank=True,)

    


    datetime_created = models.DateTimeField(default=datetime.now)
    
    class Meta:
        db_table='Upload_file'

class Request_file(models.Model):
    id = models.AutoField(primary_key=True)


    file_id = models.CharField(verbose_name='File_Id', db_column="file_id", max_length=50, blank=True,
                                  null=True)
    file_name = models.CharField(verbose_name='File_Name', db_column="file_name", max_length=50, blank=True,
                                  null=True)
    file_type = models.CharField(verbose_name='File_Type', db_column="file_type", max_length=50, blank=True,
                                  null=True)
    file_size = models.TextField(verbose_name='File_Size', db_column="file_size",  blank=True,
                                  null=True)
    screat_key = models.TextField(verbose_name='Screat_Key', db_column="screat_key", max_length=100, blank=True,
                                  null=True)
    Key= models.TextField(verbose_name='Key', db_column="key", max_length=500, blank=True,
                                  null=True)
    status = models.CharField(verbose_name='Status', db_column="status", max_length=50, blank=True,
                                  default="Pending")
    request_mail = models.EmailField(db_column='request_mail', verbose_name='Request_Mail', max_length=100, null=True, blank=True)

    user_id = models.CharField(verbose_name='User_id', db_column="user_id", max_length=50, blank=True,
                                  null=True)
    user_file = models.FileField(verbose_name='User_File', db_column="user_file", upload_to='User/Files/', blank=True,)
    class Meta:
        db_table='Request_file'