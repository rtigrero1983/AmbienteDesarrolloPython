from django.db.models import Q
from django.views.generic import ListView, CreateView, UpdateView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_matriculacion import *
from django.shortcuts import render, redirect


class List_AnioLectivo (ListView):
    model = MantAnioLectivo
    template_name = 'sistemaAcademico/Matriculacion/Aniolectivo/Aniolectivo.html'
    context_object_name = 'anio_lectivo'
    queryset = MantAnioLectivo.objects.filter(Q(id_genr_estado=97) | Q(id_genr_estado=99) |Q(id_genr_estado=1784))

class UpdateAniolectivo (UpdateView):
    model = MantAnioLectivo
    template_name = 'sistemaAcademico/Matriculacion/Aniolectivo/Update_Aniolectivo.html'
    form_class = UpAniolectivo
    success_url = reverse_lazy('Academico:anio_lectivo')
    context_object_name = 'a'

class CreateAniolectivo (CreateView):
    model = MantAnioLectivo
    template_name = 'sistemaAcademico/Matriculacion/Aniolectivo/Create_Aniolectivo.html'
    form_class = Aniolectivo
    success_url = reverse_lazy('Academico:anio_lectivo')


def eliminar_Aniolectivo(request, id):
    anio = MantAnioLectivo.objects.get(id_anio_lectivo=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        anio.id_genr_estado = inactivo
        anio.save()
        return redirect('Academico:anio_lectivo')
    return render(request, 'sistemaAcademico/Matriculacion/Aniolectivo/DeleteAniolectivo.html', {'anio': anio})

