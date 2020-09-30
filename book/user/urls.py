from django.contrib import admin
from django.urls import path,include

from . import views

urlpatterns = [
    path('', views.userhome),
	path('userhome/',views.userhome,name='home'),
	path('about/',views.userabout,name='about'),
	path('menu/',views.usermenu,name='menu'),
	path('usershowsubcat/', views.usershowsubcat),
	path('userpackages/',views.userpackages,name='packages'),
	path('contact/',views.usercontact,name='contact'),
	path('usereditprofile/', views.usereditprofile,name='edit')
]
