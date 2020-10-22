from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django_filters.views import FilterView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.froms_general import *
from django.shortcuts import render, redirect
from django.shortcuts import render
class General(ListView):
    model = GenrGeneral


    template_name = 'sistemaAcademico/Matriculacion/general/Listar_general.html'



class CreateGeneral (CreateView):
    model = GenrGeneral
    template_name = 'sistemaAcademico/Matriculacion/General/Agregar_general.html'
    form_class = GenrGeneral_1
    context_object_name = 'F'
    success_url = reverse_lazy('Academico:general')


class UpdateGeneral (UpdateView):
    model = GenrGeneral
    template_name = 'sistemaAcademico/Matriculacion/General/Editar_general.html'
    form_class = GenrGeneral_1
    success_url = reverse_lazy('Academico:general')
    context_object_name = 'F'

