from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleMateriaCurso
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral

class Mov_Materia_Curso_forms(forms.ModelForm):

    class Meta:
        model = MovDetalleMateriaCurso
        fields = [
            "id_mov_anio_lectivo_curso",
            'id_genr_materias',
            "total_horas",
        ]
        labels={
            "id_mov_anio_lectivo_curso": 'Curso',
            "id_genr_materias":'Materias',
            'total_horas':'Horas',
        }
        widgets={
            "id_mov_anio_lectivo_curso":forms.Select(),
            'total_horas':forms.TextInput()
        }
    def __init__(self, *args, **kwargs):
        super(Mov_Materia_Curso_forms, self).__init__(*args, **kwargs)
        self.fields['id_genr_materias'].queryset = GenrGeneral.objects.filter(tipo='MAT')

