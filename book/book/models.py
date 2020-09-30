from django.db import models
class Register(models.Model):
	regid = models.AutoField(primary_key=True)
	full_name=models.CharField(max_length=50)
	email=models.CharField(max_length=50)
	password=models.CharField(max_length=50)
	confirm_password=models.CharField(max_length=50)
	mobile_number=models.CharField(max_length=50)
	gender=models.CharField(max_length=50)
	dob=models.CharField(max_length=50)
	select_city=models.CharField(max_length=50)
	address=models.CharField(max_length=50)
	role=models.CharField(max_length=20)
	status=models.IntegerField()