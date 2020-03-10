import pickle
from django.db import models
from django.urls import path

from sistemaAcademico.Apps.GestionAcademica.Controladores.API.Estructuras_view_api import *
from sistemaAcademico.Apps.GestionAcademica.Controladores.Configuraciones.Estructura_view_reportes import *
from sistemaAcademico.Apps.GestionAcademica.Controladores.Configuraciones.estructura_view_SMTP import smtp_view,smtp_edit
from sistemaAcademico.Apps.GestionAcademica.Filters.filters_admision import GEN_autocomplete, TID_autocomplete

from .Controladores.Reportes_especiales.Estructura_view_reportes import reportes
from .views import *
from .Controladores.Configuraciones.Estructura_view_acciones import *
from .Controladores.Mantenimiento.Estructura_view_mantenimientos import *
from .Diccionario.Estructuras_tablas_conf import *
from .Diccionario.Estructuras_tablas_mant import *
from .Diccionario.Estructuras_tablas_mov import *
from django.views.decorators.cache import cache_page


urlpatterns = [
    path('',login, name='login'),
    path('salir/', salir, name='logout'),
    path('inicio/', inicio, name='inicio'),
    path('usuarios/', Usuarios.as_view(), name='usuarios'),
    path('roles/', Roles.as_view(), name='roles'),
    path('menu/', Menu.as_view(), name='menu'),

    path('modulo/', Modulo.as_view(), name='modulo'),
    path('empresas/', empresas, name='empresas'),

    #Opciones para el modulo de Admision
    path('empleado/', Empleado.as_view(), name='empleado'),
    path('estudiante/', Estudiante.as_view(), name='estudiante'),
    path('movimientos/', movimientos, name='movimientos'),
    path('consultas/', consultas, name='consultas'),
    path('procesos/', procesos, name='procesos'),
    path('reportes/', reportes, name='reportes'),
    path('editar_smtp/<int:pk>',smtp_edit.as_view(),name='edit_smtp'),
    # ----------------REGISTROS--------------
    path('nueva_empresa/', NuevaEmpre.as_view(), name='nueva_empresa'),

    path('nuevo_usuario/', CreateUsuario.as_view(), name='nuevo_usuario'),
    path('nuevo_rol/', nuevo_rol, name='nuevo_rol'),
    #path('nuevo_menu/', nuevo_menu, name='nuevo_menu'),
    path('nuevo_menu/', CreateMenu.as_view(), name='nuevo_menu'),
    path('nuevo_modulo/', NuevoModulo.as_view(), name='nuevo_modulo'),

    path('agregar_permisos/<int:id>',CreatePermiso.as_view() ,name='agregar_per'),


    #------- Url de permisos 
    path('agregar_permisos/',CreatePermiso.as_view() ,name='agregar_per'),
    path('editar_permiso/<int:pk>', UpdatePermisos.as_view(), name='editar_permiso'),
    path('permisos/', ListPermisos.as_view(), name='permisos'),

    #---Url de Acciones
    path('acciones/', Acciones.as_view(), name='acciones'),
    path('nueva_accion/', Add_Accion.as_view(), name='nueva_accion'),
    path('editar_accion/<int:pk>/', Edit_acciones.as_view(), name='editar_accion'),

    #Url de Usuarios temporales
    path('agregar_smtp/',smtp_view,name='agregar_smtp'),
    # -------------EDICION---------------------
    path('editar_empresa/<int:id>', editar_empresa, name='editar_empresa'),
    path('editar_modulo/<int:pk>/', UpdateModulo.as_view(), name='editar_modulo'),
    path('editar_empresa/<int:pk>/', UpdateEmpre.as_view(), name='editar_empresa'),
    path('editar_usuario/<int:pk>/',UpdateUsuario.as_view(), name='editar_usuario'),
    #path('editar_usuario/(?P<pk>[0-9]+)\\/$',UpdateUsuario.as_view(), name='editar_usuario'),
    path('editar_rol/<int:id>', editar_rol, name='editar_rol'),
    path('editar_menu/<int:pk>', UpdateMenu.as_view(), name='editar_menu'),
    #path('editar_menu/<int:id>', editar_menu, name='editar_menu'),
    
    #path('editar_modulo/<int:id>', editar_modulo, name='editar_modulo'),
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
    path('movimientos/' + 'timeout/', timeout, name='timeout_movimientos'),
    path('mantenimiento/' + 'timeout/', timeout, name='timeout_mantenimiento'),

    #-----Rest-framework-APIS
    path('api_menu/', Menu_api.as_view(), name='api_menu'),
    path('api_modulo/', Modulo.as_view(), name='api_modulo'),

    #Opciones para el modulo de Mantenimiento
    #Crear
    path('registro_estudiante/', NuevoEstudiante.as_view(), name='registro_estudiante'),
    path('registro_empleado/', NuevoEmpleado.as_view(), name='registro_empleado'),
    #Editar
    path('editar_empleado/', UpdateEmpleado.as_view(), name='editar_empleado'),
    #Eliminar


    #------------Reportes de Configuraciones---------------
    path('reporte_usuarios/', reporte_usuarios, name='reporte_usuarios'),
    path('reporte_roles/', reporte_roles, name='reporte_roles'),

    # ------------Reportes de Mantenimiento---------------
    path('reporte_estudiante/',reporte_estudiante, name='reporte_estudiante'),
    path('reporte_empleado/', reporte_empleado, name='reporte_empleado'),


    #---------Django-Autocomplete-Filters----------
    path('TID_autocomplete/', TID_autocomplete.as_view(), name='TID_autocomplete'),
    path('GEN_autocomplete/', GEN_autocomplete, name='GEN_autocomplete'),

]






