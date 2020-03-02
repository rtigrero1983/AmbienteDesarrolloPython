from dal import autocomplete

from sistemaAcademico.Apps.GestionAcademica import models
from django import forms
from django.forms import ModelForm
from betterforms.multiform import MultiModelForm
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from django_select2.forms import Select2MultipleWidget
from django_select2.forms import ModelSelect2MultipleWidget
from collections import OrderedDict


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
            "ssl": "Seguridad SSL",
            "dominio": "Servidor",
            "puerto": "Puerto",
            "usuario_c": "Usuario",
            "contrasenia_c": "Clave",
            "descripcion": "Descripcion"
        }
        widgets = {
            "ssl": forms.CheckboxInput(),
            "dominio": forms.TextInput(attrs={"class": "form-control"}),
            "puerto": forms.TextInput(attrs={"class": "form-control", "type": "number"}),
            "usuario_c": forms.TextInput(attrs={"class": "form-control"}),
            "contrasenia_c": forms.TextInput(attrs={"class": "form-control", "type": "password"}),
            "descripcion": forms.TextInput(attrs={"class": "form-control"})
        }


class modulo_form(forms.ModelForm):

    class Meta:
        model = ConfModulo
        fields = ['codigo', 'nombre', ]
        labels = {
            'codigo': 'Codigo',
            'nombre': 'Nombre',
        }

        widgets = {
            'codigo': forms.TextInput(attrs={"class": "form-control", "max": "100", "min": "0", "placeholder": "Ingrese codigo para este nuevo modulo", "type": "number "}),
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
            'descripcion': 'Nombre del menu: ',
            'id_padre': 'Modulo: ',
            'url': 'Url del menu: ',
            'icono': 'Icono: ',
            'lazy_name': 'Lazy name: ',
            'name': 'Name:',
                    'view': 'Controlador del menu(View):'
        }

        widgets = {
            'descripcion': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese nombre para este menu"}),
            'url': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese una url para este  menu"}),
            'lazy_name': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese lazy name para este menu"}),
            'name': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese un name para este nuevo menu"}),
            'view': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese el nombre controlador para este menu"}),
            'id_padre': forms.TextInput(attrs={'readonly': 'readonly'}),
        }

    def __init__(self, *args, **kwargs):
        super(menu_form, self).__init__(*args, **kwargs)
        self.fields['id_padre'] = forms.ChoiceField(choices=[(
            m.id_menu, m.descripcion) for m in ConfMenu.objects.filter(id_padre=0)], widget={})


class unidad_form(forms.ModelForm):

    class Meta:
        model = ConfEmpresa
        fields = [
            'nombre',
            'razon_social',
            'id_genr_tipo_identificacion',
            'identificacion',
            'direccion',
            'representante_legal',
            'correo',
            'telefono',
            'fecha_creacion',
            'fecha_ingreso',
            'usuario_ing',
            'terminal_ing',
        ]
        labels = {
            'nombre': 'Nombre de la unidad: ',
            'razon_social': 'nombre de la razon: ',
            'id_genr_tipo_identificacion': 'Tipo de identificacion',
            'identificacion': 'ingrese su identificacion: ',
            'direccion': 'nombre de la direccion: ',
            'representante_legal': 'representante_legal: ',
            'correo': 'correo:',
            'telefono': 'ingrese su telefono:',
            'fecha_creacion': 'fecha de creacion',
            'usuario_ing': '',
            'terminal_ing': ''

        }

        widgets = {
            'nombre': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese nombre para esta unidad"}),
            'razon_social': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese una razon para esta unidad"}),
            'identificacion': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese identificacion no duplicada"}),
            'direccion': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese una direccion"}),
            'representante_legal': forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese el representante_legal"}),
            'correo': forms.TextInput(attrs={"class": "form-control text-dark", "type": "email", "placeholder": "Ingrese una correo"}),
            'telefono': forms.NumberInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese una telefono"}),
            'fecha_creacion':  forms.DateTimeInput(attrs={"class": "form-control text-dark", "type": "date"}),

        }

    def __init__(self, *args, **kwargs):
        super(unidad_form, self).__init__(*args, **kwargs)
        self.fields['id_genr_tipo_identificacion'].queryset = GenrGeneral.objects.filter(
            tipo='TID')


class UsuarioModelForm(ModelForm):
    class Meta:
        model = ConfUsuario
        fields = [
            "usuario",
            "clave",
            "id_persona",
            "id_genr_tipo_usuario",
        ]
        labels = {
            "usuario": "Nombre de usuario :",
            "clave": "Clave :",
            "id_persona": " Tipo de persona :",
            "id_genr_tipo_usuario": " Tipo de Usuario ",
        }
        widgets = {
            "usuario": forms.TextInput(attrs={"class": "form-control text-dark", "placeholder": "Ingrese el nombre del usuario"}),
            "clave": forms.TextInput(attrs={"class": "form-control", "type": "password", "placeholder": "Ingrese la clave del usuario"}),

        }

    def __init__(self, *args, **kwargs):
        super(UsuarioModelForm, self).__init__(*args, **kwargs)
        self.fields['id_genr_tipo_usuario'].queryset = GenrGeneral.objects.filter(
            tipo='TUS')


class UsuarioRolModelForm(ModelForm):
    class Meta:
        model = ConfUsuario_rol
        fields = [
            "id_rol",
        ]
        labels = {
            "id_rol": "Tipo de rol :",
        }


class UsuarioUsuarioRolModelForm(MultiModelForm):
    form_classes = OrderedDict((
        ('usuario', UsuarioModelForm),
        ('usuario_rol', UsuarioRolModelForm),
    ))


class AccionesForm(forms.Form):
    menu = ModelSelect2MultipleWidget(queryset=ConfMenu.objects.filter(
        url__icontains='Academico:'), widget=Select2MultipleWidget)


class Usuario_tempForm(forms.ModelForm):
    class Meta:
        model = UsuarioTemp
        fields = "__all__"
        labels = {
            "usuario": "Nombre Usuario",
            "clave": "Contraseña",
            "fecha_limite": "Fecha de Caducidad",
            "correo": "Correo electronico",
        }
        widgets = {
            "usuario": forms.TextInput(attrs={
                "class": "form-control", "placeholder": "Usuario", "required": "true"}),
            "clave": forms.TextInput(attrs={
                "class": "form-control", "type": "password", "required": "true"}),
            "fecha_limite": forms.DateTimeInput(attrs={
                "class": "form-control text-dark", "required": "true", "type": "date"}),

            "correo": forms.TextInput(attrs={"class": "form-control text-dark", "type": "Email"}),
        }


class Permisosform(forms.ModelForm):
    class Meta:
        model = ConfPermiso
        fields = [
            "id_modulo_menu",
            "id_rol",
        ]
        labels = {
            "id_modulo_menu": "Modulo Menu",
            "id_rol": "Rol",
        }
        widgets = {
            "id_modulo_menu": forms.TextInput(
                attrs={"class": "form-control text-dark", "placeholder": "Ingrese el nombre del usuario"}),
            "id_rol": forms.TextInput(
                attrs={"class": "form-control"}),
        }
