from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_mov_anio_curso import Mov_Aniolectivo_curso_forms
from django.shortcuts import render, redirect
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import Mov_Aniolectivo_curso
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral



class Create_Mov_Aniolectivo_curso(CreateView):
    model = Mov_Aniolectivo_curso
    form_class = Mov_Aniolectivo_curso_forms
    template_name = 'sistemaAcademico/Matriculacion/Asignacion_curso/crear_asig_curso.html'
    success_url = reverse_lazy('Academico:asignacion_curso')
class Update_Mov_Aniolectivo_curso(UpdateView):
    model = Mov_Aniolectivo_curso
    form_class = Mov_Aniolectivo_curso_forms
    context_object_name = 'anio'
    template_name = 'sistemaAcademico/Matriculacion/Asignacion_curso/edit_asig_curso.html'
    success_url = reverse_lazy('Academico:asignacion_curso')
class ListaAnioElectivoCurso(ListView):
    model = Mov_Aniolectivo_curso
    context_object_name = 'anio'
    queryset = Mov_Aniolectivo_curso.objects.filter(id_estado_gnral=97)
    template_name = 'sistemaAcademico/Matriculacion/Asignacion_curso/listar_asig_curso.html'
def eliminar_Asignacion_Curso(request, id):
    dic={  }
    anio = Mov_Aniolectivo_curso.objects.get(id_mov_anioelectivo_curso=id)
    lis_anio = Mov_Aniolectivo_curso.objects.filter(id_mov_anioelectivo_curso=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    dic['anio']=anio
    dic['lis_anio']=lis_anio
    if request.method == 'POST':
        anio.id_estado_gnral = inactivo
        anio.save()
        return redirect('Academico:asignacion_curso')
    return render(request, 'sistemaAcademico/Matriculacion/Asignacion_curso/eliminar_asig_curso.html', dic)
