from django import forms
from sistemaAcademico.Apps.GestionAcademica.models import Mov_Aniolectivo_curso


class UploadFileForm(forms.Form):
    
    
    LISTA = Mov_Aniolectivo_curso.objects.filter(id_estado_gnral=97)
    print(LISTA)
    curso= forms.ChoiceField(choices=( (x.id_mov_anioelectivo_curso, x) for x in LISTA ),widget=forms.Select(attrs={'class':'form-control'}))
    file = forms.FileField(required=True,widget=forms.FileInput(attrs={'class':'form-control'}))

        

    