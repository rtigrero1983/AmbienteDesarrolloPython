from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import socket

def mantenimientoPersonas(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/admision_personas.html')
    else:
        return HttpResponseRedirect('timeout/')