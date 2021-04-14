from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleRegistroNotas
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral





class EstudianteFormEdit(forms.ModelForm):
    class Meta:
        model = MovDetalleRegistroNotas
        fields = [
                  'primer_parcial',
                  'segundo_parcial',
                  'tercer_parcial',
                  'promedio_parciales',
                  'examen',
                  'promedio_general_1',

                  ]

        labels = {
                  'primer_parcial':'Nota Primer Parcial',
                  'segundo_parcial':'Nota Segundo Parcial',
                  'tercer_parcial':'Nota Tercer Parcial',
                  'promedio_parciales':'Promedio Parciales',
                  'examen':'Examen',
                  'promedio_general_1': 'Promedio Quimestre',
                  }

        widgets={
            'primer_parcial':forms.NumberInput(attrs={'class':'form-control'}),
            'segundo_parcial':forms.NumberInput(attrs={'class':'form-control'}),
            'tercer_parcial':forms.NumberInput(attrs={'class':'form-control'}),
            'promedio_parciales':forms.NumberInput(attrs={'readonly':True,'class':'form-control'}),
            'examen': forms.NumberInput(attrs={'class': 'form-control'}),
            'promedio_general_1': forms.NumberInput(attrs={'readonly':True,'class': 'form-control'}),

        }


