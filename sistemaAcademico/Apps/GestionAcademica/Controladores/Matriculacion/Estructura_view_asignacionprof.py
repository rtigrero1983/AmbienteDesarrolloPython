from django.views.generic import ListView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import *
from django.shortcuts import render, redirect

class List_docente(ListView):
    model = Mov_Materia_profesor
    template_name = 'sistemaAcademico/reportes/AsignacionProfesores.html'
    context_object_name = 'lista_profesor'
    queryset = Mov_Materia_profesor.objects.all()

   