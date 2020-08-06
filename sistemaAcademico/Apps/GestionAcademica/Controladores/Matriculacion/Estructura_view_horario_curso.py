from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.urls import reverse_lazy
from django.views.generic import CreateView, ListView, UpdateView

from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import *
import socket
from sistemaAcademico.Apps.GestionAcademica import forms
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_mov_horario_curso import *



class CrearHorarioCurso(CreateView):
    model = Mov_Horario_materia
    form_class = HorarioCursoForm
    template_name = 'sistemaAcademico/Matriculacion/Horario_curso/crear_horario_curso.html'
    success_url = reverse_lazy('Academico:horariocurso')

    def post(self, request, *args, **kwargs):
        self.object = self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
            horariocurso = form.save()
            usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
            horariocurso.fecha_ingreso = timezone.now()
            horariocurso.usuario_ing = usuario.usuario
            horariocurso.terminal_ing = socket.gethostname()
            form.save()
            return HttpResponseRedirect(self.get_success_url())
        else:
            return self.render_to_response(self.get_context_data(form=form))