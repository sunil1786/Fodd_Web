from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.conf import settings
from . import models
from myadmin import models as m

media_url=settings.MEDIA_URL
curl=settings.CURRENT_URL

def sessionunset_middleware(get_response):
	def middleware(request):
		if request.path=='/login/' or request.path=='/home/' or request.path=='/about/' or request.path=='/menu/' or request.path=='/packages/' or request.path=='/contact/' or request.path=='/showsubcat/' or request.path=='/account/' or request.path=='/register/' :
			request.session['sunm']=None
			request.session['srole']=None
		response=get_response(request)
		return response
	return middleware

def home(request):
	catList=m.Addcategory.objects.filter()
	menulist=m.Managemenu.objects.filter()
	return render(request,"index.html",{'curl':curl,'catList':catList,'media_url':media_url,'menulist':menulist})

def about(request):
	return render(request,"about.html",{'curl':curl})

def menu(request):
	menulist=m.Managemenu.objects.filter()
	return render(request,"menu.html",{'curl':curl,'menulist':menulist,'media_url':media_url})

def packages(request):
	packlist=m.Managepackages.objects.filter()
	return render(request,"packages.html",{'curl':curl,'packlist':packlist,'media_url':media_url})

def contact(request):
	return render(request,"contact.html",{'curl':curl})

def account(request):
	return render(request,"account.html",{'curl':curl})

def login(request):
	if request.method=="GET":
		return render(request,"login.html",{'curl':curl,'output':''})
	else:
		email=request.POST.get("email")
		password=request.POST.get("password")
		userData=models.Register.objects.filter(email=email,password=password,status=1)
		if len(userData)>0 :

			request.session['sunm']=email
			request.session['srole']=userData[0].role

			if userData[0].role=="user":
				myurl=curl+'user/'
				return redirect(myurl)
			if userData[0].role=="admin":
				mycurl=curl+'myadmin/'
				return redirect(mycurl)
		else:
			return render(request,"login.html",{'curl':curl,'output':'invalid user please login,or verify account'})

def register(request):
	if request.method=='GET':
		if request.GET.get('output')==None:
			output=""
		else:
			output=request.GET.get('output')
		return render(request,"register.html",{'curl':curl,'output':output})
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
		data=models.Register(full_name=full_name,email=email,password=password,confirm_password=confirm_password,mobile_number=mobile_number,gender=gender,dob=dob,select_city=select_city,address=address,role="user",status="0")
		data.save()
		myurl=curl+'register/?output=Register successfully'

		import smtplib 
		from email.mime.multipart import MIMEMultipart
		from email.mime.text import MIMEText

		me = "bookmymeal123@gmail.com"
		you = email

		msg = MIMEMultipart('alternative')
		msg['Subject'] = "Verification Mail BOOK_MY_MEAL"
		msg['From'] = me
		msg['To'] = you
		html = """<html>
  					<head></head>
  					<body>
    					<h1>Welcome to BOOK_MY_MEAL</h1>
    					<p>You have successfully registered , please click on the link below to verify your account</p>
    					<h2>Username : """+email+"""</h2>
    					<h2>Password : """+str(password)+"""</h2>
    					<br>
    					<a href='http://localhost:8000/verify?vemail="""+email+"""' >Click here to verify account</a>		
  					</body>
				</html>
				"""
		s = smtplib.SMTP('smtp.gmail.com', 587) 
		s.starttls() 
		s.login("bookmymeal123@gmail.com", "123@@123") 

		part2 = MIMEText(html, 'html')

		msg.attach(part2)

		s.sendmail(me,you, str(msg)) 
		s.quit() 
		print("mail send successfully....")


		return redirect(myurl)
		#return render(request,"register.html",{'curl':curl,'output':'Register successfully'})



def verify(request):
	vemail=request.GET.get('vemail')
	models.Register.objects.filter(email=vemail).update(status=1)
	return redirect(curl+'login/')					

def showsubcat(request):
	catList=m.Addcategory.objects.filter()
	cnm=request.GET.get('cnm')
	subclist=m.Addsubcategory.objects.filter(catnm=cnm)
	return render(request,"showsubcat.html",{'media_url':media_url,'curl':curl,'subclist':subclist,'cnm':cnm,'catList':catList})	