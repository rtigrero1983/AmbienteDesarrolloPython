from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.urls import reverse_lazy
from django.utils import timezone
from django.views.generic import CreateView,ListView,UpdateView

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import socket
from django.views.decorators.cache import cache_page

from sistemaAcademico.Apps.GestionAcademica.Forms.Configuracion.forms_configuraciones import AccionesForm


def acciones(request):
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Configuraciones/Acciones/acciones.html')
    else:

        return HttpResponseRedirect('timeout/')

class Acciones(ListView):
    model = ConfAccion
    queryset = ConfAccion.objects.filter(id_genr_estado=97)
    template_name = 'sistemaAcademico/Configuraciones/Acciones/acciones.html'
    context_object_name = 'a'



class Nueva_Accion(CreateView):
    model = ConfAccion
    form_class = AccionesForm
    template_name = 'sistemaAcademico/Configuraciones/Acciones/add_acciones.html'
    success_url = reverse_lazy('Academico:acciones')

class Edit_acciones(UpdateView):
    model = ConfAccion
    template_name = 'sistemaAcademico/Configuraciones/Acciones/add_acciones.html'
    success_url = reverse_lazy('Academico:acciones')
    form_class = AccionesForm
    context_object_name = 'm'




