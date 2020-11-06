from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleRegistroNotas
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral

class Registro_notas_form(forms.ModelForm):
    class Meta:
        model = MovDetalleRegistroNotas
        fields = [
            "primer_parcial",
            "segundo_parcial",
            "tercer_parcial",
            "promedio_parciales",
            "examen",
            "examen_supletorio",
            "examen_gracia",
            "disciplina",
            "total_promedio_general",
        ]
        labels = {
            "primer_parcial": "Nota del primer parcial",
            "segundo_parcial": "Nota del segundo parcial",
            "tercer_parcial": "Nota del tercer parcial",
            "examen": "Nota del examen",
            "examen_supletorio": "Nota del examen de supletorio",
            "examen_gracia": "Nota del examen de gracia",
            "disciplina": "Conducta",
            "total_promedio_general": "Promedio total",
            "promedio_parciales": "Promedio de los parciales",
        }
        widgets = {
            "primer_parcial": forms.NumberInput(attrs={"class": "form-control", "placeholder": "Ingrese la calificación del primer parcial"}),
            "segundo_parcial": forms.NumberInput(attrs={"class": "form-control", "placeholder": "Ingrese la calificación del segundo parcial"}),
            "tercer_parcial": forms.NumberInput(attrs={"class": "form-control", "placeholder": "Ingrese la calificación del tercer parcial"}),
            "examen": forms.NumberInput(attrs={"class": "form-control", "placeholder": "Ingrese la calificación del examen"}),
            "examen_supletorio": forms.NumberInput( attrs={"class": "form-control", "placeholder": "Ingrese la calificación del examen de supletorio"}),
            "examen_gracia": forms.NumberInput(attrs={"class": "form-control", "placeholder": "Ingrese la calificación del examen de gracia"}),
            "disciplina": forms.TextInput(attrs={"class": "form-control", "placeholder": "Ingrese la disciplina"}),
            "nombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Empleado"}),
            "promedio_parciales":forms.TextInput(attrs={"class": "form-control"}),
            "total_promedio_general": forms.TextInput(attrs={"class": "form-control"}),
        }

    