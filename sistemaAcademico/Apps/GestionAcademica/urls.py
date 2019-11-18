from django.urls import path
from .views import inicio,base,login,usuarios,roles,perfiles,menu,modulo,acciones,mantenimientoPersonas,movimientos,consultas,procesos,reportes

urlpatterns = [
    path('base/',base, name = 'base'),
    path('inicio/',inicio,name='inicio'),
    path('login/',login,name='login'),

    #Opciones del modulo de Configuaciones:
    path('usuarios/',usuarios,name='usuarios'),
    path('roles/',roles,name='roles'),
    path('perfiles/',perfiles,name='perfiles'),
    path('menu/',menu,name='menu'),
    path('modulo/',modulo,name='modulo'),
    path('acciones/',acciones,name='acciones'),
    #----------------------------------------

    #Opciones para el modulo de Admision
    path('mantenimiento personas/',mantenimientoPersonas,name='mantenimiento_personas'),
    path('movimientos/',movimientos, name='movimientos'),
    path('consultas/',consultas, name='consultas'),
    path('procesos/',procesos, name='procesos'),
    path('reportes/',reportes, name='reportes'),
    #--------------------------------------

]