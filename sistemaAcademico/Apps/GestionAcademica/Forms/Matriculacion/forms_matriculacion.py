from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *
from django import forms


class Aniolectivo (forms.ModelForm):
    class Meta:
        model =MantAnioLectivo
        fields = ['anio',
                  'ciclo',
                  'fecha_incio_ciclo',
                  'fecha_fin_ciclo']
        labels = {'anio': 'Año',
                  'ciclo': 'Ciclo',
                  'fecha_incio_ciclo': 'Inicio del ciclo',
                  'fecha_fin_ciclo': 'Fin del ciclo'}
        widgets = {'anio': forms.NumberInput(attrs={"class": "form-control", "placeholder": "Ingrese el año lectivo"}),
                   'ciclo': forms.NumberInput(attrs={"class": "form-control", "placeholder": "Ingrese el ciclo"}),
                   'fecha_incio_ciclo': forms.DateTimeInput(attrs={"class": "form-control text-dark", "type": "date"}),
                   'fecha_fin_ciclo': forms.DateTimeInput(attrs={"class": "form-control text-dark", "type": "date"})}

