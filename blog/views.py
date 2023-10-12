from django.shortcuts import render
from django.shortcuts import redirect 
import datetime
from datetime import date
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from .models import login as log,User as usr,Staff as stf
from .models import movie_person as pers , category as cat
from .models import move_category as mcat ,crew as mcr,Booking as bok
from .models import reviews as review,production as pr,movie as mov
from .models import rating as rt ,history as his,Theatre as ttr,Show as shw
from collections import Counter
# Create your views here.
import csv
import pandas as pd
import nltk
from nltk.corpus import stopwords
import numpy as np
from wordcloud import WordCloud 
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.linear_model import LogisticRegression
lr = LogisticRegression()

def getAnalysisReport(txt):
    df = pd.read_csv('training/Review.csv')
    data = {'positive': 1, 'negative': -1}
    df.sentiment = [data[i] for i in df.sentiment.astype(str)]
    def remove_punctuation(text):
        final = "".join(u for u in text if u not in ("?", ".", ";", ":",  "!",'"'))
        return final
    df['review'] = df['review'].apply(remove_punctuation)
    index = df.index
    df['random_number'] = np.random.randn(len(index))
    train = df[df['random_number'] <= 1.0]
    input_data = {"review":[txt]}
    dft =pd.DataFrame(input_data)
    vectorizer = CountVectorizer(token_pattern=r'\b\w+\b')
    train_matrix = vectorizer.fit_transform(train['review'])
    test_matrix = vectorizer.transform(dft['review'])
     
    X_train = train_matrix
    X_test = test_matrix
    y_train = train['sentiment']
    lr.fit(X_train,y_train)
    predictions = lr.predict(X_test)
    return predictions[0]

def totest2(id):

    df = pd.read_csv('training/Review.csv')
    data = {'positive': 1, 'negative': -1}
    df.sentiment = [data[i] for i in df.sentiment.astype(str)]
    
    def remove_punctuation(text):
        final = "".join(u for u in text if u not in ("?", ".", ";", ":",  "!",'"'))
        return final
    df['review'] = df['review'].apply(remove_punctuation)
    index = df.index
    df['random_number'] = np.random.randn(len(index))
    train = df[df['random_number'] <= 1.0]
    
    
    #--------------------------------------
    # fetching data
    #-----------------------------------------

    rev=review.objects.filter(movie=id).all()
    with open('training/userreview.csv', 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['review'])
            for rv in rev:
                writer.writerow([rv.review])
    dft = pd.read_csv('training/userreview.csv')
    dft['review'] = dft['review'].apply(remove_punctuation)
    #---------------------------------
    vectorizer = CountVectorizer(token_pattern=r'\b\w+\b')
    train_matrix = vectorizer.fit_transform(train['review'])
    test_matrix = vectorizer.transform(dft['review'])
    
    X_train = train_matrix
    X_test = test_matrix
    y_train = train['sentiment']
    lr.fit(X_train,y_train)
    predictions = lr.predict(X_test)
    res=predictions.tolist()
    keyc=list(Counter(res).keys()) # equals to list(set(words))
    contc=list(Counter(res).values()) # counts the elements' frequency
    print(keyc)
    print(contc)
    pve=0
    nve=0
    for x,y in zip(keyc,contc):
        if int(x)==1 :
            pve=y
        else:
            nve=y
    rtb=True
    if int(pve) > int(nve) :
        rtb=True
    else :
        rtb=False

    return rtb

def tester(request):
    data=mov.objects.get(movie_id=6)
    print(data)
    v=totest2(data)
    print(v)
    return render(request,"tt.html")
