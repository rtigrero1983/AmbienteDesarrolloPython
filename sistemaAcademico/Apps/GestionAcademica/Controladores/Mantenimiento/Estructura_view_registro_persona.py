from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
import socket
from django.views.decorators.cache import cache_page

cache_page(60*15)

def registro_estudiante(request):
    if 'usuario' in request.session:
        return render(request, 'sistemaAcademico/Mantenimiento/form_reg_estudiante.html')
    else:
        return HttpResponseRedirect('timeout/')