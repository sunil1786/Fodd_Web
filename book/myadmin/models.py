from django.db import models

# Create your models here.
class Addcategory(models.Model):
	catid=models.AutoField(primary_key=True)
	catnm=models.CharField(max_length=50)
	catdisc=models.CharField(max_length=1000)
	caticon=models.CharField(max_length=100)

class Addsubcategory(models.Model):
	subcatid = models.AutoField(primary_key=True)
	subcatnm=models.CharField(max_length=50)
	catnm=models.CharField(max_length=50)
	subcatdisc=models.CharField(max_length=1000)
	subcaticon=models.CharField(max_length=100)
	subcatprice=models.CharField(max_length=50)

class Managepackages(models.Model):
	packid = models.AutoField(primary_key=True)
	packnm=models.CharField(max_length=50)
	packprice=models.CharField(max_length=50)
	packdisc=models.CharField(max_length=50)
	packimag=models.CharField(max_length=50)
	packduration=models.CharField(max_length=50)

class Managemenu(models.Model):
	mealid = models.AutoField(primary_key=True)
	mealnm=models.CharField(max_length=50)
	mealprice=models.CharField(max_length=50)
	mealdisc=models.CharField(max_length=50)
	mealimg=models.CharField(max_length=50)
	mealcatnm=models.CharField(max_length=50)



