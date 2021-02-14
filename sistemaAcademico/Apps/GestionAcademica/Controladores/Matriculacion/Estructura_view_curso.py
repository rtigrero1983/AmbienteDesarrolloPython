from django.urls import reverse_lazy
from django.views.generic import CreateView, ListView, UpdateView, DeleteView
from django.shortcuts import render, redirect
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovCabCurso
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_matriculacion import CabCursoForm
from django.http import HttpResponseRedirect, HttpResponse

class CreateCurso(CreateView):

    model = MovCabCurso
    form_class = CabCursoForm
    success_url = reverse_lazy('Academico:cursos')
    template_name = 'sistemaAcademico/Matriculacion/Curso/create_curso.html'

    def get_context_data(self,**kwargs):
        contexto = {}
        contexto['form'] = self.form_class()
        return contexto

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request,self.template_name,self.get_context_data())
        else:
            return HttpResponseRedirect('timeout/')


class ListaCurso(ListView):
    model = MovCabCurso
    template_name = 'sistemaAcademico/Matriculacion/Curso/lista_curso.html'
    context_object_name = 'cursos'

    def get_queryset(self):
        return self.model.objects.all()

    def get_context_data(self,**kwargs):
        contexto = {}
        contexto['cursos'] = self.get_queryset()
        return contexto

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request, self.template_name, self.get_context_data())
        else:
            return HttpResponseRedirect('timeout/')



class UpdateCurso(UpdateView):
    model = MovCabCurso
    form_class = CabCursoForm
    template_name = 'sistemaAcademico/Matriculacion/Curso/edit_curso.html'
    success_url = reverse_lazy('Academico:cursos')
    context_object_name = 'c'

class DeleteCurso(DeleteView):
    model =  MovCabCurso
    template_name = 'sistemaAcademico/Matriculacion/Curso/eliminar_curso.html'
    success_url = reverse_lazy('Academico:cursos')
    context_object_name = 'c'

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            self.object = self.get_object()
            context = self.get_context_data(object=self.object)
            return render(request, self.template_name,context )
        else:
            return HttpResponseRedirect('/timeout/')