def totest(request):
    role=request.session.get("role","")
    data=mov.objects.all()
    datan=[]
    datausrv=[]
    
    if(role == "user"):
        id=request.session["id"]
        datau=usr.objects.get(Log_id=id)
        #content based
        datahic=his.objects.filter(user=datau).all()
        datarelmv=[]
        for d in datahi:
            #for contentbased
            for k in d.movie.getmoviecat:
                for r in k.allrelcat:
                    datarelmv.append(r.move)
        datakr=list(Counter(datarelmv).keys()) # equals to list(set(words))
        datarr=list(Counter(datarelmv).values()) # counts the elements' frequency
        datamyvisit=[]
        for (x,y) in zip(datakr,datarr):
            datamyvisit.append({"movie":x,"count":y})

        #collaburate
        with open('training/movie.csv', 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['movie_id', 'title'])
            for d in data:
                
                writer.writerow([d.movie_id,d.movie_name])
        dataset1 = pd.read_csv('training/movie.csv')
        datahiss=his.objects.all()
        allhis=[]
        with open('training/innovators.csv', 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['user_id', 'movie_id', 'Rating'])
            for k in datahiss:
                    ra=0
                    rc=rt.objects.filter(movie=k.movie,user=k.user).count()
                    if rc==0:
                        ra=0
                    else:
                        rr=rt.objects.get(movie=k.movie,user=k.user)
                        ra=rr.rating
                        writer.writerow([k.user.User_id,k.movie.movie_id,ra])
        dataset2 = pd.read_csv('training/innovators.csv')
        #print(dataset2)
        datav = pd.merge(dataset1, dataset2, on='movie_id')
        #print(datav)
        ratings = pd.DataFrame(datav.groupby('title')['Rating'].mean())
 
        ratings['num of ratings'] = pd.DataFrame(datav.groupby('title')['Rating'].count())
        moviemat = datav.pivot_table(index ='user_id',columns ='movie_id', values ='Rating')
        #print(moviemat)
        datahi=his.objects.filter(user=datau).all()
        movieids=[]
        for fi in datahi:
            starwars_user_ratings = moviemat[fi.movie.movie_id]
            #print(starwars_user_ratings)
            similar_to_starwars = moviemat.corrwith(starwars_user_ratings)
            #print(similar_to_starwars)
            corr_starwars = pd.DataFrame(similar_to_starwars, columns =['Correlation'])
            corr_starwars.dropna(inplace = True)
            key=list(dict(corr_starwars['Correlation']).keys())
            movieids=movieids+key
        movieids=list(set(movieids))
        print(movieids)
        colabdata=mov.objects.filter(pk__in=movieids ).all()   


        #dual sendimental analaysis 

    return render(request,"tt.html")

def index(request):
    role=request.session.get("role","")
    data=mov.objects.all()
    datan=[]
    datausrv=[]
    datap=[] 
    
    if(role == "user"):
        id=request.session["id"]
        datau=usr.objects.get(Log_id=id)
        #content based
        datahic=his.objects.filter(user=datau).all()
        datarelmv=[]
        datahiss=his.objects.all()
        allhis=[]
        with open('training/innovators.csv', 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['user_id', 'movie_id', 'Rating'])
            for k in datahiss:
                ra=0
                rc=rt.objects.filter(movie=k.movie,user=k.user).count()
                if rc==0:
                    ra=0
                else:
                    rr=rt.objects.get(movie=k.movie,user=k.user)
                    ra=rr.rating
                    writer.writerow([k.user.User_id,k.movie.movie_id,ra])
        dataset2 = pd.read_csv('training/innovators.csv')
        datav = dataset2 
        moviemat = datav.pivot_table(index ='user_id',columns ='movie_id', values ='Rating')
        # print(moviemat)
        datahi=his.objects.filter(user=datau).all()
        movieids=[]
        for fi in datahi:
            d=fi
            for k in d.movie.getmoviecat:
                for r in k.allrelcat:
                    datarelmv.append(r.move)
                    datan.append(r.move)
            print(fi.movie.movie_id)
            starwars_user_ratings = moviemat[fi.movie.movie_id]
            similar_to_starwars = moviemat.corrwith(starwars_user_ratings)
            corr_starwars = pd.DataFrame(similar_to_starwars, columns =['Correlation'])
            corr_starwars.dropna(inplace = True)
            key=list(dict(corr_starwars['Correlation']).keys())
            movieids=movieids+key
        movieids=list(set(movieids))
        print(movieids)
        colabdata=mov.objects.filter(pk__in=movieids ).all() 
        for x in colabdata:
            datan.append(x) 
    if len(datan) == 0:
        for v in data:
            if v.reviewcount != 0:
                if v.reviewcountp > v.reviewcountn :
                    datap.append(v) 
    else:
        datan=list(set(datan))
        for v in datan:
            if v.reviewcount != 0:
                if v.reviewcountp > v.reviewcountn :
                    datap.append(v) 
    return render(request,"index.html",{"role":role,"data":data,"msg":"","datan":datap})

