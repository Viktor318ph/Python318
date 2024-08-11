from django.contrib import admin
from django.urls import path
from todo import views

urlpatterns = [
    path('admin/', admin.site.urls),

    # Auth
    path('signup/', views.signupuser, name='signupuser'),
    path('logout/', views.logoutuser, name='logoutuser'),
    path('login/', views.loginuser, name='loginuser'),

    # Todos
    path('current', views.currenttodos, name='currenttodos'),
    path('', views.home, name='home'),
    path('create/', views.createtodo, name='createtodo'),
]
