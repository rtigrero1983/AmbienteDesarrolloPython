from django import forms
from django.db.models import Q

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantAnioLectivo, MantPersona
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import Mov_Aniolectivo_curso, \
    MovCabCurso, Mov_Horas_docente
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral

class Mov_Aniolectivo_curso_forms(forms.ModelForm):

    class Meta:
        model = Mov_Aniolectivo_curso
        fields = [
            "id_anio_electivo",
            "id_curso",
            "id_genr_paralelo",
        ]
        labels={
            "id_anio_electivo":'Año electivo',
            "id_curso":'Curso',
            "id_genr_paralelo":'Paralelo',
        }
        widgets={
            "id_anio_electivo":forms.Select(),
            "id_curso":forms.Select(),
            "id_genr_paralelo": forms.SelectMultiple(),

        }
    def __init__(self, *args, **kwargs):
        super(Mov_Aniolectivo_curso_forms, self).__init__(*args, **kwargs)
        self.fields['id_genr_paralelo']=forms.MultipleChoiceField(choices=[(
            i.idgenr_general , i.nombre) for i in GenrGeneral.objects.filter(tipo='PAR')], widget={})



class MovHorasDocentesForm(forms.ModelForm):

    class Meta:
        model=Mov_Horas_docente
        fields=[
            'id_anio_lectivo',
            'total_horas',
            'horas_disponible',
            'id_docente'
        ]

        labels={
            'id_anio_lectivo':'Año Lectivo',
            'total_horas':'Horas Laborables',
            'horas_disponible':'Horas Disponibles',
            'id_docente':'Docente'
        }

        widgets={

            'total_horas':forms.NumberInput(attrs={'class':'form-control'}),
            'horas_disponible':forms.NumberInput(attrs={'class':'form-control'}),

        }

    def __init__(self, *args, **kwargs):
        super(MovHorasDocentesForm, self).__init__(*args, **kwargs)
        self.fields['id_anio_lectivo'].query = MantAnioLectivo.objects.filter(id_genr_estado=97)
        self.fields['id_docente'].query = MantPersona.objects.filter(id_genr_tipo_usuario=20)