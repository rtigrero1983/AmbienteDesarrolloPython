from django.urls import path
from .views import *

urlpatterns = [
    path('login/',login,name='login'),
    path('base/',base, name = 'base'),
    path('inicio/',inicio,name='inicio'),

    #Opciones del modulo de Configuaciones:
    path('usuarios/',usuarios,name='usuarios'),
    path('roles/',roles,name='roles'),
    path('perfiles/',perfiles,name='perfiles'),
    path('menu/',menu,name='menu'),
    path('modulo/',modulo,name='modulo'),
    path('acciones/',acciones,name='acciones'),
    #----------------------------------------

    #Opciones para el modulo de Admision
    path('mantenimiento personas/',mantenimientoPersonas,name='mantenimientoPersonas'),
    path('movimientos/',movimientos, name='movimientos'),
    path('consultas/',consultas, name='consultas'),
    path('procesos/',procesos, name='procesos'),
    path('reportes/',reportes, name='reportes'),
    #--------------------------------------

    path('salir/',salir,name='logout')

]