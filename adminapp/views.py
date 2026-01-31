from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect, get_object_or_404,reverse
from django.http import HttpResponse
from django.contrib import messages
from django.conf import settings
from django.template import loader
# Create your views here.
from django.shortcuts import render
from . import views
import pathlib 
from  mainapp import views
from .models import *
from mainapp.models import *
from userapp.models import *
from django.core.mail import EmailMessage
from django.views.decorators.cache import cache_control
from django.utils.cache import add_never_cache_headers
from cryptography.fernet import Fernet, MultiFernet
from django.utils.crypto import get_random_string

def admin_home (request):
    data = User_Register.objects.all().count()
    data1 = Upload_file.objects.all().count()
    context = {
        'data' : data,
        'data1': data1
    }

    return render(request, './admin/admin-home.html', context=context)

def view_client(request):
    demo = User_Register.objects.all()
    return render (request, './admin/view-client.html', {'view' : demo})

def view_files (request):
    demo = Upload_file.objects.all()
    return render (request, './admin/view-files.html', {'view' : demo})

def view_token (request):
    demo = Request_Token.objects.filter(request_token="Pending")
    print(request)
    return render (request, './admin/view-token-request.html', {'view': demo})

def accept_request(request,id, email):
    request = get_object_or_404(Request_Token, id=id)
    email = request.user_email
    chars = 'abcdefghijklmnopqrstuvwxyz0123456789'
    demo = get_random_string(6, chars)
    print(demo)
    request.request_token = demo
    request.save(update_fields =['request_token'])
    request.save()
    email = EmailMessage('Subject',f'Hello {email},\nHere Your Details:\nYour Token No : {demo}', to=[ email ])
    email.send()
    return redirect("view_token")




def admin_logout (request):
    return redirect("home")