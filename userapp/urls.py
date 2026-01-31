from django.contrib import admin
from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views 

urlpatterns = [
    path('user-home', views.user_home, name='user_home'),
    path('logout', views.logout, name='logout'),
    path('upload-file', views.upload_file, name='upload_file'),
    path('dami/<int:id>', views.dami, name='dami'),
    path('token', views.token, name='token'),
    path('search', views.search, name='search'),
    path('req_files', views.req_files, name='req_files'),
    
    path('profile', views.profile, name='profile'),
    path('action', views.action, name='action'),
    path('request/<name>/<email>', views.request, name='request'),
    path('accept/<int:id>', views.accept, name='accept'),
    path('file_request/<int:id>/<email>', views.file_request, name='file_request')
    
    
   
]