def movie_details(request):
    msg=request.GET.get("msg","")
    role=request.session.get("role","")
    
    data1234=mov.objects.get(movie_id=request.GET["id"])
    if(role == "user"):
        id=request.session["id"]
        datau=usr.objects.get(Log_id=id)
        
        datahis=his.objects.filter(movie=data1234,user=datau).count()
        if datahis==0:
            today = date.today()
            his.objects.create(movie=data1234,user=datau,date=today) 
         
    datan=[]
    datausrv=[]
    datap=[] 
    data=mov.objects.all()
    if(role == "user"):
        
        id=request.session["id"]
        datau=usr.objects.get(Log_id=id)
        #content based
        datahic=his.objects.filter(user=datau).all()
        datarelmv=[]
        datahiss=his.objects.all()
        allhis=[]
        with open('training/innovators.csv', 'w', newline='') as file:
            writer = csv.writer(file)
            writer.writerow(['user_id', 'movie_id', 'Rating'])
            for k in datahiss:
                ra=0
                rc=rt.objects.filter(movie=k.movie,user=k.user).count()
                if rc==0:
                    ra=0
                else:
                    rr=rt.objects.get(movie=k.movie,user=k.user)
                    ra=rr.rating
                    writer.writerow([k.user.User_id,k.movie.movie_id,ra])
        dataset2 = pd.read_csv('training/innovators.csv')
        datav = dataset2 
        moviemat = datav.pivot_table(index ='user_id',columns ='movie_id', values ='Rating')
        datahi=his.objects.filter(user=datau).all()
        movieids=[]
        for fi in datahi:
            d=fi
            for k in d.movie.getmoviecat:
                for r in k.allrelcat:
                    datarelmv.append(r.move)
                    datan.append(r.move)
            starwars_user_ratings = moviemat[fi.movie.movie_id]
            similar_to_starwars = moviemat.corrwith(starwars_user_ratings)
            corr_starwars = pd.DataFrame(similar_to_starwars, columns =['Correlation'])
            corr_starwars.dropna(inplace = True)
            key=list(dict(corr_starwars['Correlation']).keys())
            movieids=movieids+key
        movieids=list(set(movieids))
        print(movieids)
        colabdata=mov.objects.filter(pk__in=movieids ).all() 
        for x in colabdata:
            datan.append(x) 
    if len(datan) == 0:
        for v in data:
            if v.reviewcount != 0:
                if v.reviewcountp > v.reviewcountn :
                    datap.append(v) 
    else:
        datan=list(set(datan))
        for v in datan:
            if v.reviewcount != 0:
                if v.reviewcountp > v.reviewcountn :
                    datap.append(v) 
              
    
    return render(request,"movie_details.html",{"role":role,"data":data1234,"msg":msg,"datan":datap})

def rating(request):
    msg=""
    role=request.session.get("role","")
    
    if(role != "user"):
        response = redirect('/login'+"?msg=please login")
        return response
    else :
        if request.POST:
            t1=request.POST["Comment"]
            t2=request.POST["stars"]
            id=request.session["id"]
            
            data=usr.objects.get(Log_id=id)
            datam=mov.objects.get(movie_id=request.GET["id"])
            datar=review.objects.filter(movie=datam,user=data).count()
            p=getAnalysisReport(t1)
            if(datar==0): 
                review.objects.create(review=t1,movie=datam,user=data,analaysis=p)
            else :
                review.objects.filter(movie=datam,user=data).update(review=t1,analaysis=p)
            datart=rt.objects.filter(movie=datam,user=data).count()
            if(datart==0): 
                rt.objects.create(rating=t2,movie=datam,user=data)
            else :
                rt.objects.filter(movie=datam,user=data).update(rating=t2)


        response = redirect('/movie_details'+"?id="+request.GET["id"])
        return response

