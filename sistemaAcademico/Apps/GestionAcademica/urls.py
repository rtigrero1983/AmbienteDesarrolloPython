import pickle
from django.db import models
from django.urls import path

from sistemaAcademico.Apps.GestionAcademica.Controladores.API.Estructuras_view_api import *
from sistemaAcademico.Apps.GestionAcademica.Controladores.Configuraciones.estructura_view_SMTP import smtp_view
from .views import *
from .Controladores.Configuraciones.Estructura_view_acciones import *
from .Diccionario.Estructuras_tablas_conf import *
from .Diccionario.Estructuras_tablas_mant import *
from .Diccionario.Estructuras_tablas_mov import *
from django.views.decorators.cache import cache_page

urlpatterns = [
    path('',login, name='login'),
    path('salir/', salir, name='logout'),
    path('inicio/', inicio, name='inicio'),
    path('usuarios/', usuarios, name='usuarios'),
    path('roles/', roles, name='roles'),
    path('perfiles/', perfiles, name='perfiles'),
    path('menu/', Menu.as_view(), name='menu'),
    path('acciones/', acciones, name='acciones'),
    path('permisos/', perfiles, name='permisos'),
    path('pruebas/', pruebas, name='pruebas'),
    path('modulo/', Modulo.as_view(), name='modulo'),
    path('empresas/', empresas, name='empresas'),

    #Opciones para el modulo de Admision
    path('mantenimiento_personas/', mantenimientoPersonas,name='Personas'),
    path('movimientos/', movimientos, name='movimientos'),
    path('consultas/', consultas, name='consultas'),
    path('procesos/', procesos, name='procesos'),
    path('reportes/', reportes, name='reportes'),

    # ----------------REGISTROS--------------
    path('nueva_empresa/', nueva_empresa, name='nueva_empresa'),
    path('nuevo_usuario/', nuevo_usuario, name='nuevo_usuario'),
    path('nuevo_rol/', nuevo_rol, name='nuevo_rol'),
    path('nuevo_menu/', nuevo_menu, name='nuevo_menu'),
    path('nuevo_modulo/', NuevoModulo.as_view(), name='nuevo_modulo'),
    path('add_permiso/', add_permiso, name='add_permiso'),

    path('agregar_smtp/',smtp_view,name='agregar_smtp'),
    # -------------EDICION---------------------
    path('editar_empresa/<int:id>', editar_empresa, name='editar_empresa'),
    path('editar_usuario/<int:id>', editar_usuario, name='editar_usuario'),
    path('editar_rol/<int:id>', editar_rol, name='editar_rol'),
    path('editar_menu/<int:id>', editar_menu, name='editar_menu'),
    path('editar_permiso/<int:id>', editar_permiso, name='editar_permiso'),
    path('editar_modulo/<int:id>', editar_modulo, name='editar_modulo'),
    path('eliminar_modulo/<int:id>', eliminar_modulo, name='eliminar_modulo'),
    # -----------------------------------------

    #------------ELIMINACION----------------------
    path('eliminar_registro/<int:id>', eliminar_menu, name='eliminar_menu'),
    path('eliminar/<int:id>', eliminar_empresa, name='eliminar'),
    path('eliminar_usuario/<int:id>', eliminar_usuario, name='eliminar_usuario'),
    path('eliminar_rol/<int:id>', eliminar_rol, name='eliminar_rol'),
    #---------------------------------------------
    path('Pantalla_principal/',pantalla_principal,name='pantalla_principal'),

#--------------timeout-------
    path('timeout/', timeout, name='timeout'),
    path('inicio/' + 'timeout/', timeout, name='timeout_inicio'),
    path('acciones/' + 'timeout/', timeout, name='timeout_acciones'),
    path('perfiles/' + 'timeout/', timeout, name='timeout_perfiles'),
    path('roles/' + 'timeout/', timeout, name='timeout_roles'),
    path('menu/' + 'timeout/', timeout, name='timeout_menu'),
    path('modulo/' + 'timeout/', timeout, name='timeout_modulo'),
    path('usuarios/' + 'timeout/', timeout, name='timeout_usuarios'),
    path('empresas/' + 'timeout/', timeout, name='timeout_empresas'),
    path('movimientos/' + 'timeout/', timeout, name='timeout_empresas'),
    path('mantenimiento_personas/' + 'timeout/', timeout, name='timeout_empresas'),

    #-----Rest-framework-APIS
    path('api_menu/', Menu_api.as_view(), name='api_menu'),
    path('api_modulo/', Modulo.as_view(), name='api_modulo'),

    #Opciones para el modulo de Mantenimiento
    path('registro_estudiante/', registro_estudiante, name='registro_estudiante'),
]






