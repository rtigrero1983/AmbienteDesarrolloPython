from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from crispy_forms.layout import *
from crispy_forms.helper import *
from django.forms.widgets import *
from django.template import Template, Context

class Mov_Aniolectivo_curso_forms(forms.ModelForm):
    class Meta:
        model = Mov_Aniolectivo_curso
        fields = [
            "id_anio_electivo",
            "id_curso",
            "id_genr_paralelo",
        ]
        labels = {
            "id_anio_electivo": 'Año electivo',
            "id_curso": 'Curso',
            "id_genr_paralelo": 'Paralelo',
        }
        widgets = {
            "id_anio_electivo": forms.Select(),
            "id_curso": forms.Select(),
        }
    def __init__(self, *args, **kwargs):
        super(Mov_Aniolectivo_curso_forms, self).__init__(*args, **kwargs)
        self.fields['id_genr_paralelo'].queryset = GenrGeneral.objects.filter(tipo='TPL')

class MovHorasDocentesForm(forms.ModelForm):
    class Meta:
        model = Mov_Horas_docente
        fields = [
            'total_horas',
            'horas_disponible',
            'id_empleado'
        ]
        labels = {
            'total_horas': 'Horas Laborables',
            'horas_disponible': 'Horas Disponibles',
            'id_empleado': 'Docente'
        }
        widgets = {
            'total_horas': forms.NumberInput(attrs={'class': 'form-control'}),
            'horas_disponible': forms.NumberInput(attrs={'class': 'form-control'}),
        }
    def __init__(self, *args, **kwargs):
        super(MovHorasDocentesForm, self).__init__(*args, **kwargs)
        self.fields['id_empleado'].query = MantEmpleado.objects.all()

# -------Asignacion materia a profesor
class MovMateriaProfesorForm(forms.ModelForm):
    class Meta:
        model = Mov_Materia_profesor
        fields = [
                'id_empleado',
                'id_detalle_materia_curso',
                ]
        labels = {
                'id_empleado': 'Profesor',
                'id_detalle_materia_curso': 'Materias',
                }
        widgets = {
            "id_detalle_materia_curso": forms.CheckboxSelectMultiple(),
        }

    def __init__(self, *args, **kwargs):
        super(MovMateriaProfesorForm, self).__init__(*args, **kwargs)
        self.fields['id_detalle_materia_curso'].queryset = MovDetalleMateriaCurso.objects.filter(id_genr_materias__tipo='MAT')#.select_related('nombre')
        self.fields['id_empleado'].empty_label = "Seleccione un profesor"
        self.helper = FormHelper()
        self.helper.layout = Layout(
            Field('checkboxselectmultiple'),
            Field('multiple'),
        )