def login(request):
    msg=request.GET.get("msg","")
    if request.POST:
        t1=request.POST["t1"]
        t2=request.POST["t2"]
        try:
            data=log.objects.get(username=t1,password=t2)
            if(data.role=="admin"):
                request.session['username'] = data.username
                request.session['role'] = data.role
                request.session['id'] = data.log_id
                response = redirect('/Adminhome')
                return response
            elif (data.role=="user"):
                request.session['username'] = data.username
                request.session['role'] = data.role
                request.session['id'] = data.log_id
                response = redirect('/index')
                return response
            elif (data.role=="theatre"):
                request.session['username'] = data.username
                request.session['role'] = data.role
                request.session['id'] = data.log_id
                response = redirect('/theatrehome')
                return response
            elif (data.role=="staff"):
                request.session['username'] = data.username
                request.session['role'] = data.role
                request.session['id'] = data.log_id
                response = redirect('/staffhome')
                return response
            else:
                msg="invalid account Details"
                #return render(request, "index.html", {"msg":"invalid account Details"})
        except:
            msg="invalid user name of password"
            #return render(request, "index.html", {"msg":"invalid user name of password"})

    return render(request,"login.html",{"msg":msg})

def Logout(request):
    try:
        del request.session['id']
        del request.session['role']
        del request.session['username']
        response = redirect("/index")
        return response
    except:
        response = redirect("/index")
        return response

def signup(request):
    msg=""
    if request.POST:
        t1=request.POST["t1"]
        t2=request.POST["t2"]
        t3=request.POST["t3"]
        t4=request.POST["t4"]
        t5=request.POST["t5"]
        log.objects.create(username=t4, password=t5, role="user")
        data=log.objects.last()
        msg="registered successfully"
        usr.objects.create(User_name=t1,User_email=t2,User_phone=t3,Log_id=data)
    return render(request,"signup.html",{"msg":msg})
def Adminhome(request):
    role=request.session.get("role","")
    if role != "admin":
        return redirect("index")
    return render(request,"Adminhome.html",{"msg":""})

def Privacy(request):
    msg=""
    role=request.session.get("role","")
    if request.POST:
        t1=request.POST["t1"]
        t2=request.POST["t2"]
        id=request.session["id"]
        data=log.objects.get(log_id=id)
        if data.password==t1:
            msg="sucessfully updated"
            log.objects.filter(log_id=id).update(password=t2)
        else:
            msg="invalid current password"
    returnpage="adminhead.html"
    page="privacy.html"
    if role == "user":
        page="userprivacy.html"
    
    return render(request, page,{"role":returnpage,"msg":msg})

def personals(request):
    msg=""
    if request.POST:
        t1=request.POST["t1"]
        t2 = request.FILES["t2"]
        fs = FileSystemStorage()
        fnm=fs.save(t2.name, t2)
        pers.objects.create(person_name=t1,person_photo=t2)
        msg="Successfully added"
    data=pers.objects.all()
    return render(request,"personals.html",{"msg":msg,"data":data})

def delete_person(request):
    pers.objects.filter(person_id=request.GET["id"]).delete()
    response = redirect('/personals')
    return response

def category(request):
    if request.POST:
        t1=request.POST["t1"]
        cat.objects.create(category_name=t1)
        msg="Successfully added"
    data=cat.objects.all()
    return render(request,"category.html",{"msg":"","data":data})

def delete_category(request):
    cat.objects.filter(category_id=request.GET["id"]).delete()
    response = redirect('/category')
    return response


def productions(request):
    if request.POST:
        t1=request.POST["t1"]
        pr.objects.create(banner_name=t1)
        msg="Successfully added"
    data=pr.objects.all()
    return render(request,"productions.html",{"msg":"","data":data})

def delete_productions(request):
    pr.objects.filter(production_id=request.GET["id"]).delete()
    response = redirect('/productions')
    return response


def newpost(request):
    if request.POST:
        t1=request.POST["t1"]
        t2=request.POST["t2"]
        t3=request.POST["t3"]
        t4=request.POST["t4"]
        t5=request.FILES["t5"]
        fs = FileSystemStorage()
        fnm=fs.save(t5.name, t5)
        
        t7=request.POST["t7"]
        t8=request.POST["t8"]
        dp=pr.objects.get(production_id=t4)
        msg="Successfully Saved"

        mov.objects.create(movie_name=t1,language=t3,production=dp,poster=t5,movie_description=t2,release_date=t7,status=t8)       
        datam=mov.objects.last()
        t6=request.POST.getlist('t6')
        #print(t6)
        for r in t6:
            dac=cat.objects.get(category_id=r)
            mcat.objects.create(category=dac,move=datam)
    datap=pr.objects.all()
    datac=cat.objects.all()
    cc=cat.objects.count()
    return render(request,"newpost.html",{"msg":"","datap":datap,"datac":datac,"cc":cc})

