from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleRegistroNotas
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral


class Generales_notas_form(forms.ModelForm):
    class Meta:
        model = MovDetalleRegistroNotas
        fields = [
            "disciplina",
            "examen_supletorio",
            "examen_remedial",
            "examen_gracia",


        ]
        labels = {
            "disciplina": "Comportamiento",
            "examen_supletorio": "Examen Supretorio",
            "examen_remedial": "Examen Remedial",
            "examen_gracia": "Examen Gracia",

        }
        widgets = {
            "disciplina": forms.TextInput(attrs={"class": "form-control"}),
            "examen_supletorio": forms.NumberInput(attrs={"class": "form-control"}),
            "examen_remedial": forms.NumberInput(attrs={"class": "form-control"}),
            "examen_gracia": forms.NumberInput(attrs={"class": "form-control"}),
        }

