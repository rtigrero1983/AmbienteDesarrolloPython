from django.urls import path
from .views import *

urlpatterns = [
    path('base/',base, name = 'base'),
    path('inicio/',inicio,name='inicio'),
    path('login/',login,name='login'),

    #Opciones del modulo de Configuaciones:
    path('perfiles/',perfiles,name='perfiles'),
    path('menus/', lista_menus,name='menu'),
    path('modulos/',lista_modulos,name='modulo'),
    path('acciones/',acciones,name='acciones'),
    path('permisos/', lista_permisos, name='permisos'),
    #path('roles/', lista_rol, name='rol'),
    path('empresas/', lista_em, name='empresas'),
    path('usuarios/', lista_us, name='usuarios'),

    #formularios de registro
    path('add_empresa/', addempresa, name='add_empresa'),
    path('add_rol/', addrol, name='add_rol'),
    path('add_usuario/', addusuario, name='add_usuario'),

    #formularios de edicion
    path('edit_usuario', editar_usuario, name='edit_usuario'),

    #----------------------------------------

    #Opciones para el modulo de Admision
    path('mantenimiento personas/',mantenimientoPersonas,name='mantenimiento_personas'),
    path('movimientos/',movimientos, name='movimientos'),
    path('consultas/',consultas, name='consultas'),
    path('procesos/',procesos, name='procesos'),
    path('reportes/',reportes, name='reportes'),
    #--------------------------------------

]