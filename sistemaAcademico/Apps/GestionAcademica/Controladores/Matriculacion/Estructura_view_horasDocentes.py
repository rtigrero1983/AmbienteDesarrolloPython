from django.urls import reverse_lazy
from django.views.generic import CreateView

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import Mov_Horas_docente
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_mov_anio_curso import MovHorasDocentesForm
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, redirect

class CreateHorasDocentes(CreateView):
    form_class = MovHorasDocentesForm
    model = Mov_Horas_docente
    template_name = 'sistemaAcademico/Matriculacion/HorasDocentes/horasDocentes.html'
    success_url = reverse_lazy('Academico:inicio')

    def get_context_data(self,**kwargs):
        contexto = {}
        contexto['form'] = self.form_class()
        return contexto

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request,self.template_name,self.get_context_data())
        else:
            return HttpResponseRedirect('timeout/')