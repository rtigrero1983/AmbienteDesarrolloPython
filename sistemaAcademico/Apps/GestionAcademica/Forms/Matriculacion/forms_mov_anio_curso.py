from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantAnioLectivo, MantPersona, \
    MantEmpleado
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import Mov_Aniolectivo_curso,MovCabCurso, Mov_Horas_docente
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

#-------HORARIO MOD JOEL JOSUE HUACON LOPEZ 
class MovMateriaProfesorForm(forms.ModelForm):
    class Meta:
        model = MovCabCurso
        fields = [
                'id_genr_regimen',
                'id_genr_jornada',
                'id_genr_modalidad',
                'id_genr_tipo_edu',
                ]
        labels = {
                'id_genr_modalidad': 'Modalidad',
                'id_genr_jornada': 'Jornada',
                'id_genr_tipo_edu': 'Tipo Educacion',
                'id_genr_regimen': 'Regimen',
                }
    def __init__(self, *args, **kwargs):
        super(MovMateriaProfesorForm, self).__init__(*args, **kwargs)
        self.fields['id_genr_modalidad'].queryset = GenrGeneral.objects.filter(tipo='MOD')
        self.fields['id_genr_modalidad'].empty_label = "Seleccione la Modalidad"
        self.fields['id_genr_jornada'].queryset = GenrGeneral.objects.filter(tipo='JOR')
        self.fields['id_genr_jornada'].empty_label = "Seleccione la Jornada"
        self.fields['id_genr_tipo_edu'].queryset = GenrGeneral.objects.filter(tipo='TEP')
        self.fields['id_genr_tipo_edu'].empty_label = "Seleccione el Tipo Educacion"
        self.fields['id_genr_regimen'].queryset = GenrGeneral.objects.filter(tipo='REG')
        self.fields['id_genr_regimen'].empty_label = "Seleccione el Regimen"
