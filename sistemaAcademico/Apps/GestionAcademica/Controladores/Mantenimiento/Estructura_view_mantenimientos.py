from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.urls import reverse_lazy
from django.views.generic import CreateView, ListView

from sistemaAcademico.Apps.GestionAcademica import forms
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *
import socket
from django.views.decorators.cache import cache_page

from sistemaAcademico.Apps.GestionAcademica.Forms.Admision.forms_mantenimientos import *

class Mantenimiento(ListView):
    model= MantPersona
    queryset = model.objects.filter(estado=97).select_related('id_genr_tipo_usuario').values('identificacion','nombres','apellidos','id_genr_tipo_usuario')
    context_object_name='mantenimiento'
    template_name = 'sistemaAcademico/Admision/Mantenimiento/admision_personas.html'

def mantenimientoPersonas(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/Mantenimiento/admision_personas.html')
    else:
        return HttpResponseRedirect('timeout/')


def registro_estudiante(request):
    error = None
    if (request.method == "POST"):
        form = EstudianteForm(request.POST)
        if (form.is_valid()):
            form.save()
            return redirect("Academico:menu")
        else:
            error = "No se pudo Guardar el formulario"
    else:
        form = EstudianteForm()
    return render(request, "sistemaAcademico/Admision/Mantenimiento/form_reg_estudiante.html", {"form": form, "error": error })


class NuevoEmpleado(CreateView):
    model = MantPersona
    form_class = CrearEmpleado
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_reg_empleado.html'
    success_url = reverse_lazy('Academico:registrar_empleado')


def registro_empleado(request):
    if 'usuario' in request.session:
        return render(request, 'sistemaAcademico/Admision/Mantenimiento/form_reg_empleado.html')
    else:
        return HttpResponseRedirect('timeout/')