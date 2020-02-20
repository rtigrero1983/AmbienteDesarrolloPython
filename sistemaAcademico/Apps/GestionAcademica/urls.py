import pickle
from django.db import models
from django.urls import path

from sistemaAcademico.Apps.GestionAcademica.Controladores.API.Estructuras_view_api import *
from sistemaAcademico.Apps.GestionAcademica.Controladores.Configuraciones.estructura_view_SMTP import smtp_view
from sistemaAcademico.Apps.GestionAcademica.Filters.filters_admision import GEN_autocomplete
from .views import *
from .Controladores.Configuraciones.Estructura_view_acciones import *
from .Controladores.Mantenimiento.Estructura_view_mantenimientos import *
from .Diccionario.Estructuras_tablas_conf import *
from .Diccionario.Estructuras_tablas_mant import *
from .Diccionario.Estructuras_tablas_mov import *
from django.views.decorators.cache import cache_page

from ..Filters import TID_autocomplete

urlpatterns = [
    path('',login, name='login'),
    path('salir/', salir, name='logout'),
    path('inicio/', inicio, name='inicio'),
    path('usuarios/', usuarios, name='usuarios'),
    path('roles/', Roles.as_view(), name='roles'),
    path('perfiles/', perfiles, name='perfiles'),
    path('menu/', Menu.as_view(), name='menu'),
    path('acciones/', Acciones.as_view(), name='acciones'),
    path('permisos/', perfiles, name='permisos'),
    path('modulo/', Modulo.as_view(), name='modulo'),
    path('empresas/', empresas, name='empresas'),

    #Opciones para el modulo de Admision
    path('mantenimiento/', Mantenimiento.as_view(), name='mantenimiento'),
    path('movimientos/', movimientos, name='movimientos'),
    path('consultas/', consultas, name='consultas'),
    path('procesos/', procesos, name='procesos'),
    path('reportes/', reportes, name='reportes'),

    # ----------------REGISTROS--------------
    path('nueva_empresa/', NuevaEmpre.as_view(), name='nueva_empresa'),

    path('nuevo_usuario/', CreateUsuario.as_view(), name='nuevo_usuario'),
    path('nuevo_rol/', nuevo_rol, name='nuevo_rol'),
    #path('nuevo_menu/', nuevo_menu, name='nuevo_menu'),
    path('nuevo_menu/', CreateMenu.as_view(), name='nuevo_menu'),
    path('nuevo_modulo/', NuevoModulo.as_view(), name='nuevo_modulo'),
    path('nueva_accion/', add_acciones, name='nueva_accion'),
    path('add_permiso/<int:id>', editar_permisos,name='add_permiso'),
    path('agregar_permisos/<int:id>',add_permiso,name='agregar_per'),

    path('agregar_smtp/',smtp_view,name='agregar_smtp'),
    # -------------EDICION---------------------
    path('editar_empresa/<int:id>', editar_empresa, name='editar_empresa'),

    path('editar_modulo/<int:pk>/', UpdateModulo.as_view(), name='editar_modulo'),
    path('editar_empresa/<int:pk>/', UpdateEmpre.as_view(), name='editar_empresa'),
    path('editar_usuario/<int:id>', editar_usuario, name='editar_usuario'),
    path('editar_rol/<int:id>', editar_rol, name='editar_rol'),
    path('editar_menu/<int:pk>', UpdateMenu.as_view(), name='editar_menu'),
    #path('editar_menu/<int:id>', editar_menu, name='editar_menu'),
    path('editar_permiso/<int:id>', editar_permisos, name='editar_permiso'),
    #path('editar_modulo/<int:id>', editar_modulo, name='editar_modulo'),
    path('eliminar_modulo/<int:id>', eliminar_modulo, name='eliminar_modulo'),
    # -----------------------------------------

    #------------ELIMINACION----------------------
    path('eliminar_registro/<int:id>', eliminar_menu, name='eliminar_menu'),
    path('eliminar/<int:id>', eliminar_empresa, name='eliminar'),
    path('eliminar_usuario/<int:id>', eliminar_usuario, name='eliminar_usuario'),
    path('eliminar_rol/<int:id>', eliminar_rol, name='eliminar_rol'),
    path('eliminar_accion/<int:id>', eliminar_accion, name='eliminar_accion'),
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
    path('movimientos/' + 'timeout/', timeout, name='timeout_movimientos'),
    path('mantenimiento/' + 'timeout/', timeout, name='timeout_mantenimiento'),

    #-----Rest-framework-APIS
    path('api_menu/', Menu_api.as_view(), name='api_menu'),
    path('api_modulo/', Modulo.as_view(), name='api_modulo'),

    #Opciones para el modulo de Mantenimiento
    #Crear
    path('registro_estudiante/', registro_estudiante, name='registro_estudiante'),
    path('registro_empleado/', NuevoEmpleado.as_view(), name='registro_empleado'),
    #Editar
    path('editar_empleado/', UpdateEmpleado.as_view(), name='editar_empleado'),
    #Eliminar

    #---------Django-Autocomplete-Filters----------
    path('TID_autocomplete/', TID_autocomplete.as_view(), name='TID_autocomplete'),
    path('GEN_autocomplete/', GEN_autocomplete, name='GEN_autocomplete'),
]






