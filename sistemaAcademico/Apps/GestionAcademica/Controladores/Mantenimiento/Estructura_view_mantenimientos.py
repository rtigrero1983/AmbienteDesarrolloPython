from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import socket
from django.views.decorators.cache import cache_page

cache_page(60*15)


def mantenimientoPersonas(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/Mantenimiento/admision_personas.html')
    else:
        return HttpResponseRedirect('timeout/')


def registro_estudiante(request):
    if 'usuario' in request.session:
        return render(request, 'sistemaAcademico/Admision/Mantenimiento/form_reg_estudiante.html')
    else:
        return HttpResponseRedirect('timeout/')

def registro_empleado(request):
    if 'usuario' in request.session:
        return render(request, 'sistemaAcademico/Admision/Mantenimiento/form_reg_empleado.html')
    else:
        return HttpResponseRedirect('timeout/')