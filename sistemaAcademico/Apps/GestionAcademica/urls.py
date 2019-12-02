from django.urls import path
from .views import *

urlpatterns = [
    path('',login,name='login'),
    path('base/',base, name = 'base'),
    path('inicio/',inicio,name='inicio'),

    #Opciones del modulo de Configuaciones:
    path('usuarios/',usuarios,name='usuarios'),
    path('roles/',roles,name='roles'),
    path('perfiles/',perfiles,name='perfiles'),
    path('menu/',menu,name='menu'),
    path('modulo/',modulo,name='modulo'),
    path('acciones/',acciones,name='acciones'),
   # path('permisos/', permisos, name='permisos'),
    path('empresas/', empresas, name='empresas'),
    #----------------------------------------
    # /////////////RREGISTROS///////////
    path('nueva_empresa/', nueva_empresa, name='nueva_empresa'),
    path('nuevo_usuario/', nuevo_usuario, name='nuevo_usuario'),
    path('nuevo_rol/', nuevo_rol, name='nuevo_rol'),
    path('nuevo_menu/', nuevo_menu, name='nuevo_menu'),
    # ---------------------------------

    # -------------EDICION---------------------
    path('editar_empresa/', editar_empresa, name='editar_empresa'),
    path('editar_usuario/', editar_usuario, name='editar_usuario'),
    path('editar_rol/', editar_rol, name='editar_rol'),
    # -----------------------------------------

    #Opciones para el modulo de Admision
    path('mantenimiento personas/',mantenimientoPersonas,name='mantenimientoPersonas'),
    path('movimientos/',movimientos, name='movimientos'),
    path('consultas/',consultas, name='consultas'),
    path('procesos/',procesos, name='procesos'),
    path('reportes/',reportes, name='reportes'),
    #--------------------------------------

    path('salir/',salir,name='logout')


]