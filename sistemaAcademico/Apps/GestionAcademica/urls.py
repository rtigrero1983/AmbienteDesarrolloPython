from django.urls import path
from .views import inicio

urlpatterns = [
    path('base/',inicio, name = 'base'),

]