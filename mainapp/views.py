from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect, get_object_or_404,reverse
from django.http import HttpResponse
from django.contrib import messages
from django.conf import settings
from django.template import loader
# Create your views here.
from django.shortcuts import render
from . import views
from userapp import views
from .models import *
import requests
from django.core.mail import EmailMessage
from django.views.decorators.cache import cache_control
from django.utils.cache import add_never_cache_headers
from django.utils.crypto import get_random_string
import os
from twilio.rest import Client



def home (request):
    
    return render(request, './main/index.html')

def about (request):
    return render (request, './main/about.html')

def courses (request):
    return render(request, './main/courses.html')

def cloud_server (request):
    if request.method == "POST":
        admin_email = request.POST.get('email')
        admin_pws = request.POST.get ('pass')
        if admin_email =='admin' and admin_pws =='admin':
            messages.success(request, "welcome")
            return redirect('admin_home')
            
        else:
            messages.error(request, "bad credential Please Register")
            return redirect('cloud_server')
    return render (request, './main/cloud-server.html')

def contact (request):
    return render (request, './main/contact.html')


def login(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            login = User_Register.objects.get(user_email=email,user_pwd=password)
            request.session["email"]=login.user_email
            return redirect ("user_home")
        except:
            messages.error(request, "bad credential Please Register")
            return redirect("login")
    return render (request, './main/login.html')

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def registartion(request):

    if request.method == "POST" and request.FILES["image"]  :
        fname = request.POST['fname']
        lname = request.POST['lname']
        gender = request.POST['inlineRadioOptions']
        country = request.POST['country']
        state = request.POST['state'] 
        city = request.POST['city']
        dob = request.POST['dob']
        addres = request.POST['addres']
        pincode = request.POST['pincode']
        phone = request.POST['phone']
        image = request.FILES['image']
        email = request.POST['email']
        password = request.POST['password']
        try:
            
            if  User_Register.objects.filter(user_phone=phone).exists():
                messages.error (request, "Phone Number alredy exist")
            elif  User_Register.objects.filter(user_email=email).exists():
                messages.error (request, "Email alredy exist")
            else:
                reg_details = User_Register.objects.create(user_name=fname,user_lastname=lname,user_phone=phone,gender=gender,country=country,state=state,city=city,date_of_birth=dob,addres=addres,pincode=pincode,user_email=email,user_pwd=password, user_image = image)
                reg_details.save()
                messages.success(request, "Resgistration successfully Done")
                return redirect("user") 
        
        except:
            pass
    else:
        pass

    return render (request, './main/registration.html')