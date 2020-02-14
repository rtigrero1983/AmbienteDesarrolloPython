from dal import autocomplete

from sistemaAcademico.Apps.GestionAcademica import models
from django import forms

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *


class SMTPForm(forms.ModelForm):
    class Meta:
        model = ConfCorreosSmpt
        fields = [
            "ssl",
            "dominio",
            "puerto",
            "usuario_c",
            "contrasenia_c",
            "descripcion",
        ]
        labels = {
            "ssl":"Seguridad SSL",
            "dominio":"Servidor",
            "puerto":"Puerto",
            "usuario_c":"Usuario",
            "contrasenia_c":"Clave",
            "descripcion":"Descripcion"
        }
        widgets = {
            "ssl": forms.CheckboxInput(),
            "dominio": forms.TextInput(attrs={"class":"form-control"}),
            "puerto": forms.TextInput(attrs={"class":"form-control","type":"number"}),
            "usuario_c": forms.TextInput(attrs={"class":"form-control"}),
            "contrasenia_c": forms.TextInput(attrs={"class":"form-control","type":"password"}),
            "descripcion": forms.TextInput(attrs={"class":"form-control"})
        }



class modulo_form(forms.ModelForm):

    class Meta:
        model = ConfModulo
        fields=['codigo','nombre',]
        labels = {
                  'codigo':'Codigo',
                  'nombre':'Nombre',
                  }

        widgets = {
            'codigo':forms.TextInput(attrs={"class":"form-control","placeholder":"Ingrese codigo para este nuevo modulo"}),
            'nombre': forms.TextInput(attrs={"class": "form-control", "placeholder": "Ingrese nombre para este nuevo modulo"}),
        }