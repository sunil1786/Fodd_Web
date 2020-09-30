from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.conf import settings
from myadmin import models as m
from . import models
from book import models as mainmodel


curl=settings.CURRENT_URL
media_url=settings.MEDIA_URL

def sessioncheckuser_middleware(get_response):
	def middleware(request):
		if request.path=='/user/' or request.path=='/user/userhome/' or request.path=='/user/about/' or request.path=='/user/menu/' or request.path=='/user/usershowsubcat/' or request.path=='/user/userpackages/' or request.path=='/user/contact/':
			if request.session['sunm']==None or request.session['srole']!='user':
				response = redirect(curl+'login/')
			else:
				response = get_response(request)
		else:
			response = get_response(request)		
		return response	
	return middleware


# Create your views here.
def userhome (request):
	catList=m.Addcategory.objects.filter()
	menulist=m.Managemenu.objects.filter()
	return render(request,"userhome.html",{'curl':curl,'catList':catList,'menulist':menulist,'media_url':media_url,'sunm':request.session['sunm'],'srole':request.session['srole']})
def userabout(request):
	return render(request,"userabout.html",{'curl': curl,'sunm':request.session['sunm'],'srole':request.session['srole']})
def usermenu(request):
	menulist=m.Managemenu.objects.filter()
	return render(request,"usermenu.html",{'curl': curl,'menulist':menulist,'media_url':media_url,'sunm':request.session['sunm'],'srole':request.session['srole']})
def userpackages(request):
	packlist=m.Managepackages.objects.filter()
	return render(request,"userpackages.html",{'curl': curl,'packlist':packlist,'media_url':media_url,'sunm':request.session['sunm'],'srole':request.session['srole']})
def usercontact(request):
	return render(request,"usercontact.html",{'curl': curl,'sunm':request.session['sunm'],'srole':request.session['srole']})

def usershowsubcat(request):
	catList=m.Addcategory.objects.filter()
	cnm=request.GET.get('cnm')
	subclist=m.Addsubcategory.objects.filter(catnm=cnm)
	return render(request,"usershowsubcat.html",{'media_url':media_url,'curl':curl,'subclist':subclist,'cnm':cnm,'catList':catList,'sunm':request.session['sunm'],'srole':request.session['srole']})	

def usereditprofile(request):
	sunm=request.session['sunm']
	if request.method=='GET':
		userdetails=mainmodel.Register.objects.filter(email=sunm)
		f=''
		m=''
		if userdetails[0].gender=='male':
			m='checked'
		else:
			f='checked'
		return render(request,"usereditprofile.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole'],'userdetails':userdetails[0],'m':m,'f':f}) 	
	else:
		full_name=request.POST.get('full_name')
		email=request.POST.get('email')
		password=request.POST.get('password')
		confirm_password=request.POST.get('confirm_password')
		mobile_number=request.POST.get('mobile_number')
		gender=request.POST.get('gender')
		dob=request.POST.get('dob')
		select_city=request.POST.get('select_city')
		address=request.POST.get('address')
		p=mainmodel.Register.objects.filter(email=sunm).update(full_name=full_name,password=password,confirm_password=confirm_password,mobile_number=mobile_number,gender=gender,dob=dob,select_city=select_city,address=address)
		return redirect(curl+'login/')
				