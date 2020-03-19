from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_matriculacion import *
from django.shortcuts import render, redirect
def crear_asig_curso(request):
    return render(request,'sistemaAcademico/Matriculacion/Asignacion_curso/crear_asig_curso.html')
def edit_asig_curso(request):
    return render(request,'sistemaAcademico/Matriculacion/Asignacion_curso/edit_asig_curso.html')
def eliminar_asig_curso(request):
    return render(request,'sistemaAcademico/Matriculacion/Asignacion_curso/eliminar_asig_curso.html')
def asig_curso(request):
    return render(request,'sistemaAcademico/Matriculacion/Asignacion_curso/listar_asig_curso.html')