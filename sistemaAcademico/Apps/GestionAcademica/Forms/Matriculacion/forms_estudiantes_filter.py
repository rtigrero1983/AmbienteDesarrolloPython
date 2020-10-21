from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantEstudiante
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
from django import forms

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovMatriculacionEstudiante
class FilterEstudinatesestadoforms(forms.ModelForm):
    class Meta:
        model=MovMatriculacionEstudiante
        fields=['estado']
        labels={
            'estado':'Estado'
        }
        widgets={
            'estado':forms.Select(attrs={'class':'form-control'})
        }
    def __init__(self, *args, **kwargs):
        super(FilterEstudinatesestadoforms, self).__init__(*args, **kwargs)
        self.fields['estado'].queryset = GenrGeneral.objects.filter(tipo='STA')
class FilterTipoEstudinatesforms(forms.ModelForm):
    class Meta:
        model=MantEstudiante
        fields=['tipo_estudiante',]
        labels={
            'tipo_estudiante':'Tipo estudiantes'
        }
        widgets={
            'tipo_estudiante':forms.TextInput(attrs={'class':'form-control'})
        }
