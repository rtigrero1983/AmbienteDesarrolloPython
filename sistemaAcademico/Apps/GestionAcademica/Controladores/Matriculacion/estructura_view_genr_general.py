from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django_filters.views import FilterView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.froms_tabla_referencial_cursos import *
from django.shortcuts import render, redirect
from django.shortcuts import render
class general(ListView):
    model = GenrGeneral
    template_name = 'sistemaAcademico/Matriculacion/tabla_referencial_cursos/Listar_general.html'
    queryset = model.objects.filter(tipo='TIP')


class CreateGeneral (CreateView):
    model = GenrGeneral
    template_name = 'sistemaAcademico/Matriculacion/tabla_referencial_cursos/Agregar_general.html'
    form_class = GenrGeneral_1
    success_url = reverse_lazy('Academico:general')

class UpdateGeneral (UpdateView):
    model = GenrGeneral
    template_name = 'sistemaAcademico/Matriculacion/tabla_referencial_cursos/Editar_general.html'
    form_class = GenrGeneral_1
    success_url = reverse_lazy('Academico:general')
    context_object_name = 'F'

