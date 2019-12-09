from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import socket


def acciones(request):
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Configuraciones/acciones.html')
    else:
        return HttpResponseRedirect('../')