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




class unidad_forms(forms.ModelForm):

    class Meta:
        MENU_CHOICES = []
        model = ConfEmpresa
        fields = [
                   'nombre',
                   'razon_social',
                   'identificacion',
                   'direccion',
                   'representante_legal',
                   'correo',
                   'telefono'
                   ]
        labels = {
                    'nombre':'Nombre de la unidad: ',
                    'razon_social':'nombre de la razon: ',
                    'identificacion':'ingrese su ci: ',
                    'direccion':'nombre de la direccion: ',
                    'representante_legal':'representante_legal: ',
                    'correo' : 'correo:',
                    'telefono' : ' telefono:'
                 }

        widgets = {
            'nombre': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese nombre para esta unidad"}),
            'razon_social': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese una razon para esta unidad"}),
            'identificacion': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese identificacion"}),
            'direccion': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese una direccion"}),
            'representante_legal': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese el representante_legal"}),
            'correo': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese una correo"}),
            'telefono': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese una telefono"}),
        }


    def __init__(self, *args, **kwargs):
        super(unidad_forms, self).__init__(*args, **kwargs)
        self.fields['id_padre'] = forms.ChoiceField(choices=[(m.id_empresa, m.descripcion) for m in ConfEmpresa.objects.filter(id_padre=0)])


class UsuarioForm(forms.ModelForm):
    class Meta:
        model = ConfUsuario
        fields = [
            "usuario",
            "clave",
            "id_persona",
            "id_genr_tipo_usuario",

        ]
        labels = {
            "usuario":"Nombre de usuario :",
            "clave":"Clave :",
            "id_persona":" Tipo de persona :",
            "id_genr_tipo_usuario":" Tipo de Usuario ",
        }
        widgets = {
            "usuario": forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese el nombre del usuario"}),
            "clave": forms.TextInput(attrs={"class":"form-control","type":"password","placeholder": "Ingrese la clave del usuario"}),

        }

    def __init__(self, *args, **kwargs):
        super(UsuarioForm, self).__init__(*args, **kwargs)
        self.fields['id_genr_tipo_usuario'] = forms.ChoiceField(choices=[(r.idgenr_general, r.nombre) for r in GenrGeneral.objects.filter(tipo='TUS')])
