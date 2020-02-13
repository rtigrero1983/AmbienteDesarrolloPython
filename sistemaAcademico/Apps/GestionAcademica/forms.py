

from . import models
from django import forms

class SMTPForm(forms.ModelForm):
    class Meta:
        model = models.ConfCorreosSmpt
        fields = [
            "ssl",
            "dominio",
            "puerto",
            "usuario_c",
            "contraseña_c",
            "descripcion",
        ]
        labels = {
            "ssl":"Seguridad SSL",
            "dominio":"Servidor",
            "puerto":"Puerto",
            "usuario_c":"Usuario",
            "contraseña_c":"Clave",
            "descripcion":"Descripcion"
        }
        widgets = {
            "ssl": forms.CheckboxInput(),
            "dominio": forms.TextInput(attrs={"class":"form-control",}),
            "puerto": forms.TextInput(attrs={"class":"form-control","type":"number"}),
            "usuario_c": forms.TextInput(attrs={"class":"form-control"}),
            "contraseña_c": forms.TextInput(attrs={"class":"form-control","type":"password"}),
            "descripcion": forms.TextInput(attrs={"class":"form-control"})
        }




