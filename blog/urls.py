

from django.urls import path
from . import views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('', views.index,name="index"),
    path('index', views.index,name="index"),
    path('login', views.login,name="login"),
    path('signup', views.signup,name="signup"),
    path('Logout', views.Logout,name="Logout"),
    path('Adminhome', views.Adminhome,name="Adminhome"),
    path('Privacy', views.Privacy,name="Privacy"),
    path('personals', views.personals,name="personals"),
    path('category', views.category,name="category"),
    path('productions', views.productions,name="productions"),
    path('newpost', views.newpost,name="newpost"),
    path('posts', views.posts,name="posts"),
    path('delete_person', views.delete_person,name="delete_person"),
    path('delete_category', views.delete_category,name="delete_category"),
    path('delete_productions', views.delete_productions,name="delete_productions"),
    path('delete_posts', views.delete_posts,name="delete_posts"),
    path('post_details', views.post_details,name="post_details"),
    path('post_details_actor', views.post_details_actor,name="post_details_actor"),
    path('delete_crew', views.delete_crew,name="delete_crew"),

    path('delete_movie_cat', views.delete_movie_cat,name="delete_movie_cat"),
    path('post_add_cat', views.post_add_cat,name="post_add_cat"),
    path('delete_crew', views.delete_crew,name="delete_crew"),
    path('movie_details', views.movie_details,name="movie_details"),
    path('rating', views.rating,name="rating"),
    path('totest', views.totest,name="totest"),
    path('tester', views.tester,name="tester"),

    path('managetheatre', views.managetheatre,name="managetheatre"),
    path('theatrehome', views.theatrehome,name="theatrehome"),
    path('addstaff', views.addstaff,name="addstaff"),
     path('liststaff', views.liststaff,name="liststaff"),
     path('delete_staff', views.delete_staff,name="delete_staff"),
   
    path('listtheatre', views.listtheatre,name="listtheatre"),
    path('delete_theatre', views.delete_theatre,name="delete_theatre"),

    path('staffhome',views.staffhome,name="staffhome"),
    path('addshow',views.addshow,name="addshow"),
    path('list_show',views.list_show,name="list_show"),
    path('delete_show',views.delete_show,name="delete_show"),

    path('book_show',views.book_show,name="book_show"),
    path('book',views.book,name="book"),
    path('booked_history',views.booked_history,name="booked_history"),
    path('payment',views.payment,name="payment"),


]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
