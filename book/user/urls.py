from django.contrib import admin
from django.urls import path,include

from . import views

urlpatterns = [
    path('', views.userhome),
	path('userhome/',views.userhome),
	path('about/',views.userabout),
	path('menu/',views.usermenu),
	path('usershowsubcat/', views.usershowsubcat),
	path('userpackages/',views.userpackages),
	path('contact/',views.usercontact),
	path('usereditprofile/', views.usereditprofile)
]
