from django.views.generic import ListView, UpdateView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *
from django.shortcuts import render, redirect, get_object_or_404 

from django.http import HttpResponseRedirect, HttpResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.views.decorators.cache import cache_page


class List_docente(ListView):
    model = Mov_Materia_profesor
    template_name = 'sistemaAcademico/reportes/AsignacionProfesores.html' 
    context_object_name = 'lista_profesor'
    queryset = model.objects.filter(id_empleado__id_persona__estado = 97)
   

class List_docente_asignado(ListView):
    model = Mov_Materia_profesor
    template_name = 'sistemaAcademico/reportes/AsignacionProfesores.html'
    context_object_name = 'lista_profesor_asignados'
    queryset = Mov_Materia_profesor.objects.filter(id_empleado__id_persona__estado = 97)
    def get(self, request):
        context = {'lista_profesor_asignados': None}
        profesores = []
        for q in self.queryset:
            if q.id_detalle_materia_curso.exists():
                profesores.append(q)
                print("kjkjkjk", profesores)
        context['lista_profesor_asignados'] = profesores
        return render(request, self.template_name, context)
       
class List_docente_sin_asignar(ListView):
    model = Mov_Materia_profesor
    template_name = 'sistemaAcademico/reportes/AsignacionProfesores.html'
    context_object_name = 'lista_profesor_sin_asignar'
    queryset = Mov_Materia_profesor.objects.filter(id_empleado__id_persona__estado = 97)
    def get(self, request):
        context = {'lista_profesor_sin_asignar': None}
        profesores = []
        for q in self.queryset:
            if not q.id_detalle_materia_curso.exists():
                profesores.append(q)
                print("NM", profesores)
        context['lista_profesor_sin_asignar'] = profesores
        return render(request, self.template_name, context)


def eliminar_profesor(request, id):
    profesor = Mov_Materia_profesor.objects.get(id_materia_profesor=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        profesor.id_empleado.id_persona.estado = inactivo
        profesor.id_empleado.id_persona.save()
        print('cheche', profesor.id_empleado.id_persona.estado)

        return redirect('Academico:asignacion_materiasprof')
    return render(request, 'sistemaAcademico/Matriculacion/Asignacion_Mprofesor/eliminarProfesor.html', {'asignacion_materiasprof': profesor})

