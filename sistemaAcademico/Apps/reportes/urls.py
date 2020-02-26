from django.urls import path
from .views import *
urlpatterns = [
path('reporte/', view_reporte, name = 'reporte'),
path('reporteRol', reporte_excel_rol, name = 'reporteRol')

]