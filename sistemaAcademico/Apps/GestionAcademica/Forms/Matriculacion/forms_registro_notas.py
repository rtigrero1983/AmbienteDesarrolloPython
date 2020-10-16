from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleRegistroNotas
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral

class Registro_notas_form(forms.ModelForm):
    class Meta:
        model = MovDetalleRegistroNotas
        fields = [
            "id_matriculacion_estudiante",
            "primer_parcial",
            "segundo_parcial",
            "tercer_parcial",
            "promedio_parciales",
            "examen",
            "examen_supletorio",
            "examen_gracia",
            "disciplina",
            "total_promedio_general",
            "id_materia_profesor",
            "id_general_quimestre",
        ]
        labels = {
            "id_matriculacion_estudiante": "Nombre del estudiante",
            "primer_parcial": "Nota del primer parcial",
            "segundo_parcial": "Nota del segundo parcial",
            "tercer_parcial": "Nota del tercer parcial",
            "examen": "Nota del examen",
            "examen_supletorio": "Supletorio",
            "examen_gracia": "Gracia",
            "disciplina": "Conducta",
            "total_promedio_general": "Promedio total",
            "promedio_parciales": "Promedio de los parciales",
            "id_materia_profesor": "Materia profesor",
            "id_general_quimestre": "Quimestre",
        }
        """widgets = {
            "id_anio_electivo": forms.Select(),
            "id_curso": forms.Select(),
        }"""

    def __init__(self, *args, **kwargs):
        super(Registro_notas_form, self).__init__(*args, **kwargs)
        self.fields['id_general_quimestre'].queryset = GenrGeneral.objects.filter(tipo='QUI')