def posts(request):
    data=mov.objects.all()
    return render(request,"posts.html",{"msg":"","data":data})

def delete_posts(request):
    mov.objects.filter(movie_id=request.GET["id"]).delete()
    response = redirect('/posts')
    return response

def post_details(request):
    msg=request.GET.get("msg","")
    if request.POST:
        t1=request.POST["t1"]
        t2=request.POST["t2"]
        t3=request.POST["t3"]
        t4=request.POST["t4"]
        t5=request.POST["t5"]
        t6=request.POST["t6"]
        id=request.GET["id"]
        mov.objects.filter(movie_id=id).update(movie_name=t1,language=t3,production=t4,movie_description=t2,release_date=t5,status=t6)
        msg="updated successfully"
    datap=pr.objects.all()
    data=mov.objects.get(movie_id=request.GET["id"])
    dataa=pers.objects.exclude(person_id__in=mcr.objects.filter(movie=data).values_list('person', flat=True))
    datar=cat.objects.exclude(category_id__in=mcat.objects.filter(move=data).values_list('category', flat=True))
    #print(datar)
    id=request.GET["id"]
    return render(request,"post_details.html",{"msg":"","data":data,"datap":datap,"id":id,"dataa":dataa,"datar":datar})

def post_details_actor(request):
    id=request.POST["hid"]
    a1=request.POST["a1"]
    a2=request.POST["a2"]
    data=mov.objects.get(movie_id=id)
    dat=pers.objects.get(person_id=a1)
    mcr.objects.create(movie=data,person=dat,person_role=a2)
    response = redirect('/post_details?id='+id)
    return response

def delete_crew(request):
    id=request.GET["hid"]
    mcr.objects.filter(crew_id=request.GET["id"]).delete()
    response = redirect('/post_details?id='+id)
    return response

def delete_movie_cat(request):
    id=request.GET["hid"]
    mcat.objects.filter(movie_catid=request.GET["id"]).delete()
    response = redirect('/post_details?id='+id)
    return response


def post_add_cat(request):
    id=request.POST["hid"]
    t1=request.POST["t1"]
    data=mov.objects.get(movie_id=id)
    datc=cat.objects.get(category_id=t1)
    mcat.objects.create(category=datc,move=data)
    response = redirect('/post_details?id='+id)
    return response

def managetheatre(request):
    msg=''
    context={}
    context['msg']=''
    if request.POST:
        t1=request.POST["t1"]
        t2=request.POST["t2"]
        t3=request.POST["t3"]
        t4=request.POST["t4"]
        t5=request.POST["t5"]
        t6=request.POST["t6"]
        if log.objects.filter(username=t5).count()>0:
            context['msg']="Username already exist"
            return render(request, 'tt.html',context)
        else:
            data=log(username=t5,password=t6,role="theatre")
            data.save()
            ttr.objects.create(theatre_name=t1,theatre_place=t3,address=t2,reg_num=t4,login=data)
            context['msg']='Successfully added a theatre'
            return render(request, 'tt.html',context)
    
    return render(request, 'tt.html',context)

def listtheatre(request):
    data=ttr.objects.all()
    context={'data':data}
    return render(request, 'theatredata.html',context)
def delete_theatre(request):
    return redirect('listtheatre')


def theatrehome(request):
    role=request.session.get("role","")
    if role != "theatre":
        return redirect("index")
    return render(request, 'theatrehome.html')

def addstaff(request):
    msg=''
    context={}
    context['msg']=''
    if request.POST:
        t1=request.POST["t1"]
        t2=request.FILES.get('t2')
        t3=request.POST["t3"]
        # t4=request.POST["t4"]
        t5=request.POST["t5"]
        t6=request.POST["t6"]
        data_t=ttr.objects.get(login_id=request.session['id'])
        if log.objects.filter(username=t5).count()>0:
            context['msg']="Username already exist"
            return render(request, 'staff.html',context)
        else:
            data=log(username=t5,password=t6,role="staff")
            data.save()
            stf.objects.create(staffname=t1,staffemail=t5,staffphone=t3,staffimage=t2,thtr=data_t,login=data)
            context['msg']='Successfully added a staff'
            return render(request, 'staff.html',context)
    return render(request, 'staff.html')

