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
            'codigo':forms.TextInput(attrs={"class":"form-control","placeholder":"Ingrese codigo para este nuevo modulo","type":"number "}),
            'nombre': forms.TextInput(attrs={"class": "form-control", "placeholder": "Ingrese nombre para este nuevo modulo"}),
        }

        def clean_codigo(self):
            codigo = self.cleaned_data.get('codigo')
            return codigo


class menu_form(forms.ModelForm):

    class Meta:
        MENU_CHOICES = []
        model = ConfMenu
        fields = [ 
                   'id_padre', 
                   'descripcion',
                   'url',
                   'icono',
                   'lazy_name',
                   'name',
                   'view'
                   ]
        labels = {
                    'descripcion':'Nombre del menu: ',
                    'id_padre':'Modulo: ',
                    'url':'Url del menu: ',
                    'icono':'Icono: ',
                    'lazy_name':'Lazy name: ',
                    'name' : 'Name:',
                    'view' : 'Controlador del menu(View):'
                 }

        widgets = {
            'descripcion': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese nombre para este menu"}),
            'url': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese una url para este  menu"}),
            'lazy_name': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese lazy name para este menu"}),
            'name': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese un name para este nuevo menu"}),
            'view': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese el nombre controlador para este menu"}),
        }


    def __init__(self, *args, **kwargs):
        super(menu_form, self).__init__(*args, **kwargs)
        self.fields['id_padre'] = forms.ChoiceField(choices=[(m.id_menu,m.descripcion) for m in ConfMenu.objects.filter(id_padre=0)])