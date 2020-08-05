from django.urls import reverse_lazy
from django.views.generic import CreateView

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import Mov_Horas_docente
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_mov_anio_curso import MovHorasDocentesForm


class CreateHorasDocentes(CreateView):
    form_class = MovHorasDocentesForm
    model = Mov_Horas_docente
    template_name = 'sistemaAcademico/Matriculacion/HorasDocentes/horasDocentes.html'
    success_url = reverse_lazy('Academico:inicio')