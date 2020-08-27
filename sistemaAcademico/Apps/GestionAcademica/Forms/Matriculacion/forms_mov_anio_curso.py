from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantAnioLectivo, MantPersona, MantEmpleado
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral

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

#-------HORARIO MOD
class MovMateriaProfesorForm(forms.ModelForm):
    class Meta:
        model = Mov_Materia_profesor
        fields = [
                'id_detalle_materia_curso',
                ]
        labels = {
                'id_detalle_materia_curso': 'Materias',
                }
        widgets = {

                }
    def __init__(self, *args, **kwargs):
        super(MovMateriaProfesorForm, self).__init__(*args, **kwargs)
        self.fields['id_detalle_materia_curso'].queryset = GenrGeneral.objects.filter(tipo='MAT')
        #self.fields['id_detalle_materia_curso'].empty_label = "Seleccione las materias"

