from django.urls import path
from .views import inicio,base,login

urlpatterns = [
    path('base/',base, name = 'base'),
    path('inicio/',inicio,name='inicio'),
    path('login/',login,name='login'),
]