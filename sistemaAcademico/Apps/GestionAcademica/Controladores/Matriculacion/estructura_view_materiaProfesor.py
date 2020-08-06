from django.urls import reverse_lazy
from django.views.generic import CreateView

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import Mov_Materia_profesor
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_mov_anio_curso import MovMateriaProfesorForm


class MovMateriProfesorList(CreateView):
    model = Mov_Materia_profesor
    template_name = 'sistemaAcademico/Matriculacion/HorarioMod/horarioMod.html'
    form_class = MovMateriaProfesorForm
    success_url = reverse_lazy('Academico:inicio')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["regimen"] = GenrGeneral.objects.filter(tipo='REG')
        context["jornada"] = GenrGeneral.objects.filter(tipo='JOR')
        context["modalidad"] = GenrGeneral.objects.filter(tipo='MOD')
        context["tipo_educacion"] = GenrGeneral.objects.filter(tipo='TEP')
        context["nivel"] = GenrGeneral.objects.filter(tipo='NIV')

        return context