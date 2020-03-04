from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from django.views.generic import ListView, CreateView, UpdateView
import socket
from sistemaAcademico.Apps.GestionAcademica.Forms.Configuracion.forms_configuraciones import Permisosform


class ListPermisos(ListView):
    model = ConfPermiso
    queryset = ConfPermiso.objects.all().select_related('id_rol')
    template_name = 'sistemaAcademico/Configuraciones/Permisos/permisos.html'
    context_object_name = 'p'

class CreatePermiso(CreateView):
    model = ConfPermiso
    form_class = Permisosform
    template_name = "sistemaAcademico/Configuraciones/Permisos/add_permisos.html"
    success_url = reverse_lazy("Academico:permisos")


class UpdatePermisos(UpdateView):
    model = ConfPermiso
    form_class = Permisosform
    context_object_name = 'p'
    template_name = "sistemaAcademico/Configuraciones/Permisos/asignar_permisos.html"
    success_url = reverse_lazy('Academico:permisos')
