from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from django.views.generic import ListView, CreateView, UpdateView
import socket
from sistemaAcademico.Apps.GestionAcademica.Forms.Configuracion.forms_configuraciones import Permisosform



def reporte_usuarios(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Configuraciones/Reportes/reporte_usuario.html')
    else:
        return HttpResponseRedirect('../')


def reporte_roles(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico//Configuraciones/Reportes/reporte_usuario.html')
    else:
        return HttpResponseRedirect('../')