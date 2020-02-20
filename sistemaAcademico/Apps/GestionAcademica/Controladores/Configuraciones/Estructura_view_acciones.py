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

def add_acciones(request):
    queryset = ConfMenu.objects.filter(url__icontains='Academico:')
    if request.method=='POST':
       descripcion = request.POST.get('descripcion')
       menu = request.POST.get('menu')
       ConfAccion.objects.create(descripcion=descripcion,id_menu=ConfMenu.objects.get(id_menu=menu))
       return redirect('Academico:acciones')
    return render(request,'sistemaAcademico/Configuraciones/Acciones/add_acciones.html',{'a':queryset})

class Acciones(ListView):
    model = ConfAccion
    queryset = ConfAccion.objects.filter(id_genr_estado=97).select_related('id_menu')
    template_name = 'sistemaAcademico/Configuraciones/Acciones/acciones.html'
    context_object_name = 'a'

def eliminar_accion(request,id):
    try:
        a = ConfAccion.objects.get(id_accion=id)
        if request.method=='POST':
            a.id_genr_estado = GenrGeneral.objects.get(idgenr_general=98)
            a.save()
            return redirect('Academico:acciones')
        return render(request,'sistemaAcademico/Configuraciones/Acciones/delete_acciones.html',{'a':a})
    except Exception as e:
        raise e



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




