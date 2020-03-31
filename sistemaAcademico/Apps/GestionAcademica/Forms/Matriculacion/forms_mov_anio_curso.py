from django import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import Mov_Aniolectivo_curso,MovCabCurso
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