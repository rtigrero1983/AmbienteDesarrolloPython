from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import socket
from django.views.decorators.cache import cache_page

cache_page(60*10)
def acciones(request):
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Configuraciones/Acciones/acciones.html')
    else:

        return HttpResponseRedirect('timeout/')