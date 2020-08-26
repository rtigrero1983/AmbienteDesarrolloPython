from django.urls import reverse_lazy
from django.views.generic import CreateView, ListView, UpdateView

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovCabCurso
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_matriculacion import CabCursoForm


class CreateCurso(CreateView):

    model = MovCabCurso
    form_class = CabCursoForm
    success_url = reverse_lazy('Academico:cursos')
    template_name = 'sistemaAcademico/Matriculacion/Curso/create_curso.html'


class ListaCurso(ListView):
    model = MovCabCurso
    queryset = model.objects.all()
    template_name = 'sistemaAcademico/Matriculacion/Curso/lista_curso.html'
    context_object_name = 'cursos'

class UpdateCurso(UpdateView):
    model = MovCabCurso
    form_class = CabCursoForm
    template_name = 'sistemaAcademico/Matriculacion/Curso/edit_curso.html'
    success_url = reverse_lazy('Academico:cursos')
    context_object_name = 'c'
