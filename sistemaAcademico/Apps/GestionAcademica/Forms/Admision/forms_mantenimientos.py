from dal import autocomplete
from django.forms import CharField, ChoiceField, ModelForm
from django.db.models import Q
from sistemaAcademico.Apps.GestionAcademica import models
from django import forms
import django_filters
from django.forms.widgets import *

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *

TPA = ['ECUADOR', 'AREGENTINA', 'MEXICO', 'AMERICA SAMOA', 'BOUVET ISLAND', 'ESTADOS UNIDOS', 'VENEZUELA', 'COLOMBIA']
GEN = [('MASCULINO', 'FEMENINO')]
TSA = ['O-', 'O+', 'A+', 'A-', 'B-', 'B+']


class EmpleadoForm(forms.ModelForm):
    class Meta:
        model = MantPersona
        fields = [
            "nombres",
            "apellidos",
            "fecha_de_nacimiento",
            "id_genr_genero",
            "id_genr_pais",
            "identificacion",
            "id_genr_tipo_sangre",
            "id_genr_etnia",
            "id_genr_jornada",
            "id_genr_indigena",
            "id_genr_idioma_ancestral",
            "lugar_nacimiento",
            "id_genr_provincia",
            "id_genr_ciudad",
            "id_genr_categoria_migratoria",
            "discapacidad",
            "discapacidad_renal",
            "discapacidad_neurologica",
            "enfermedad_alergica",
            "asma",
            "epilepsia",
            "enfermedad_congenita",
            "enfermedad_respiratoria",
            "atencion_psicologica",
            "bono_solidario",
            "mienbros_hogar",
            "id_genr_estado_laboralp",

            "pnombres",
            "papellidos",
            "pidentificacion",
            "pdireccion",
            "ptelefono",
            "pvive_con_usted",
            "mnombres",
            "mapellidos",
            "midentificacion",
            "mdireccion",
            "mtelefono",
            "mvive_con_usted",
            "rnombres",
            "rapellidos",
            "ridentificacion",
            "rtelefono",
            "rvive_con_usted",
            "rdireccion_trabajo",
            "rhorario_laboral",
            "rtelefono_trabajo",

        ]

        labels = {
            "nombres": "Nombres ",
            "apellidos": "Apellidos",
            "fecha_de_nacimiento": "Fecha de Nacimiento",
            "id_genr_genero": "Genero",
            "id_genr_pais": "Pais",
            "id_genr_tipo_identificacion": "Tipo de Identificacion",
            "identificacion": "Identificacion",
            "id_genr_estado_civil": "Estado Civil",

            "correo": "Email",
            "celular": "Numero de Celular",
            "id_genr_tipo_sangre": "Tipo de sangre",
            "id_genr_etnia": "Etnia",
            "id_genr_jornada": "Jornada",
            "id_genr_indigena": "Raza indigena",
            "id_genr_idioma_ancestral": "Idioma Ancestral",
            "lugar_nacimiento": "Lugar de Nacimiento",
            "id_genr_provincia": "Provincia",
            "id_genr_ciudad": "Ciudad",
            "id_genr_categoria_migratoria": "Categoria Migratoria",
            "discapacidad": "Discapacidad",
            "discapacidad_renal": "Discapacidad renal",
            "discapacidad_neurologica": "Discapacidad neurologica",
            "enfermedad_alergica": "Enfermedad alergica",
            "asma": "Asma",
            "epilepsia": "Epilepsia",
            "enfermedad_congenita": "Enfermedad congenitiva",
            "enfermedad_respiratoria": "Enfermedad respiratoria",
            "atencion_psicologica": "Atencion psicologica",
            "bono_solidario": "Bono solidario",
            "mienbros_hogar": "Miembros del hogar",
            "id_genr_estado_laboralp": "Estado laboral",

            "pvive_con_usted": "El Padre vive con el estudiante",
            "pnombres": "Nombres del Padre",
            "papellidos": "Apellidos del Padrer",
            "pidentificacion": "Identificacion (padre)",
            "pdireccion": "Direccion del padre",
            "ptelefono": "Telefono",

            "mvive_con_usted": "La Madre vive con el estudiante?",
            "mnombres": "Nombres de la madre",
            "mapellidos": "Apellidos de la madre",
            "midentificacion": "Identificacion (madre)",
            "mdireccion": "Direccion de la madre",
            "mtelefono": "telefono",

            "rvive_con_usted": "El familiar vive con usted?",
            "rnombres": "Nombres",
            "rapellidos": "Apellidos",
            "ridentificacion": "Identificacion",
            "rtelefono": "telefono",

            "rdireccion_trabajo": "Direccion de trabajo",
            "rhorario_laboral": "horario laboral",
            "rtelefono_trabajo": "telefono ",
        }
        widgets = {
            "nombres": forms.TextInput(attrs={"class": "form-control"}),
            "apellidos": forms.TextInput(attrs={"class": "form-control"}),
            "fecha_de_nacimiento": forms.DateInput(attrs={"class": "form-control"}),
            "id_genr_genero": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_pais": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_tipo_identificacion": forms.TextInput(attrs={"class": "form-control"}),
            "identificacion": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_estado_civil": forms.TextInput(attrs={"class": "form-control"}),
            "correo": forms.TextInput(attrs={"class": "form-control"}),
            "celular": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_tipo_sangre": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_etnia": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_jornada": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_indigena": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_idioma_ancestral": forms.TextInput(attrs={"class": "form-control"}),
            "lugar_nacimiento": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_provincia": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_ciudad": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_categoria_migratoria": forms.TextInput(attrs={"class": "form-control"}),
            "discapacidad": forms.CheckboxInput(),
            "discapacidad_renal": forms.CheckboxInput(),
            "discapacidad_neurologica": forms.CheckboxInput(),
            "enfermedad_alergica": forms.CheckboxInput(),
            "asma": forms.CheckboxInput(),
            "epilepsia": forms.CheckboxInput(),
            "enfermedad_congenita": forms.CheckboxInput(),
            "enfermedad_respiratoria": forms.CheckboxInput(),
            "atencion_psicologica": forms.CheckboxInput(),
            "bono_solidario": forms.CheckboxInput(),
            "mienbros_hogar": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_estado_laboralp": forms.TextInput(attrs={"class": "form-control"}),  # representante
            "pvive_con_usted": forms.Select(attrs={"class": "form-control"}, choices=[(1, 'si'), (2, 'no')]),
            "pnombres": forms.TextInput(attrs={"class": "form-control"}),
            "papellidos": forms.TextInput(attrs={"class": "form-control"}),
            "pidentificacion": forms.TextInput(attrs={"class": "form-control"}),
            "pdireccion": forms.TextInput(attrs={"class": "form-control"}),
            "ptelefono": forms.TextInput(attrs={"class": "form-control"}),
            "mvive_con_usted": forms.TextInput(attrs={"class": "form-control", "required": "true"}),
            "mnombres": forms.TextInput(attrs={"class": "form-control"}),
            "mapellidos": forms.TextInput(attrs={"class": "form-control"}),
            "midentificacion": forms.TextInput(attrs={"class": "form-control"}),
            "mdireccion": forms.TextInput(attrs={"class": "form-control"}),
            "mtelefono": forms.TextInput(attrs={"class": "form-control"}),

            "rvive_con_usted": forms.TextInput(attrs={"class": "form-control"}),
            "rnombres": forms.TextInput(attrs={"class": "form-control"}),
            "rapellidos": forms.TextInput(attrs={"class": "form-control"}),
            "ridentificacion": forms.TextInput(attrs={"class": "form-control"}),
            "rtelefono": forms.TextInput(attrs={"class": "form-control"}),

            "rdireccion_trabajo": forms.TextInput(attrs={"class": "form-control"}),
            "rhorario_laboral": forms.TextInput(attrs={"class": "form-control"}),
            "rtelefono_trabajo": forms.TextInput(attrs={"class": "form-control"}),
        }


