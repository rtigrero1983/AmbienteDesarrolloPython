from django.views.generic import ListView, CreateView, UpdateView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_mov_materia_curso import Mov_Materia_Curso_forms
from django.shortcuts import render, redirect
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleMateriaCurso
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
class Crear_materia_curso(CreateView):
    model = MovDetalleMateriaCurso
    form_class = Mov_Materia_Curso_forms
    template_name = 'sistemaAcademico/Matriculacion/Asignacion_Materia_Curso/crear.html'
    success_url = reverse_lazy('Academico:asignacion_materia_curso')
class Editar_materia_curso(UpdateView):
    model = MovDetalleMateriaCurso
    form_class = Mov_Materia_Curso_forms
    context_object_name = 'mat'
    template_name = 'sistemaAcademico/Matriculacion/Asignacion_Materia_Curso/edit.html'
    success_url = reverse_lazy('Academico:asignacion_materia_curso')
class Listar_materia_curso(ListView):
    model = MovDetalleMateriaCurso
    context_object_name = 'mat'
    queryset = MovDetalleMateriaCurso.objects.filter(estado=97)
    template_name = 'sistemaAcademico/Matriculacion/Asignacion_Materia_Curso/listar.html'
def eliminar_materia_curso(request, id):
    dic={}
    mat = MovDetalleMateriaCurso.objects.get(id_detalle_materia_curso=id)
    materia = MovDetalleMateriaCurso.objects.filter(id_detalle_materia_curso=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    dic['mat']=mat
    dic['materia']=materia
    if request.method == 'POST':
        mat.estado = inactivo
        mat.save()
        return redirect('Academico:asignacion_materia_curso')
    return render(request, 'sistemaAcademico/Matriculacion/Asignacion_Materia_Curso/eliminar.html', dic)
