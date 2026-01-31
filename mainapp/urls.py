from django.contrib import admin
from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views 

urlpatterns = [
    path('', views.home, name='home'),
    path('about', views.about, name='about'),
    path('contact', views.contact, name='contact'),
    path('cloud-server', views.cloud_server, name='cloud_server'),
    path('courses', views.courses, name='courses'),
    path('login', views.login, name='login'),
    path('registartion', views.registartion, name='registartion')
    
]   