from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.urls import reverse_lazy
from django.views.generic import CreateView, ListView, UpdateView

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
    queryset = model.objects.filter(estado=97).select_related('id_genr_tipo_usuario').values('id_persona','nombres','apellidos','identificacion')
    context_object_name='mantenimiento'
    template_name = 'sistemaAcademico/Admision/Mantenimiento/admision_personas.html'



class NuevoEmpleado(CreateView):
    model = MantPersona
    form_class = EmpleadoForm
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_reg_empleado.html'
    success_url = reverse_lazy('Academico:registro_empleado')


class UpdateEmpleado(UpdateView):
    model = MantPersona
    form_class = EmpleadoForm
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_edit_empleado.html'
    success_url = reverse_lazy('Academico:editar_empleado')
    context_object_name = 'm'


class NuevoEstudiante(CreateView):
    model = MantPersona
    form_class = EstudianteForm

    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_reg_estudiante.html'
    success_url = reverse_lazy('Academico:registro_estudiante')

    def get_context_data(self, **kwargs):
        context = super(NuevoEstudiante, self).get_context_data(**kwargs)
        pk = self.kwargs.get('id_persona', 0)
        context['id_persona'] = pk
        return context



    def post(self, request, *args, **kwargs):
        self.object = self.get_object
        form = self.form_class(request.POST)
        if (form.is_valid()):
            usuario = 'anderson'
            form.estado=97
            form.fecha_ingreso = '2020-02-02'
            form.usuario_ing = usuario
            form.terminal_ing = socket.gethostname()
            form.save()
            return redirect(self.get_success_url())
        else:
            print("error")
            return self.render_to_response(self.get_context_data(form=form))



class UpdateEstudiante(UpdateView):
    model = MantPersona
    form_class = EstudianteForm
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_edit_estudiante.html'
    success_url = reverse_lazy('Academico:editar_estudiante')
    context_object_name = 'm'
