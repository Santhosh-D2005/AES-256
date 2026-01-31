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
from adminapp.models import *
from mainapp.models import *
from django.core.mail import EmailMessage
from django.views.decorators.cache import cache_control
from django.utils.cache import add_never_cache_headers
from cryptography.fernet import Fernet, MultiFernet
import requests
from django.utils.crypto import get_random_string
import os.path




@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def user_home (request):
    try:
        data = User_Register.objects.get(user_email=request.session["email"])
        data1 = data.assign_id
        data2 = Upload_file.objects.filter(user_id=data1).count()
        data3 = Request_file.objects.filter(user_id=data1).count()
        data4 = Request_file.objects.filter(user_id=data1, status="Accept").count()
        
        
    except:
        return redirect("home")
        
    return render(request, './user/index.html', {'view' : data, 'view1' : data2, 'view2' : data3, 'view3': data4})

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def upload_file(request):
    try:
        v = User_Register.objects.get(user_email=request.session["email"])
        
        data = User_Register.objects.get(user_email=request.session["email"])
        data1 = data.user_name
        if request.method == "POST" and request.FILES["file1"]  :
            name = request.POST['name']
            decription = request.POST['decription']
            filename = request.FILES['file1']
            size = request.POST['size']
            file_type = pathlib.Path(f'{filename}').suffix
            print(file_type)
            file_data = "none"
            key = str(Fernet.generate_key(), 'utf-8')
            crypter = Fernet(key)
            
            
            upload_file = Upload_file.objects.create(user_name=data1,decription=decription,user_file = filename,
            file_name=name, file_type=file_type, file_size=size, Key=key, file_data=file_data,user=data )
            upload_file.save()
            print(filename)

            data = (settings.MEDIA_ROOT+"\\User\\Files\\")
            data1 = (data +f'{filename}')
            print(data1)
            obj = open(data1, 'r')
            demo1 = obj.read()
            datafile = demo1.encode()
            files = str(crypter.encrypt(datafile), 'utf-8')
            f = open (data1, 'w')
            f.write(files)
            d = Upload_file.objects.get(Key=key)
            d.file_data = files
            d.save()
            f.close()

            messages.success(request, "successfully Done") 
    except:
        return redirect("home") 

    return render (request, './user/upload-files.html', {'view' : data})

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def logout(request):
    del request.session["email"]
    return redirect('home')
    

def dami(request, id):
    
    context = {
        
    }
    if request.method == "POST" :
        screat_key = request.POST['screat_key']
        post_key = request.POST['key']
        
        k = Request_file.objects.get(id=id)
        print(k)
        key = k.Key
        sec_key = k.screat_key
        filename = k.user_file
        
        print(filename)
        E= os.path.basename(f'{filename}')
        print(E)

        if key == post_key and screat_key == sec_key:
            k = Fernet(key)
            path = (settings.MEDIA_ROOT).replace('\\', '/')
            print(path)
            data1 = (path+"/" +f'{filename}')
            print(data1)
            obj = open(data1).read()
            ob = bytes(obj, 'utf-8')
            files = k.decrypt(ob).decode()
            

            context={
                'view' : E,
                'view1' : files
            }
        else:
            messages.error(request, "key Does Not Match")
    

    return render (request, './user/dami.html', context=context)

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def token (request):
    try:
        v = User_Register.objects.get(user_email=request.session["email"])
        if v == v:
            data = User_Register.objects.get(user_email=request.session["email"])
            data2 = 'null'
            try:
                data1 = Request_Token.objects.get(user_email=request.session["email"])
                data2 = data1.request_token
            except :
                pass
    except:
        return redirect("home")

    return render (request, './user/token.html', {'view' : data, 'view1': data2})

@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def request(request, name, email):
        user_name = name
        user_email = email
        request = "Pending"

        Token = Request_Token.objects.create(user_name = user_name, user_email = user_email, request_token = request)
        Token.save()
        return redirect("token")



def search(request):
    try:
        v = User_Register.objects.get(user_email=request.session["email"])
        data = User_Register.objects.get(user_email=request.session["email"])
        try:
            Request_Token.objects.get(user_email=request.session["email"])
            
        except:
            messages.error(request, "You Have No Token, So Please Request")
            return redirect("token")
        data2 = Request_Token.objects.get(user_email=request.session["email"]) 
        data3 = data2.post_token
        data5 = data2.request_token

        context = {'view' : data,'data3' : data3}
        
        if data3 == "Pending":
            if request.method == "POST" :
                token = request.POST['token']
                if data5 == token:
                    data2.post_token = token
                    data2.save()
                    return redirect("search")
                else:
                    messages.error(request, "Token Error")
                
                
        elif data3 == data5:
            data = User_Register.objects.get(user_email=request.session["email"])
            
            data2 = Request_Token.objects.get(user_email=request.session["email"])
            data1 = Upload_file.objects.all()
            data4 = Request_file.objects.filter(request_mail=request.session["email"])
            print(data4)
           

            
    
            context = {
            'view' : data,
            'view1' : data1,
            'view2' : data4
            
            }
            
            
        else:
            messages.error(request, "Token Error")
            
    
    except:
        return redirect("home")
    return render (request, './user/search-file.html', context=context)

def req_files(request):
    try:
        data1 = User_Register.objects.get(user_email=request.session["email"])
        data = Request_file.objects.filter(request_mail=request.session["email"])
        context={
            'view' : data,
            'view1': data1
        }
    
    except:
        return redirect("home")
    
    
    return render (request, './user/request-files.html', context=context)




@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def file_request(request,id, email):
    request = get_object_or_404(Upload_file, id=id)
    file_id = request.id
    file_name =request.file_name 
    file_type = request.file_type
    file_size = request.file_size
    user_id = request.user_id
    file_location = request.user_file
    key = request.Key
    files = Request_file.objects.create(file_id=file_id, file_name=file_name, file_type=file_type, file_size=file_size, request_mail=email, user_id=user_id, Key = key, user_file = file_location)
    files.save()
    
    return redirect("req_files")



@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def action(request):
    try:
        print("hii")
        v = User_Register.objects.get(user_email=request.session["email"])
        data = User_Register.objects.get(user_email=request.session["email"])
        
        data1 = data.assign_id
        
        
        demo = Request_file.objects.filter(user_id = data1)
        print(demo)
        
        context = {
            'view1' : demo,
            'view': data,
            
        }
        print("hii1")
        
    except:
        return redirect("home")
    return render (request, './user/action.html', context=context)

def accept(request,id):
    request = get_object_or_404(Request_file, id=id)
    request.status = "Accept"
    chars = 'abcdefghijklmnopqrstuvwxyz0123456789'
    demo = get_random_string(10, chars)
    request.screat_key = demo
    key = request.Key
    email = request.request_mail
    request.save(update_fields =['status', 'screat_key'])
    request.save()
    email = EmailMessage('Subject',f'Hello {email},\nHere Your Key Details:\nYour Key : {key}\nScreate Key : {demo}', to=[ email ])
    email.send()
    return redirect("action")



@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def profile(request):
    try:
        v = User_Register.objects.get(user_email=request.session["email"])
        
        data = User_Register.objects.get(user_email=request.session["email"])
    except:
        return redirect("home")
    return render (request, './user/profile.html', {'view' : data})