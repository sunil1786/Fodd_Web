from django.contrib import admin
from django.urls import path,include

from . import views

urlpatterns = [
    path('', views.adminhome),
	path('adminhome/',views.adminhome),
	path('admincategory/',views.admincategory),
	path('adminsubcat/',views.adminsubcategory),
	path('manageusers/',views.manageusers),
	path('customerstatus/',views.customerstatus),
	path('managepackages/',views.managepackages),
	path('managemenu/',views.managemenu),
	path('delmenu/',views.delmenu)
]
