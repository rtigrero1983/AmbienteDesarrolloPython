from django.urls import path
from .views import *
urlpatterns = [
path('reporte/', view_reporte, name = 'reporte'),
path('reporteRol/', view_Rol, name = 'reporteRol'),
path('reportePersona/', view_mantpersona, name='reportePersona'),
path('reporteEmpleado/', view_mantempleado, name='reporteEmpleado'),
path('reporte_ejemplo/',eventos_ejecutados,name='reporte_ejemplo'),
]