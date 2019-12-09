from django.urls import path
from .views import *


urlpatterns = [

    path('',login,name='login'),
    path('salir/',salir,name='logout'),
    path('base/',base, name='base'),
    path('inicio/',inicio,name='inicio'),
    path('usuarios/',usuarios,name='usuarios'),
    path('roles/',roles,name='roles'),
    path('perfiles/',perfiles,name='perfiles'),
    path('menu/',menu,name='menu'),
    path('modulo/',modulo,name='modulo'),
    path('acciones/',acciones,name='acciones'),
    #path('permisos/', permisos, name='permisos'),
    path('empresas/', empresas, name='empresas'),



    #Opciones para el modulo de Admision
    path('mantenimiento_personas/',mantenimientoPersonas,name='mantenimientoPersonas'),
    path('movimientos/',movimientos, name='movimientos'),
    path('consultas/',consultas, name='consultas'),
    path('procesos/',procesos, name='procesos'),
    path('reportes/',reportes, name='reportes'),
    #--------------------------------------


    # ----------------REGISTROS--------------
    path('nueva_empresa/', nueva_empresa, name='nueva_empresa'),
    path('nuevo_usuario/', nuevo_usuario, name='nuevo_usuario'),
    path('nuevo_rol/', nuevo_rol, name='nuevo_rol'),
    path('nuevo_menu/',nuevo_menu, name='nuevo_menu'),
    path('nuevo_modulo/', nuevo_modulo, name='nuevo_modulo'),
    path('add_permiso/',add_permiso, name='add_permiso'),
    # ---------------------------------

    # -------------EDICION---------------------
    path('editar_empresa/<int:id>', editar_empresa, name='editar_empresa'),
    path('editar_usuario/', editar_usuario, name='editar_usuario'),
    path('editar_rol/', editar_rol, name='editar_rol'),
    path('editar_menu/<int:id>',editar_menu, name='editar_menu'),
    path('editar_permiso/<int:id>',editar_permiso,name='editar_permiso'),
    # -----------------------------------------

    #------------ELIMINACION----------------------
    path('eliminar_registro/<int:id>',eliminar_menu,name='eliminar_menu'),
    path('eliminar/<int:id>', eliminar_empresa, name='eliminar')
    #---------------------------------------------
    


]