class EstudianteForm(ModelForm):
    class Meta:
        model = MantPersona
        fields = [
            "nombres",
            "apellidos",
            "fecha_de_nacimiento",
            "estado",
            "id_genr_genero",
            "id_genr_pais",
            "identificacion",
            "id_genr_tipo_sangre",
            "id_genr_etnia",
            "id_genr_jornada",
            "id_genr_indigena",
            "id_genr_idioma_ancestral",
            "lugar_nacimiento",
            "id_genr_provincia",
            "id_genr_ciudad",
            "id_genr_categoria_migratoria",
            "discapacidad",
            "discapacidad_renal",
            "discapacidad_neurologica",
            "enfermedad_alergica",
            "asma",
            "epilepsia",
            "enfermedad_congenita",
            "enfermedad_respiratoria",
            "atencion_psicologica",
            "bono_solidario",
            "mienbros_hogar",
            "id_genr_estado_laboralp",

            "pnombres",
            "papellidos",
            "pidentificacion",
            "pdireccion",
            "ptelefono",
            "pvive_con_usted",
            "mnombres",
            "mapellidos",
            "midentificacion",
            "mdireccion",
            "mtelefono",
            "mvive_con_usted",
            "rnombres",
            "rapellidos",
            "ridentificacion",
            "rtelefono",
            "rvive_con_usted",
            "rdireccion_trabajo",
            "rhorario_laboral",
            "rtelefono_trabajo",

        ]

        labels = {
            "nombres": "Nombres ",
            "apellidos": "Apellidos",
            "fecha_de_nacimiento": "Fecha de Nacimiento",
            "id_genr_genero": "Genero",
            "id_genr_pais": "Pais",
            "id_genr_tipo_identificacion": "Tipo de Identificacion",
            "identificacion": "Identificacion",
            "id_genr_estado_civil": "Estado Civil",

            "correo": "Email",
            "celular": "Numero de Celular",
            "id_genr_tipo_sangre": "Tipo de sangre",
            "id_genr_etnia": "Etnia",
            "id_genr_jornada": "Jornada",
            "id_genr_indigena": "Raza indigena",
            "id_genr_idioma_ancestral": "Idioma Ancestral",
            "lugar_nacimiento": "Lugar de Nacimiento",
            "id_genr_provincia": "Provincia",
            "id_genr_ciudad": "Ciudad",
            "id_genr_categoria_migratoria": "Categoria Migratoria",
            "discapacidad": "Discapacidad",
            "discapacidad_renal": "Discapacidad renal",
            "discapacidad_neurologica": "Discapacidad neurologica",
            "enfermedad_alergica": "Enfermedad alergica",
            "asma": "Asma",
            "epilepsia": "Epilepsia",
            "enfermedad_congenita": "Enfermedad congenitiva",
            "enfermedad_respiratoria": "Enfermedad respiratoria",
            "atencion_psicologica": "Atencion psicologica",
            "bono_solidario": "Bono solidario",
            "mienbros_hogar": "Miembros del hogar",
            "id_genr_estado_laboralp": "Estado laboral",

            "pvive_con_usted": "El Padre vive con el estudiante",
            "pnombres": "Nombres del Padre",
            "papellidos": "Apellidos del Padrer",
            "pidentificacion": "Identificacion (padre)",
            "pdireccion": "Direccion del padre",
            "ptelefono": "Telefono",

            "mvive_con_usted": "La Madre vive con el estudiante?",
            "mnombres": "Nombres de la madre",
            "mapellidos": "Apellidos de la madre",
            "midentificacion": "Identificacion (madre)",
            "mdireccion": "Direccion de la madre",
            "mtelefono": "telefono",

            "rvive_con_usted": "El estudiante vive con usted?",
            "rnombres": "Nombres",
            "rapellidos": "Apellidos",
            "ridentificacion": "Identificacion",
            "rtelefono": "telefono",

            "rdireccion_trabajo": "direccion de trabajo",
            "rhorario_laboral": "horario laboral",
            "rtelefono_trabajo": "telefono ",
        }
        widgets = {
            "nombres": forms.TextInput(attrs={"class": "form-control"}),
            "apellidos": forms.TextInput(attrs={"class": "form-control"}),
            "fecha_de_nacimiento": forms.DateInput(attrs={"class": "form-control"}),
            # "id_genr_genero": forms.TextInput(attrs={"class": "form-control"}),
           # "id_genr_pais": forms.TextInput(attrs={"class": "form-control"}),
            "id_genr_tipo_identificacion": forms.TextInput(attrs={"class": "form-control"}),
            "identificacion": forms.TextInput(attrs={"class": "form-control"}),
            #"id_genr_estado_civil": forms.TextInput(attrs={"class": "form-control"}),
            "correo": forms.TextInput(attrs={"class": "form-control"}),
            "celular": forms.TextInput(attrs={"class": "form-control"}),
            #"id_genr_tipo_sangre": forms.TextInput(attrs={"class": "form-control"}),
            #"id_genr_etnia": forms.TextInput(attrs={"class": "form-control"}),
           #"id_genr_jornada": forms.TextInput(attrs={"class": "form-control"}),
            #"id_genr_indigena": forms.TextInput(attrs={"class": "form-control"}),
           # "id_genr_idioma_ancestral": forms.TextInput(attrs={"class": "form-control"}),
            "lugar_nacimiento": forms.TextInput(attrs={"class": "form-control"}),
           # "id_genr_provincia": forms.TextInput(attrs={"class": "form-control"}),
            #"id_genr_ciudad": forms.TextInput(attrs={"class": "form-control"}),
           # "id_genr_categoria_migratoria": forms.TextInput(attrs={"class": "form-control"}),
            "discapacidad": forms.CheckboxInput(),
            "discapacidad_renal": forms.CheckboxInput(),
            "discapacidad_neurologica": forms.CheckboxInput(),
            "enfermedad_alergica": forms.CheckboxInput(),
            "asma": forms.CheckboxInput(),
            "epilepsia": forms.CheckboxInput(),
            "enfermedad_congenita": forms.CheckboxInput(),
            "enfermedad_respiratoria": forms.CheckboxInput(),
            "atencion_psicologica": forms.CheckboxInput(),
            "bono_solidario": forms.CheckboxInput(),
            "mienbros_hogar": forms.TextInput(attrs={"class": "form-control"}),
           # "id_genr_estado_laboralp": forms.TextInput(attrs={"class": "form-control"}),  # representante
            "pvive_con_usted": forms.Select(attrs={"class": "form-control"}, choices=[(1, 'si'), (2, 'no')]),
            "pnombres": forms.TextInput(attrs={"class": "form-control"}),
            "papellidos": forms.TextInput(attrs={"class": "form-control"}),
            "pidentificacion": forms.TextInput(attrs={"class": "form-control"}),
            "pdireccion": forms.TextInput(attrs={"class": "form-control"}),
            "ptelefono": forms.TextInput(attrs={"class": "form-control"}),
            "mvive_con_usted": forms.TextInput(attrs={"class": "form-control", "required": "true"}),
            "mnombres": forms.TextInput(attrs={"class": "form-control"}),
            "mapellidos": forms.TextInput(attrs={"class": "form-control"}),
            "midentificacion": forms.TextInput(attrs={"class": "form-control"}),
            "mdireccion": forms.TextInput(attrs={"class": "form-control"}),
            "mtelefono": forms.TextInput(attrs={"class": "form-control"}),

            "rvive_con_usted": forms.TextInput(attrs={"class": "form-control"}),
            "rnombres": forms.TextInput(attrs={"class": "form-control"}),
            "rapellidos": forms.TextInput(attrs={"class": "form-control"}),
            "ridentificacion": forms.TextInput(attrs={"class": "form-control"}),
            "rtelefono": forms.TextInput(attrs={"class": "form-control"}),

            "rdireccion_trabajo": forms.TextInput(attrs={"class": "form-control"}),
            "rhorario_laboral": forms.TextInput(attrs={"class": "form-control"}),
            "rtelefono_trabajo": forms.TextInput(attrs={"class": "form-control"}),
        }

    def __init__(self, *args, **kwargs):
        super(EstudianteForm, self).__init__(*args, **kwargs)

        self.fields['id_genr_genero'].queryset = GenrGeneral.objects.filter(
            tipo='GEN')
        self.fields['id_genr_pais'].queryset = GenrGeneral.objects.filter(tipo='TPA')
        #self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_tipo_sangre'].queryset = GenrGeneral.objects.filter(tipo='TSA')
        self.fields['id_genr_etnia'].queryset = GenrGeneral.objects.filter(tipo='ETN')
        self.fields['id_genr_jornada'].queryset = GenrGeneral.objects.filter(tipo='JOR')
        self.fields['id_genr_indigena'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_idioma_ancestral'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_provincia'].queryset = GenrGeneral.objects.filter(tipo='593')
        self.fields['id_genr_ciudad'].queryset = GenrGeneral.objects.filter(tipo__lt= 24)
        self.fields['id_genr_categoria_migratoria'].queryset = GenrGeneral.objects.filter(tipo='CMI')

