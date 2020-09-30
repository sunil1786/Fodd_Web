from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.conf import settings
from django.core.files.storage import FileSystemStorage

from . import models
from book import models as m

curl=settings.CURRENT_URL


def sessioncheck_middleware(get_response):
	def middleware(request):
		if request.path=='/myadmin/' or request.path=='/myadmin/adminhome/' or request.path=='/myadmin/admincategory/' or request.path=='/myadmin/manageusers/' or request.path=='/myadmin/customerstatus/' :
			if request.session['sunm']==None or request.session['srole']!="admin":
				response = redirect(curl+'login/')
			else:
				response = get_response(request)
		else:
			response = get_response(request)		
		return response	
	return middleware

# Create your views here.
def adminhome(request):
	return render(request,"adminhome.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole']})

def admincategory(request):
	if request.method=='GET':
		catlist=models.Addcategory.objects.filter()
		return render(request,"admincategory.html",{'curl':curl,'output':'','catlist':catlist,'sunm':request.session['sunm'],'srole':request.session['srole']})
	else:
		catnm=request.POST.get('catnm')
		catdisc=request.POST.get('catdisc')
		caticon=request.FILES['caticon']
		catdisc=request.POST.get('catdisc')
		fs=FileSystemStorage()
		filename=fs.save(caticon.name,caticon)
		p=models.Addcategory(catnm=catnm,catdisc=catdisc,caticon=filename)
		p.save()
		return render(request,"admincategory.html",{'curl':curl,'output':'category added successfully','sunm':request.session['sunm'],'srole':request.session['srole']})

def adminsubcategory (request):
	clist=models.Addcategory.objects.filter()
	subclist=models.Addsubcategory.objects.filter()
	if request.method=="GET":
		return render(request,"adminsubcat.html",{'curl':curl,'output':'','subclist':subclist,'clist': clist,'sunm':request.session['sunm'],'srole':request.session['srole']})
	else:
		catnm=request.POST.get('catnm')
		subcatnm=request.POST.get('subcatnm')
		subcaticon=request.FILES['subcaticon']
		subcatdisc=request.POST.get('subcatdisc')
		subcatprice=request.POST.get('subcatprice')
		fs = FileSystemStorage()
		filename = fs.save(subcaticon.name,subcaticon)
		p=models.Addsubcategory(subcatnm=subcatnm,catnm=catnm,subcaticon=filename,subcatdisc=subcatdisc,subcatprice=subcatprice)
		p.save()
		return redirect(curl+'myadmin/adminsubcat')

def manageusers(request):
	userlist=m.Register.objects.filter(role='user')
	return render(request,"manageusers.html",{'curl':curl,'userlist':userlist,'sunm':request.session['sunm'],'srole':request.session['srole']})
	
def customerstatus(request):
	regid=request.GET.get('regid')
	vstatus=request.GET.get('vstatus')
	if vstatus=='block':
		m.Register.objects.filter(regid=regid).update(status=0)
	elif vstatus=='unblock':
		m.Register.objects.filter(regid=regid).update(status=1)
	else:
		m.Register.objects.filter(regid=regid).delete()
	return redirect(curl+'myadmin/manageusers')
def managepackages(request):
		if request.method=='GET':
			packlist=models.Managepackages.objects.filter()
			return render(request,"managepackages.html",{'curl':curl,'output':'','packlist':packlist,'sunm':request.session['sunm'],'srole':request.session['srole']})
		else:
			packnm=request.POST.get('packnm')
			packprice=request.POST.get('packprice')
			packdisc=request.POST.get('packdisc')
			packimag=request.FILES['packimag']
			packduration=request.POST.get('packduration')
			img=FileSystemStorage()
			imgname=img.save(packimag.name,packimag)
			p=models.Managepackages(packnm=packnm,packprice=packprice,packdisc=packdisc,packimag=packimag,packduration=packduration)
			p.save()
			return redirect(curl+'myadmin/managepackages')
def managemenu(request):
	if request.method=='GET':
		menulist=models.Managemenu.objects.filter()
		return render(request,"managemenu.html",{'curl':curl,'menulist':menulist,'sunm':request.session['sunm'],'srole':request.session['srole']})
	else:
		mealnm=request.POST.get('mealnm')
		mealprice=request.POST.get('mealprice')
		mealdisc=request.POST.get('mealdisc')
		mealimg=request.FILES['mealimg']
		mealcatnm=request.POST.get('mealcatnm')
		img=FileSystemStorage()
		imgname=img.save(mealimg.name,mealimg)
		p=models.Managemenu(mealnm=mealnm,mealprice=mealprice,mealdisc=mealdisc,mealimg=mealimg,mealcatnm=mealcatnm)
		p.save()
		return redirect(curl+'myadmin/managemenu')
def delmenu(request):
	mealid=request.GET.get('mealid')
	vstatus=request.GET.get('vstatus')
	if vstatus=='delete':
		models.Managemenu.objects.filter(mealid=mealid).delete()
	return redirect(curl+'myadmin/managemenu')
