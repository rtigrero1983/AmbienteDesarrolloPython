from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_matriculacion import *
from django.shortcuts import render, redirect


class List_AnioLectivo (ListView):
    model = MantAnioLectivo
    template_name = 'sistemaAcademico/Matriculacion/Aniolectivo/Aniolectivo.html'
    context_object_name = 'Aniolectivo'
    queryset = MantAnioLectivo.objects.filter(id_genr_estado=97)
class UpdateAniolectivo (UpdateView):
    model = MantAnioLectivo
    template_name = 'sistemaAcademico/Matriculacion/Aniolectivo/Update_Aniolectivo.html'
    form_class = Aniolectivo
    success_url = reverse_lazy('Academico:Aniolectivo')
    context_object_name = 'A'
class CreateAniolectivo (CreateView):
    model = MantAnioLectivo
    template_name = 'sistemaAcademico/Matriculacion/Aniolectivo/Create_Aniolectivo.html'
    form_class = Aniolectivo
    success_url = reverse_lazy('Academico:Aniolectivo')
def eliminar_Aniolectivo(request, id):
    anio = MantAnioLectivo.objects.get(id_anio_lectivo=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        anio.id_genr_estado = inactivo
        anio.save()
        return redirect('Academico:Aniolectivo')
    return render(request, 'sistemaAcademico/Matriculacion/Aniolectivo/DeleteAniolectivo.html', {'anio': anio})

