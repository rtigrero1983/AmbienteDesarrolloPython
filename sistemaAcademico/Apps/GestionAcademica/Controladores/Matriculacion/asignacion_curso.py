from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_mov_anio_curso import Mov_Aniolectivo_curso_forms
from django.shortcuts import render, redirect
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import Mov_Aniolectivo_curso
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
from django.http import HttpResponseRedirect, HttpResponse


class Create_Mov_Aniolectivo_curso(CreateView):
    model = Mov_Aniolectivo_curso
    form_class = Mov_Aniolectivo_curso_forms
    template_name = 'sistemaAcademico/Matriculacion/Asignacion_curso/crear_asig_curso.html'
    success_url = reverse_lazy('Academico:asignacion_curso')

    def get_context_data(self,**kwargs):
        contexto = {}
        contexto['form'] = self.form_class()
        return contexto

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request,self.template_name,self.get_context_data())
        else:
            return HttpResponseRedirect('timeout/')


class Update_Mov_Aniolectivo_curso(UpdateView):
    model = Mov_Aniolectivo_curso
    form_class = Mov_Aniolectivo_curso_forms
    context_object_name = 'anio'
    template_name = 'sistemaAcademico/Matriculacion/Asignacion_curso/edit_asig_curso.html'
    success_url = reverse_lazy('Academico:asignacion_curso')
    
    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            self.object = self.get_object()
            context = self.get_context_data(object=self.object)
            return render(request, self.template_name,context )
        else:
            return HttpResponseRedirect('timeout/')


class ListaAnioElectivoCurso(ListView):
    model = Mov_Aniolectivo_curso
    context_object_name = 'anio'
    template_name = 'sistemaAcademico/Matriculacion/Asignacion_curso/listar_asig_curso.html'

    def get_queryset(self):
        return self.model.objects.filter(id_estado_gnral=97)

    def get_context_data(self,**kwargs):
        contexto = {}
        contexto['anio'] = self.get_queryset()
        return contexto

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request, self.template_name, self.get_context_data())
        else:
            return HttpResponseRedirect('timeout/')

def eliminar_Asignacion_Curso(request, id):
    if 'usuario' in request.session:
        dic={  }
        anio = Mov_Aniolectivo_curso.objects.get(id_mov_anioelectivo_curso=id)
        list_p = Mov_Aniolectivo_curso.objects.filter(id_mov_anioelectivo_curso=id)
        inactivo = GenrGeneral.objects.get(idgenr_general=98)
        dic['list_p']=list_p
        dic['anio'] = anio
        if request.method == 'POST':
            anio.id_estado_gnral = inactivo
            anio.save()
            return redirect('Academico:asignacion_curso')
        return render(request, 'sistemaAcademico/Matriculacion/Asignacion_curso/eliminar_asig_curso.html', dic)
    else:
        return HttpResponseRedirect('timeout/')