def liststaff(request):
    data=stf.objects.filter(thtr__login_id=request.session['id'])
    print(request.session['id'])
    context={
        'data':data
    }
    return render(request, 'liststaff.html',context)
def delete_staff(request ):
    stf.objects.filter(staffid=request.GET['id']).delete()
    return redirect('liststaff')

def staffhome(request):
    role=request.session.get("role","")
    if role != "staff":
        return redirect("index")
    return render(request, 'staffhome.html')


def addshow(request):
    movie=mov.objects.filter(status='active')
    context={'movie':movie}
    if request.session['role']=='staff':
        data=stf.objects.get(login_id=request.session['id'])
        if request.POST:
            t1=request.POST["t1"]
            t2=request.POST['t2']
            t3=request.POST["t3"]
            t4=request.POST["t4"]
            t6=request.POST["t6"]
            shw.objects.create(movie_id=t1,theatre_id=data.thtr_id,showtime=t2,rate=t3,date=t4,seats=t6,status="active")
            return redirect('list_show')
        else:
            return render(request, 'addshow.html',context)
    if request.session['role']=='theatre':
        data_t=ttr.objects.get(login_id=request.session['id'])
        if request.POST:
            t1=request.POST["t1"]
            t2=request.POST['t2']
            t3=request.POST["t3"]
            t4=request.POST["t4"]
            t6=request.POST["t6"]
            shw.objects.create(movie_id=t1,theatre_id=data_t.theatreid,showtime=t2,rate=t3,date=t4,seats=t6,status="active")
            return redirect('list_show')
        else:
            return render(request, 'add_show.html',context)
    
def list_show(request):
    if request.session['role']=='staff':
        data=stf.objects.get(login_id=request.session['id'])
        show=shw.objects.filter(theatre_id=data.thtr_id,status='active')
        context={'data':show}
        return render(request, 'list_show.html',context)
    if request.session['role']=='theatre':
        data=ttr.objects.get(login_id=request.session['id'])
        show=shw.objects.filter(theatre_id=data.theatreid,status='active')
        context={'data':show}
        return render(request, 'listshow.html',context)



def delete_show(request):
    id=request.GET['id']
    shw.objects.filter(showid=id).delete()
    return redirect('list_show')

def book_show(request):
    context={}
    context['msg']=''
    today=datetime.date.today()
    id=request.GET['id']
    data=shw.objects.filter(movie_id=id).exclude(date__lt=today)
    context['data']=data
    datac=data.count()
    context['datac']=datac
    datat=ttr.objects.all()
    context['datat']=datat
    return render(request, 'book_show.html',context)



def book(request):
    context={}
    context['role']=request.session['role']
    if request.POST:
        context['msg']=''
        t1=request.POST["t1"]
        context['showid']=t1
        t2=request.POST['t2']
        t3=request.POST["t3"]
        t4=request.POST["t4"]
        context['seats']=t4
        amount=int(t2)*int(t4)
        context['amount']=amount
        return render(request, 'payment.html',context)
    context['msg']=''
    id=request.GET['id']
    data=shw.objects.get(showid=id)
    context['data']=data
    return render(request, 'book.html',context)
def payment(request):
    if request.POST:
        print('hi')
        t1=request.POST["t1"]
        t2=request.POST['t2']
        t3=request.POST["t3"]
        t4=request.POST["t4"]
        data=shw.objects.get(showid=t1)
        data.seats=int(data.seats)-int(t2)
        data.save()
        user=usr.objects.get(Log_id=request.session['id'])
        bok.objects.create(user=user,show=data,tickets=t2,amount=t4)
        return redirect('/index')
def booked_history(request):
    context={}
    context['msg']=''
    data=bok.objects.filter(user__Log_id=request.session['id'])
    context['data']=data
    context['role']=request.session['role']
    return render(request, 'bookedhistory.html',context)