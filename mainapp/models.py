from django.db import models
from datetime import datetime

# Create your models here.
class User_Register(models.Model):
    assign_id = models.AutoField(primary_key=True)

    user_name = models.CharField(verbose_name='User_Name', db_column="user_name", max_length=50, blank=False,
                                  null=False)
    user_lastname = models.CharField(verbose_name='User_Lastname', db_column="user_lastname", max_length=50, blank=False,
                                  null=False)
    gender= models.CharField(verbose_name='Gender', db_column="gender", max_length=50, blank=False,
                                  null=False)
    country= models.CharField(verbose_name='Country', db_column="country", max_length=50, blank=False,
                                  null=True)
    state= models.CharField(verbose_name='State', db_column="state", max_length=50, blank=False,
                                  null=True)
    city= models.CharField(verbose_name='City', db_column="city", max_length=50, blank=False,
                                  null=True)
    date_of_birth = models.DateField(verbose_name='Date_Of_Birth', db_column="date_of_birth", blank=False,
                                  null=False)
    addres= models.CharField(verbose_name='Addres', db_column="addres", max_length=50, blank=False,
                                  null=False)
    pincode= models.CharField(verbose_name='Pincode', db_column="pincode", max_length=50, blank=False,
                                  null=False)
    user_phone = models.BigIntegerField(verbose_name='User_Phone', db_column="user_phone", blank=False,
                                  null=False)

    user_email = models.EmailField(db_column='user_email', verbose_name='User_Email', max_length=100, null=True, blank=True)
    user_pwd=models.CharField(verbose_name='User_Password',db_column="user_pwd",max_length=100,blank=False,null=False)
    user_image = models.FileField(verbose_name='User_Image', db_column="user_image", upload_to='User/Profile-image/', blank=True,)

   
    datetime_created = models.DateTimeField(default=datetime.now)
    
    class Meta:
        db_table='User_Register'