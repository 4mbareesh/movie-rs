from django.db import models
import json 
# Create your models here.

class login(models.Model):
    log_id = models.AutoField(primary_key=True)
    username = models.CharField("username", max_length=100)
    password = models.CharField("password", max_length=100)
    role = models.CharField("role", max_length=100)
#log_id,username,password,role

class User(models.Model):
    User_id= models.AutoField(primary_key=True)
    User_name=models.CharField("uname", max_length=200)
    User_email=models.CharField("email", max_length=100)
    User_phone=models.CharField("phone", max_length=100)
    Log_id=models.ForeignKey(login, on_delete=models.CASCADE, null=True)
#User_id,User_name,User_email,User_phone,Log_id

class movie_person(models.Model):
    person_id= models.AutoField(primary_key=True)
    person_name=models.CharField("pname", max_length=200)
    person_photo=models.CharField("photo", max_length=1000)
#person_id,person_name,person_photo
class category(models.Model):
    category_id= models.AutoField(primary_key=True)
    category_name=models.CharField("cname", max_length=200)
#category_id,category_name
class production(models.Model):
    production_id= models.AutoField(primary_key=True)
    banner_name=models.CharField("bname", max_length=200)
#production_id,banner_name 
class movie (models.Model):
    movie_id= models.AutoField(primary_key=True)
    movie_name=models.CharField("mname", max_length=200)
    language=models.CharField("language", max_length=200)
    production=models.ForeignKey(production, on_delete=models.CASCADE, null=True)
    poster=models.CharField("poster", max_length=200)
    movie_description=models.CharField("desc", max_length=1000)
    release_date=models.CharField("date", max_length=200)
    status=models.CharField("status", max_length=200)
    @property 
    def getmoviecat(self):
        return move_category.objects.filter(move=self).all()
    @property
    def getactor(self):
        return crew.objects.filter(movie=self).all()
    
    @property
    def getreviews(self):
        return reviews.objects.filter(movie=self).all()
    @property
    def reviewcount(self):
        return reviews.objects.filter(movie=self).count()
    @property
    def reviewcountp(self):
        return reviews.objects.filter(movie=self,analaysis = 1).count()
    @property
    def reviewcountn(self):
        return reviews.objects.filter(movie=self, analaysis = 0).count()

#movie_id,movie_name,language,production,poster,movie_description,release_date,status

class move_category(models.Model):
    movie_catid= models.AutoField(primary_key=True)
    category=models.ForeignKey(category, on_delete=models.CASCADE, null=True)
    move=models.ForeignKey(movie, on_delete=models.CASCADE, null=True)
    @property
    def allrelcat(self):
        return move_category.objects.filter(category=self.category).exclude(move=self.move).all()
#movie_catid,category,move
class crew(models.Model):
    crew_id= models.AutoField(primary_key=True)
    movie=models.ForeignKey(movie, on_delete=models.CASCADE, null=True)
    person=models.ForeignKey(movie_person, on_delete=models.CASCADE, null=True)
    person_role=models.CharField("prole", max_length=100)
#crew_id,movie,person,person_role
class reviews(models.Model):
    reviewid= models.AutoField(primary_key=True)
    review=models.CharField("pname", max_length=1000)
    movie=models.ForeignKey(movie, on_delete=models.CASCADE, null=True)
    user=models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    analaysis = models.CharField("analysis", max_length=100)
    @property 
    def getrating(self):
        return rating.objects.get(movie=self.movie,user=self.user)
    @property
    def ratingcount(self):
        return rating.objects.filter(movie=self.movie,user=self.user).count()
#reviewid,review,movie,user
class rating(models.Model):
    rating_id= models.AutoField(primary_key=True)
    rating=models.CharField("rating", max_length=100)
    movie=models.ForeignKey(movie, on_delete=models.CASCADE, null=True)
    user=models.ForeignKey(User, on_delete=models.CASCADE, null=True)
#rating_id,rating,movie,user

class history(models.Model):
    hist_id= models.AutoField(primary_key=True)
    movie=models.ForeignKey(movie, on_delete=models.CASCADE, null=True)
    user=models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    date=models.CharField("date", max_length=100)
#     @property
#     def otherusers(self):
#         dho=history.objects.filter(movie=self.movie).exclude(user=self.user).all()
#         datau=[]
#         for dh in dho:
#             datau.append(dh.user)
#         return datau
#     @property 
#     def otherusersmovielist(self):
#         dho=history.objects.filter(movie=self.movie).exclude(user=self.user).all()
#         datadho=[]
#         datau=[]
#         for dh in dho:
#             datau.append(dh.user)
        
#         datau=list(set(datau))
#         for dtu in datau:

#             dhvl=history.objects.filter(user=dtu).exclude(movie=self.movie).all()
#             datm=[]
#             for dvl in dhvl:
#                 datm.append(dvl.movie)
#             #json_object = json.dumps({"user":datau.user_id,"movie":datm}, indent = 4)
#             datadho.append({"user":dtu,"movie":datm})
#         return datadho
# #hist_id,movie,user,date


class Theatre(models.Model):
    theatreid=models.AutoField(primary_key=True)
    theatre_name=models.CharField(max_length=200)
    theatre_place=models.CharField(max_length=200)
    reg_num=models.CharField(max_length=200)
    address=models.CharField(max_length=300)
    login=models.ForeignKey(login, on_delete=models.CASCADE)



class Staff(models.Model):
    login=models.ForeignKey(login, on_delete=models.CASCADE)
    thtr=models.ForeignKey(Theatre, on_delete=models.CASCADE,default=None)
    staffid=models.AutoField(primary_key=True)
    staffname=models.CharField(max_length=200)
    staffimage=models.ImageField(upload_to='images')
    staffphone=models.BigIntegerField()
    staffemail=models.EmailField()
    

class Show(models.Model):
    showid=models.AutoField(primary_key=True)
    movie=models.ForeignKey(movie, on_delete=models.CASCADE)
    theatre=models.ForeignKey(Theatre, on_delete=models.CASCADE)
    showtime=models.CharField(max_length=100,default=None)
    rate=models.CharField(max_length=50,default=None)
    seats=models.CharField(max_length=50,default=None)
    date=models.DateField(default=None)
    status=models.CharField(max_length=50,default='active')

class Booking(models.Model):
    booking_id=models.AutoField(primary_key=True)
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    show=models.ForeignKey(Show, on_delete=models.CASCADE)
    tickets=models.CharField(max_length=50,default=None)
    amount=models.CharField(max_length=50,default=None)