from django.contrib import admin
from django.urls import path, include
from . import views
from django.contrib.auth import views as auth_views 

urlpatterns = [
    path('admin-home', views.admin_home, name='admin_home'),
    path('view-client', views.view_client, name='view_client'),
    path('view-files', views.view_files, name='view_files'),
    path('view-token', views.view_token, name='view_token'),
    path('admin_logout', views.admin_logout, name='admin_logout'),
    path('accept_request/<int:id>/<email>', views.accept_request, name='accept_request'),
]