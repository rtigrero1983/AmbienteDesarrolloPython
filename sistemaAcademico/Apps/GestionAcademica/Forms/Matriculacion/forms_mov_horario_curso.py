from dal import autocomplete
from django.forms import CharField, ChoiceField, ModelForm
from django.db.models import Q
from sistemaAcademico.Apps.GestionAcademica import models
from django import forms
import django_filters
from django.forms.widgets import *

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import *


class HorarioCursoForm(ModelForm):
    class Meta:
        model = Mov_Horario_materia
        fields = [
            "hora_inicio",
            "hora_fin"
        ]
        label = {
            "hora_inicio": "Hora De Inicio",
            "hora_fin": "Hora De Fin",
        }


