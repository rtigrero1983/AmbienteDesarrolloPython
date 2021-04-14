from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleRegistroNotas
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral


class EstudianteForm2(forms.ModelForm):
    class Meta:
        model = MovDetalleRegistroNotas
        fields = [

                  'primer_parcial_2Q',
                  'segundo_parcial_2Q',
                  'tercer_parcial_2Q',
                  'promedio_parciales_2Q',
                  'examen_2Q',

                  'promedio_general_2',


                  ]

        labels = {


                  'primer_parcial_2Q':'Nota Primer Parcial',
                  'segundo_parcial_2Q':'Nota Segundo Parcial',
                  'tercer_parcial_2Q':'Nota Tercer Parcial',
                  'promedio_parciales_2Q':'Promedio Parciales',
                  'examen_2Q':'Examen',
                  'promedio_general_2': 'Promedio General',



                  }

        widgets={
            'primer_parcial_2Q':forms.NumberInput(attrs={'class':'form-control'}),
            'segundo_parcial_2Q':forms.NumberInput(attrs={'class':'form-control'}),
            'tercer_parcial_2Q':forms.NumberInput(attrs={'class':'form-control'}),
            'promedio_parciales_2Q':forms.NumberInput(attrs={'readonly':True,'class':'form-control'}),

            #'promedio_parciales': forms.NumberInput(attrs={'class': 'form-control'}),
            'examen_2Q': forms.NumberInput(attrs={'class': 'form-control'}),

            'promedio_general_2': forms.NumberInput(attrs={'readonly':True,'class': 'form-control'}),
        }


