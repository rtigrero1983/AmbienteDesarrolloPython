from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import socket


def roles(request):
    if 'usuario' in request.session:
        roles= ConfRol.objects.all()
        return render(request,'sistemaAcademico/Configuraciones/Roles/rol.html', {'lista_roles': roles})
    else:
        return HttpResponseRedirect('../')


def nuevo_rol(request):
    return render(request, 'sistemaAcademico/Configuraciones/Roles/add_rol.html')


def editar_rol(request):
    return render(request, 'sistemaAcademico/Configuraciones/Roles/editar_rol.html')