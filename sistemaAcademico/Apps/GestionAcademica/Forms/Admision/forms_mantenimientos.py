from django import forms
from django.db.models import Q
from django.forms import ModelForm

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import *

TPA = ['ECUADOR', 'AREGENTINA', 'MEXICO', 'AMERICA SAMOA', 'BOUVET ISLAND', 'ESTADOS UNIDOS', 'VENEZUELA', 'COLOMBIA']
GEN = [('MASCULINO', 'FEMENINO')]
TSA = ['O-', 'O+', 'A+', 'A-', 'B-', 'B+']


class EmpleadoForm(ModelForm):
    class Meta:
        model = MantPersona
        fields = [
            "nombres",
            "apellidos",
            "id_genr_tipo_identificacion",
            "identificacion",
            "direccion",
            "fecha_de_nacimiento",
            "lugar_nacimiento",
            "id_genr_genero",
            "id_genr_pais",
            "id_genr_provincia",
            "id_genr_ciudad",
            "id_genr_tipo_sangre",
            "id_genr_etnia",
            "id_genr_jornada",
            "id_genr_indigena",
            "id_genr_idioma_ancestral",

            "discapacidad",
            "discapacidad_renal",
            "discapacidad_neurologica",
            "enfermedad_alergica",
            "asma",
            "epilepsia",
            "enfermedad_congenita",
            "enfermedad_respiratoria",
            "atencion_psicologica",

            "pvive_con_usted",
            "pnombres",
            "papellidos",
            "pidentificacion",
            "ptelefono",
            "pdireccion",

            "id_genr_tipo_usuario",
            "rcorreo",
            "id_genr_estado_civil",
            "id_genr_estado_laboralp",
            "id_genr_categoria_migratoria",
            "mienbros_hogar",
            "bono_solidario",

        ]

        labels = {
            "nombres": "Nombres ",
            "apellidos": "Apellidos",
            "id_genr_tipo_identificacion": "Tipo de Identificacion",
            "identificacion": "Identificacion",
            "direccion": "Direccion",
            "fecha_de_nacimiento": "Fecha de Nacimiento",
            "lugar_nacimiento": "Lugar de Nacimiento",
            "id_genr_genero": "Genero",
            "id_genr_pais": "Pais",
            "id_genr_provincia": "Provincia",
            "id_genr_ciudad": "Ciudad",
            "id_genr_tipo_sangre": "Tipo de sangre",
            "id_genr_etnia": "Etnia",
            "id_genr_jornada": "Jornada",
            "id_genr_indigena": "Raza indigena",
            "id_genr_idioma_ancestral": "Idioma Ancestral",

            "discapacidad": "Discapacidad",
            "discapacidad_renal": "Discapacidad renal",
            "discapacidad_neurologica": "Discapacidad neurologica",
            "enfermedad_alergica": "Enfermedad alergica",
            "asma": "Asma",
            "epilepsia": "Epilepsia",
            "enfermedad_congenita": "Enfermedad congenitiva",
            "enfermedad_respiratoria": "Enfermedad respiratoria",
            "atencion_psicologica": "Atencion psicologica",

            "pvive_con_usted": "Su familiar vive con usted?",
            "pnombres": "Nombres del Familiar",
            "papellidos": "Apellidos del Familiar",
            "pidentificacion": "Identificacion (Familiar)",
            "ptelefono": "Telefono",
            "pdireccion": "Direccion del Familiar",
            "id_genr_tipo_usuario": "Cargo",
            "rcorreo": "Email",
            "id_genr_estado_civil": "Estado Civil",
            "id_genr_estado_laboralp": "Estado laboral",
            "id_genr_categoria_migratoria": "Categoria Migratoria",
            "mienbros_hogar": "Miembros del hogar",
            "bono_solidario": "Bono solidario",

        }
        widgets = {
            "nombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Empleado"}),
            "apellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Empleado"}),
            "identificacion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Numero de Cedula"}),
            "fecha_de_nacimiento": forms.DateInput(attrs={"class": "form-control", "type": "date"}),
            "lugar_nacimiento": forms.TextInput(attrs={"class": "form-control", "placeholder": "Lugar de Nacimiento"}),

            "pnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Familiar"}),
            "papellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Familiar"}),
            "pidentificacion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Numero de Cedula"}),
            "ptelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Numero de Telefono"}),
            "pdireccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion"}),

            "rcorreo": forms.TextInput(attrs={"class": "form-control", "type": "email", "placeholder": "Email"}),
            "mienbros_hogar": forms.TextInput(attrs={"class": "form-control", "placeholder": "Miembros del hogar"}),

        }

    def __init__(self, *args, **kwargs):
        super(EmpleadoForm, self).__init__(*args, **kwargs)

        self.fields['id_genr_tipo_identificacion'].queryset = GenrGeneral.objects.filter(tipo='TID')
        self.fields['id_genr_tipo_usuario'].queryset = GenrGeneral.objects.filter(
            Q(idgenr_general=20) | Q(idgenr_general=21))
        self.fields['id_genr_genero'].queryset = GenrGeneral.objects.filter(tipo='GEN')
        self.fields['id_genr_pais'].queryset = GenrGeneral.objects.filter(tipo='TPA')
        self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_tipo_sangre'].queryset = GenrGeneral.objects.filter(tipo='TSA')
        self.fields['id_genr_etnia'].queryset = GenrGeneral.objects.filter(tipo='ETN')
        self.fields['id_genr_jornada'].queryset = GenrGeneral.objects.filter(tipo='JOR')
        self.fields['id_genr_indigena'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_idioma_ancestral'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_provincia'].queryset = GenrGeneral.objects.filter(tipo='593')
        self.fields['id_genr_ciudad'].queryset = GenrGeneral.objects.filter(tipo__lt=24)
        self.fields['id_genr_categoria_migratoria'].queryset = GenrGeneral.objects.filter(tipo='CMI')
        self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_estado_laboralp'].queryset = GenrGeneral.objects.filter(tipo='ESTL')


class EditarEmpleadoForm(ModelForm):
    class Meta:
        model = MantPersona
        fields = [
            "nombres",
            "apellidos",
            "id_genr_tipo_identificacion",
            "identificacion",
            "direccion",
            "fecha_de_nacimiento",
            "lugar_nacimiento",
            "id_genr_genero",
            "id_genr_pais",
            "id_genr_provincia",
            "id_genr_ciudad",
            "id_genr_tipo_sangre",
            "id_genr_etnia",
            "id_genr_jornada",
            "id_genr_indigena",
            "id_genr_idioma_ancestral",

            "discapacidad",
            "discapacidad_renal",
            "discapacidad_neurologica",
            "enfermedad_alergica",
            "asma",
            "epilepsia",
            "enfermedad_congenita",
            "enfermedad_respiratoria",
            "atencion_psicologica",

            "pvive_con_usted",
            "pnombres",
            "papellidos",
            "pidentificacion",
            "ptelefono",
            "pdireccion",

            "id_genr_tipo_usuario",
            "rcorreo",
            "id_genr_estado_civil",
            "id_genr_estado_laboralp",
            "id_genr_categoria_migratoria",
            "mienbros_hogar",
            "bono_solidario",

        ]

        labels = {
            "nombres": "Nombres ",
            "apellidos": "Apellidos",
            "id_genr_tipo_identificacion": "Tipo de Identificacion",
            "identificacion": "Identificacion",
            "direccion": "Direccion",
            "fecha_de_nacimiento": "Fecha de Nacimiento",
            "lugar_nacimiento": "Lugar de Nacimiento",
            "id_genr_genero": "Genero",
            "id_genr_pais": "Pais",
            "id_genr_provincia": "Provincia",
            "id_genr_ciudad": "Ciudad",
            "id_genr_tipo_sangre": "Tipo de sangre",
            "id_genr_etnia": "Etnia",
            "id_genr_jornada": "Jornada",
            "id_genr_indigena": "Raza indigena",
            "id_genr_idioma_ancestral": "Idioma Ancestral",

            "discapacidad": "Discapacidad",
            "discapacidad_renal": "Discapacidad renal",
            "discapacidad_neurologica": "Discapacidad neurologica",
            "enfermedad_alergica": "Enfermedad alergica",
            "asma": "Asma",
            "epilepsia": "Epilepsia",
            "enfermedad_congenita": "Enfermedad congenitiva",
            "enfermedad_respiratoria": "Enfermedad respiratoria",
            "atencion_psicologica": "Atencion psicologica",

            "pvive_con_usted": "Su familiar vive con usted?",
            "pnombres": "Nombres del Familiar",
            "papellidos": "Apellidos del Familiar",
            "pidentificacion": "Identificacion (Familiar)",
            "ptelefono": "Telefono",
            "pdireccion": "Direccion del Familiar",
            "id_genr_tipo_usuario": "Cargo",
            "rcorreo": "Email",
            "id_genr_estado_civil": "Estado Civil",
            "id_genr_estado_laboralp": "Estado laboral",
            "id_genr_categoria_migratoria": "Categoria Migratoria",
            "mienbros_hogar": "Miembros del hogar",
            "bono_solidario": "Bono solidario",

        }
        widgets = {
            "nombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Empleado"}),
            "apellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Empleado"}),
            "identificacion": forms.TextInput(attrs={"class": "form-control", 'minlength': '10',
                                                     "placeholder": "Numero de Cedula"}),
            "fecha_de_nacimiento": forms.DateInput(attrs={"class": "form-control"}),
            "lugar_nacimiento": forms.TextInput(attrs={"class": "form-control", "placeholder": "Lugar de Nacimiento"}),
            "pnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Familiar"}),
            "papellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Familiar"}),
            "pidentificacion": forms.TextInput(
                attrs={"class": "form-control", 'minlength': '10', "placeholder": "Numero de Cedula"}),
            "ptelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Numero de Telefono"}),
            "pdireccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion"}),
            "rcorreo": forms.TextInput(attrs={"class": "form-control", "type": "email", "placeholder": "Email"}),
            "mienbros_hogar": forms.TextInput(attrs={"class": "form-control", "placeholder": "Miembros del hogar"}),
        }

    def __init__(self, *args, **kwargs):
        super(EditarEmpleadoForm, self).__init__(*args, **kwargs)

        self.fields['id_genr_tipo_identificacion'].queryset = GenrGeneral.objects.filter(tipo='TID')
        self.fields['id_genr_tipo_usuario'].queryset = GenrGeneral.objects.filter(
            Q(idgenr_general=20) | Q(idgenr_general=21))
        self.fields['id_genr_genero'].queryset = GenrGeneral.objects.filter(tipo='GEN')
        self.fields['id_genr_pais'].queryset = GenrGeneral.objects.filter(tipo='TPA')
        self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_tipo_sangre'].queryset = GenrGeneral.objects.filter(tipo='TSA')
        self.fields['id_genr_etnia'].queryset = GenrGeneral.objects.filter(tipo='ETN')
        self.fields['id_genr_jornada'].queryset = GenrGeneral.objects.filter(tipo='JOR')
        self.fields['id_genr_indigena'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_idioma_ancestral'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_provincia'].queryset = GenrGeneral.objects.filter(tipo='593')
        self.fields['id_genr_ciudad'].queryset = GenrGeneral.objects.filter(tipo__lt=24)
        self.fields['id_genr_categoria_migratoria'].queryset = GenrGeneral.objects.filter(tipo='CMI')
        self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_estado_laboralp'].queryset = GenrGeneral.objects.filter(tipo='ESTL')


class ConsultarEmpleadoForm(ModelForm):
    class Meta:
        model = MantPersona
        fields = [
            "nombres",
            "apellidos",
            "id_genr_tipo_identificacion",
            "identificacion",
            "direccion",
            "fecha_de_nacimiento",
            "lugar_nacimiento",
            "id_genr_genero",
            "id_genr_pais",
            "id_genr_provincia",
            "id_genr_ciudad",
            "id_genr_tipo_sangre",
            "id_genr_etnia",
            "id_genr_jornada",
            "id_genr_indigena",
            "id_genr_idioma_ancestral",
            "discapacidad",
            "discapacidad_renal",
            "discapacidad_neurologica",
            "enfermedad_alergica",
            "asma",
            "epilepsia",
            "enfermedad_congenita",
            "enfermedad_respiratoria",
            "atencion_psicologica",
            "pvive_con_usted",
            "pnombres",
            "papellidos",
            "pidentificacion",
            "ptelefono",
            "pdireccion",
            "id_genr_tipo_usuario",
            "rcorreo",
            "id_genr_estado_civil",
            "id_genr_estado_laboralp",
            "id_genr_categoria_migratoria",
            "mienbros_hogar",
            "bono_solidario",

        ]

        labels = {
            "nombres": "Nombres ",
            "apellidos": "Apellidos",
            "id_genr_tipo_identificacion": "Tipo de Identificacion",
            "identificacion": "Identificacion",
            "direccion": "Direcccion",
            "fecha_de_nacimiento": "Fecha de Nacimiento",
            "lugar_nacimiento": "Lugar de Nacimiento",
            "id_genr_genero": "Genero",
            "id_genr_pais": "Pais",
            "id_genr_provincia": "Provincia",
            "id_genr_ciudad": "Ciudad",
            "id_genr_tipo_sangre": "Tipo de sangre",
            "id_genr_etnia": "Etnia",
            "id_genr_jornada": "Jornada",
            "id_genr_indigena": "Raza indigena",
            "id_genr_idioma_ancestral": "Idioma Ancestral",

            "discapacidad": "Discapacidad",
            "discapacidad_renal": "Discapacidad renal",
            "discapacidad_neurologica": "Discapacidad neurologica",
            "enfermedad_alergica": "Enfermedad alergica",
            "asma": "Asma",
            "epilepsia": "Epilepsia",
            "enfermedad_congenita": "Enfermedad congenitiva",
            "enfermedad_respiratoria": "Enfermedad respiratoria",
            "atencion_psicologica": "Atencion psicologica",

            "pvive_con_usted": "Su familiar vive con usted?",
            "pnombres": "Nombres del Familiar",
            "papellidos": "Apellidos del Familiar",
            "pidentificacion": "Identificacion (Familiar)",
            "ptelefono": "Telefono",
            "pdireccion": "Direccion del Familiar",

            "id_genr_tipo_usuario": "Cargo",
            "rcorreo": "Email",
            "id_genr_estado_civil": "Estado Civil",
            "id_genr_estado_laboralp": "Estado laboral",
            "id_genr_categoria_migratoria": "Categoria Migratoria",
            "mienbros_hogar": "Miembros del hogar",
            "bono_solidario": "Bono solidario",

        }
        widgets = {
            "nombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Empleado"}),
            "apellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Empleado"}),
            "identificacion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Numero de Cedula"}),
            "fecha_de_nacimiento": forms.DateInput(attrs={"class": "form-control"}),
            "lugar_nacimiento": forms.TextInput(attrs={"class": "form-control", "placeholder": "Lugar de Nacimiento"}),

            "pnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Familiar"}),
            "papellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Familiar"}),
            "pidentificacion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Numero de Cedula"}),
            "ptelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Numero de Telefono"}),
            "pdireccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion"}),

            "rcorreo": forms.TextInput(attrs={"class": "form-control", "type": "email", "placeholder": "Email"}),
            "mienbros_hogar": forms.TextInput(attrs={"class": "form-control", "placeholder": "Miembros del hogar"}),

        }

    def __init__(self, *args, **kwargs):
        super(ConsultarEmpleadoForm, self).__init__(*args, **kwargs)

        self.fields['id_genr_tipo_identificacion'].queryset = GenrGeneral.objects.filter(tipo='TID')
        self.fields['id_genr_tipo_usuario'].queryset = GenrGeneral.objects.filter(nombre='ROL PROFESOR')
        self.fields['id_genr_genero'].queryset = GenrGeneral.objects.filter(tipo='GEN')
        self.fields['id_genr_pais'].queryset = GenrGeneral.objects.filter(tipo='TPA')
        self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_tipo_sangre'].queryset = GenrGeneral.objects.filter(tipo='TSA')
        self.fields['id_genr_etnia'].queryset = GenrGeneral.objects.filter(tipo='ETN')
        self.fields['id_genr_jornada'].queryset = GenrGeneral.objects.filter(tipo='JOR')
        self.fields['id_genr_indigena'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_idioma_ancestral'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_provincia'].queryset = GenrGeneral.objects.filter(tipo='593')
        self.fields['id_genr_ciudad'].queryset = GenrGeneral.objects.filter(tipo__lt=24)
        self.fields['id_genr_categoria_migratoria'].queryset = GenrGeneral.objects.filter(tipo='CMI')
        self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_estado_laboralp'].queryset = GenrGeneral.objects.filter(tipo='ESTL')
        self.fields['nombres'].widget.attrs['readonly'] = True
        self.fields['apellidos'].widget.attrs['readonly'] = True
        self.fields['id_genr_tipo_identificacion'].widget.attrs['disabled'] = 'disabled'
        self.fields['identificacion'].widget.attrs['readonly'] = True
        self.fields['fecha_de_nacimiento'].widget.attrs['readonly'] = True
        self.fields['lugar_nacimiento'].widget.attrs['readonly'] = True
        self.fields['id_genr_genero'].widget.attrs['disabled'] = 'disabled'
        self.fields['direccion'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_pais'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_provincia'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_ciudad'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_tipo_sangre'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_etnia'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_jornada'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_indigena'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_idioma_ancestral'].widget.attrs['disabled'] = 'disabled'
        self.fields['discapacidad'].widget.attrs['disabled'] = 'disabled'
        self.fields['discapacidad_renal'].widget.attrs['disabled'] = 'disabled'
        self.fields['discapacidad_neurologica'].widget.attrs['disabled'] = 'disabled'
        self.fields['enfermedad_alergica'].widget.attrs['disabled'] = 'disabled'
        self.fields['asma'].widget.attrs['disabled'] = 'disabled'
        self.fields['epilepsia'].widget.attrs['disabled'] = 'disabled'
        self.fields['enfermedad_congenita'].widget.attrs['disabled'] = 'disabled'
        self.fields['enfermedad_respiratoria'].widget.attrs['disabled'] = 'disabled'
        self.fields['atencion_psicologica'].widget.attrs['disabled'] = 'disabled'
        self.fields['pvive_con_usted'].widget.attrs['disabled'] = 'disabled'
        self.fields['pnombres'].widget.attrs['readonly'] = True
        self.fields['papellidos'].widget.attrs['readonly'] = True
        self.fields['pidentificacion'].widget.attrs['readonly'] = True
        self.fields['ptelefono'].widget.attrs['readonly'] = True
        self.fields['pdireccion'].widget.attrs['readonly'] = True
        self.fields['id_genr_tipo_usuario'].widget.attrs['disabled'] = 'disabled'
        self.fields['rcorreo'].widget.attrs['readonly'] = True
        self.fields['id_genr_estado_civil'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_estado_laboralp'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_categoria_migratoria'].widget.attrs['disabled'] = 'disabled'
        self.fields['mienbros_hogar'].widget.attrs['readonly'] = True
        self.fields['bono_solidario'].widget.attrs['disabled'] = 'disabled'


class EstudianteForm(ModelForm):
    class Meta:
        model = MantPersona
        fields = [
            "id_persona",
            "nombres",
            "apellidos",
            "identificacion",
            "fecha_de_nacimiento",
            "lugar_nacimiento",
            "direccion",
            "telefono",
            "celular",
            "id_genr_genero",
            "id_genr_pais",
            "id_genr_provincia",
            "id_genr_ciudad",
            "id_genr_tipo_sangre",
            "id_genr_etnia",
            "id_genr_jornada",
            "id_genr_indigena",
            "id_genr_idioma_ancestral",
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
            "pnombres",
            "papellidos",
            "pidentificacion",
            "pdireccion",
            "ptelefono",
            "pvive_con_usted",
            "id_genr_estado_laboralp",
            "mnombres",
            "mapellidos",
            "midentificacion",
            "mdireccion",
            "mtelefono",
            "mvive_con_usted",
            "id_genr_estado_laboralm",
            "bono_solidario",
            "rnombres",
            "rapellidos",
            "rtelefono",
            "id_genr_tipo_identificacion",
            "ridentificacion",
            "tipo_parentesco",
            "rvive_con_usted",
            "rdireccion_trabajo",
            "rtelefono_trabajo",
            "rcorreo",
            "rhorario_laboral",
            "mienbros_hogar",

        ]

        labels = {
            "nombres": "Nombres ",
            "apellidos": "Apellidos",
            "identificacion": "Identificacion",
            "fecha_de_nacimiento": "Fecha de Nacimiento",
            "lugar_nacimiento": "Lugar de Nacimiento",
            "direccion": "direccion",
            "telefono": "Telefono",
            "celular": "Celular",
            "id_genr_genero": "Genero",
            "id_genr_pais": "Pais",
            "id_genr_provincia": "Provincia",
            "id_genr_ciudad": "Ciudad",
            "id_genr_tipo_sangre": "Tipo de sangre",
            "id_genr_etnia": "Etnia",
            "id_genr_jornada": "Jornada",
            "id_genr_indigena": "Raza indigena",
            "id_genr_idioma_ancestral": "Idioma Ancestral",
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

            "pnombres": "Nombres del Padre",
            "papellidos": "Apellidos del Padre",
            "pidentificacion": "Identificacion (padre)",
            "pdireccion": "Direccion del padre",
            "ptelefono": "Telefono",
            "pvive_con_usted": "El Padre vive con el estudiante",
            "id_genr_estado_laboralp": "Estado laboral del Padre",
            "mnombres": "Nombres de la madre",
            "mapellidos": "Apellidos de la madre",
            "midentificacion": "Identificacion (madre)",
            "mdireccion": "Direccion de la madre",
            "mtelefono": "telefono",
            "mvive_con_usted": "La Madre vive con el estudiante?",
            "id_genr_estado_laboralm": "Estado Laboral de la Madre",
            "bono_solidario": "Bono solidario",
            "rnombres": "Nombres",
            "rapellidos": "Apellidos",
            "rtelefono": "Telefono Celular",
            "id_genr_tipo_identificacion": "Tipo de Identificacion",
            "ridentificacion": "Identificacion",
            "tipo_parentesco": "Parentesco",
            "rvive_con_usted": "El estudiante vive con usted?",
            "rdireccion_trabajo": "direccion de trabajo",
            "rtelefono_trabajo": "Telefono Convencional",
            "rcorreo": "Email ",
            "rhorario_laboral": "horario laboral",
            "mienbros_hogar": "Miembros del hogar",

        }
        widgets = {
            "nombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Estudiante"}),
            "apellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Estudiante"}),
            "identificacion": forms.TextInput(attrs={"class": "form-control", 'minlength': '10', 'maxlength': '20',
                                                     "placeholder": "Numero de Cedula"}),
            "fecha_de_nacimiento": forms.DateTimeInput(attrs={"class": "form-control", "type": "date"}),
            "lugar_nacimiento": forms.TextInput(attrs={"class": "form-control", "placeholder": "Lugar de Nacimiento"}),
            "direccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion"}),
            "telefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono"}),
            "celular": forms.TextInput(attrs={"class": "form-control", 'minlength': '10', "placeholder": "Celular"}),

            "pnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Padre"}),
            "papellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Padre"}),
            "pidentificacion": forms.TextInput(attrs={"class": "form-control", 'minlength': '10', 'maxlength': '20',
                                                      "placeholder": "Cedula del padre"}),
            "pdireccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion del Padre"}),
            "ptelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono del Padre"}),
            "mnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres de la Madre"}),
            "mapellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos de la Madre"}),
            "midentificacion": forms.TextInput(attrs={"class": "form-control", 'minlength': '10', 'maxlength': '20',
                                                      "placeholder": "Cedula de la Madre"}),
            "mdireccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion del Padre"}),
            "mtelefono": forms.TextInput(
                attrs={"class": "form-control", 'minlength': '10', "placeholder": "Telefono de la Madre"}),

            "rnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre del Representante"}),
            "rapellidos": forms.TextInput(
                attrs={"class": "form-control", "placeholder": "Apellidos del Representante"}),
            "rtelefono": forms.TextInput(
                attrs={"class": "form-control", 'minlength': '10', "placeholder": "Telefono del Representante"}),
            "ridentificacion": forms.TextInput(attrs={"class": "form-control", 'minlength': '10', 'maxlength': '20',
                                                      "placeholder": "Cedula del Representante"}),
            "tipo_parentesco": forms.TextInput(attrs={"class": "form-control", "placeholder": "Parentesco"}),
            "rdireccion_trabajo": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion"}),
            "rtelefono_trabajo": forms.TextInput(
                attrs={"class": "form-control", "placeholder": "Telefono convencional"}),
            "rcorreo": forms.TextInput(attrs={"class": "form-control", "placeholder": "email"}),
            "rhorario_laboral": forms.TextInput(attrs={"class": "form-control", "placeholder": "Horario"}),
            "mienbros_hogar": forms.TextInput(attrs={"class": "form-control", "placeholder": "Miembros del Hogar"}),
        }

    def __init__(self, *args, **kwargs):
        super(EstudianteForm, self).__init__(*args, **kwargs)

        self.fields['id_genr_genero'].queryset = GenrGeneral.objects.filter(
            tipo='GEN')
        self.fields['id_genr_pais'].queryset = GenrGeneral.objects.filter(tipo='TPA')
        #  self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_tipo_sangre'].queryset = GenrGeneral.objects.filter(tipo='TSA')
        self.fields['id_genr_etnia'].queryset = GenrGeneral.objects.filter(tipo='ETN')
        self.fields['id_genr_jornada'].queryset = GenrGeneral.objects.filter(tipo='JOR')
        self.fields['id_genr_indigena'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_idioma_ancestral'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_provincia'].queryset = GenrGeneral.objects.filter(tipo='593')
        self.fields['id_genr_ciudad'].queryset = GenrGeneral.objects.filter(tipo__lt=24)
        self.fields['id_genr_categoria_migratoria'].queryset = GenrGeneral.objects.filter(tipo='CMI')
        self.fields['id_genr_tipo_identificacion'].queryset = GenrGeneral.objects.filter(tipo='TID')
        self.fields['id_genr_estado_laboralm'].queryset = GenrGeneral.objects.filter(tipo='ESTL')
        self.fields['id_genr_estado_laboralp'].queryset = GenrGeneral.objects.filter(tipo='ESTL')


class EstudianteEditForm(ModelForm):
    class Meta:
        model = MantPersona
        fields = [
            "nombres",
            "apellidos",
            "fecha_de_nacimiento",
            "lugar_nacimiento",
            "direccion",
            "telefono",
            "celular",
            "id_genr_genero",
            "id_genr_pais",
            "id_genr_provincia",
            "id_genr_ciudad",
            "id_genr_tipo_sangre",
            "id_genr_etnia",
            "id_genr_jornada",
            "id_genr_indigena",
            "id_genr_idioma_ancestral",
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
            "pnombres",
            "papellidos",
            "pidentificacion",
            "pdireccion",
            "ptelefono",
            "pvive_con_usted",
            "id_genr_estado_laboralp",
            "mnombres",
            "mapellidos",
            "midentificacion",
            "mdireccion",
            "mtelefono",
            "mvive_con_usted",
            "id_genr_estado_laboralm",
            "bono_solidario",
            "rnombres",
            "rapellidos",
            "rtelefono",
            "id_genr_tipo_identificacion",
            "ridentificacion",
            "tipo_parentesco",
            "rvive_con_usted",
            "rdireccion_trabajo",
            "rtelefono_trabajo",
            "rcorreo",
            "rhorario_laboral",
            "mienbros_hogar",

        ]

        labels = {
            "nombres": "Nombres ",
            "apellidos": "Apellidos",
            "fecha_de_nacimiento": "Fecha de Nacimiento",
            "lugar_nacimiento": "Lugar de Nacimiento",
            "direccion": "direccion",
            "telefono": "Telefono",
            "celular": "Celular",
            "id_genr_genero": "Genero",
            "id_genr_pais": "Pais",
            "id_genr_provincia": "Provincia",
            "id_genr_ciudad": "Ciudad",
            "id_genr_tipo_sangre": "Tipo de sangre",
            "id_genr_etnia": "Etnia",
            "id_genr_jornada": "Jornada",
            "id_genr_indigena": "Raza indigena",
            "id_genr_idioma_ancestral": "Idioma Ancestral",
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
            "pnombres": "Nombres del Padre",
            "papellidos": "Apellidos del Padre",
            "pidentificacion": "Identificacion (padre)",
            "pdireccion": "Direccion del padre",
            "ptelefono": "Telefono",
            "pvive_con_usted": "El Padre vive con el estudiante",
            "id_genr_estado_laboralp": "Estado laboral del Padre",
            "mnombres": "Nombres de la madre",
            "mapellidos": "Apellidos de la madre",
            "midentificacion": "Identificacion (madre)",
            "mdireccion": "Direccion de la madre",
            "mtelefono": "telefono",
            "mvive_con_usted": "La Madre vive con el estudiante?",
            "id_genr_estado_laboralm": "Estado Laboral de la Madre",
            "bono_solidario": "Bono solidario",
            "rnombres": "Nombres",
            "rapellidos": "Apellidos",
            "rtelefono": "telefono",
            "id_genr_tipo_identificacion": "Tipo de Identificacion",
            "ridentificacion": "Identificacion",
            "tipo_parentesco": "Parentesco",
            "rvive_con_usted": "El estudiante vive con usted?",
            "rdireccion_trabajo": "direccion de trabajo",
            "rtelefono_trabajo": "telefono ",
            "rcorreo": "Email ",
            "rhorario_laboral": "horario laboral",
            "mienbros_hogar": "Miembros del hogar",
        }
        widgets = {
            "nombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Estudiante"}),
            "apellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Estudiante"}),
            "fecha_de_nacimiento": forms.DateInput(attrs={"class": "form-control text-dark", "placeholder": "Dia/Mes/Año "}),
            "lugar_nacimiento": forms.TextInput(attrs={"class": "form-control", "placeholder": "Lugar de Nacimiento"}),
            "direccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion"}),
            "telefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono"}),
            "celular": forms.TextInput(attrs={"class": "form-control", "placeholder": "Celular"}),
            "pnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Padre"}),
            "papellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Padre"}),
            "pidentificacion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Cedula del padre"}),
            "pdireccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion del Padre"}),
            "ptelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono del Padre"}),
            "mnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres de la Madre"}),
            "mapellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos de la Madre"}),
            "midentificacion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Cedula de la Madre"}),
            "mdireccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion del Padre"}),
            "mtelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono de la Madre"}),
            "rnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre del Representante"}),
            "rapellidos": forms.TextInput(
                attrs={"class": "form-control", "placeholder": "Apellidos del Representante"}),
            "rtelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono del Representante"}),
            "ridentificacion": forms.TextInput(
                attrs={"class": "form-control", "placeholder": "Cedula del Representante"}),
            "tipo_parentesco": forms.TextInput(attrs={"class": "form-control", "placeholder": "Parentesco"}),
            "rdireccion_trabajo": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion"}),
            "rtelefono_trabajo": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono de Trabajo"}),
            "rcorreo": forms.TextInput(attrs={"class": "form-control", "placeholder": "Email"}),
            "rhorario_laboral": forms.TextInput(attrs={"class": "form-control", "placeholder": "Horario"}),
            "mienbros_hogar": forms.TextInput(attrs={"class": "form-control", "placeholder": "Miembros del Hogar"}),
        }

    def __init__(self, *args, **kwargs):
        super(EstudianteEditForm, self).__init__(*args, **kwargs)
        self.fields['id_genr_genero'].queryset = GenrGeneral.objects.filter(
            tipo='GEN')
        self.fields['id_genr_pais'].queryset = GenrGeneral.objects.filter(tipo='TPA')
        #  self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_tipo_sangre'].queryset = GenrGeneral.objects.filter(tipo='TSA')
        self.fields['id_genr_etnia'].queryset = GenrGeneral.objects.filter(tipo='ETN')
        self.fields['id_genr_jornada'].queryset = GenrGeneral.objects.filter(tipo='JOR')
        self.fields['id_genr_indigena'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_idioma_ancestral'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_provincia'].queryset = GenrGeneral.objects.filter(tipo='593')
        self.fields['id_genr_ciudad'].queryset = GenrGeneral.objects.filter(tipo__lt=24)
        self.fields['id_genr_categoria_migratoria'].queryset = GenrGeneral.objects.filter(tipo='CMI')
        self.fields['id_genr_tipo_identificacion'].queryset = GenrGeneral.objects.filter(tipo='TID')
        self.fields['id_genr_estado_laboralm'].queryset = GenrGeneral.objects.filter(tipo='ESTL')
        self.fields['id_genr_estado_laboralp'].queryset = GenrGeneral.objects.filter(tipo='ESTL')
        


class ConsultarEstudianteForm(ModelForm):
    class Meta:
        model = MantPersona
        fields = [
            "nombres",
            "apellidos",
            "identificacion",
            "fecha_de_nacimiento",
            "lugar_nacimiento",
            "direccion",
            "telefono",
            "celular",
            "id_genr_genero",
            "id_genr_pais",
            "id_genr_provincia",
            "id_genr_ciudad",
            "id_genr_tipo_sangre",
            "id_genr_etnia",
            "id_genr_jornada",
            "id_genr_indigena",
            "id_genr_idioma_ancestral",
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
            "pnombres",
            "papellidos",
            "pidentificacion",
            "pdireccion",
            "ptelefono",
            "pvive_con_usted",
            "id_genr_estado_laboralp",
            "mnombres",
            "mapellidos",
            "midentificacion",
            "mdireccion",
            "mtelefono",
            "mvive_con_usted",
            "id_genr_estado_laboralm",
            "bono_solidario",
            "rnombres",
            "rapellidos",
            "rtelefono",
            "id_genr_tipo_identificacion",
            "ridentificacion",
            "tipo_parentesco",
            "rvive_con_usted",
            "rdireccion_trabajo",
            "rtelefono_trabajo",
            "rcorreo",
            "rhorario_laboral",
            "mienbros_hogar",

        ]

        labels = {
            "nombres": "Nombres ",
            "apellidos": "Apellidos",
            "identificacion": "Identificacion",
            "fecha_de_nacimiento": "Fecha de Nacimiento",
            "lugar_nacimiento": "Lugar de Nacimiento",
            "direccion": "direccion",
            "telefono": "Telefono",
            "celular": "Celular",
            "id_genr_genero": "Genero",
            "id_genr_pais": "Pais",
            "id_genr_provincia": "Provincia",
            "id_genr_ciudad": "Ciudad",
            "id_genr_tipo_sangre": "Tipo de sangre",
            "id_genr_etnia": "Etnia",
            "id_genr_jornada": "Jornada",
            "id_genr_indigena": "Raza indigena",
            "id_genr_idioma_ancestral": "Idioma Ancestral",
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

            "pnombres": "Nombres del Padre",
            "papellidos": "Apellidos del Padre",
            "pidentificacion": "Identificacion (padre)",
            "pdireccion": "Direccion del padre",
            "ptelefono": "Telefono",
            "pvive_con_usted": "El Padre vive con el estudiante",
            "id_genr_estado_laboralp": "Estado laboral del Padre",
            "mnombres": "Nombres de la madre",
            "mapellidos": "Apellidos de la madre",
            "midentificacion": "Identificacion (madre)",
            "mdireccion": "Direccion de la madre",
            "mtelefono": "telefono",
            "mvive_con_usted": "La Madre vive con el estudiante?",
            "id_genr_estado_laboralm": "Estado Laboral de la Madre",
            "bono_solidario": "Bono solidario",

            "rnombres": "Nombres",
            "rapellidos": "Apellidos",
            "rtelefono": "telefono",
            "id_genr_tipo_identificacion": "Tipo de Identificacion",
            "ridentificacion": "Identificacion",
            "tipo_parentesco": "Parentesco",
            "rvive_con_usted": "El estudiante vive con usted?",
            "rdireccion_trabajo": "direccion de trabajo",
            "rtelefono_trabajo": "telefono ",
            "rcorreo": "Email ",
            "rhorario_laboral": "horario laboral",
            "mienbros_hogar": "Miembros del hogar",

        }
        widgets = {
            "nombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Estudiante"}),
            "apellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Estudiante"}),
            "identificacion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Numero de Cedula"}),
            "fecha_de_nacimiento": forms.DateInput(attrs={"class": "form-control text-dark"}),
            "lugar_nacimiento": forms.TextInput(attrs={"class": "form-control", "placeholder": "Lugar de Nacimiento"}),
            "direccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion"}),
            "telefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono"}),
            "celular": forms.TextInput(attrs={"class": "form-control", "placeholder": "Celular"}),
            "pnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres del Padre"}),
            "papellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos del Padre"}),
            "pidentificacion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Cedula del padre"}),
            "pdireccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion del Padre"}),
            "ptelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono del Padre"}),
            "mnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombres de la Madre"}),
            "mapellidos": forms.TextInput(attrs={"class": "form-control", "placeholder": "Apellidos de la Madre"}),
            "midentificacion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Cedula de la Madre"}),
            "mdireccion": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion del Padre"}),
            "mtelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono de la Madre"}),

            "rnombres": forms.TextInput(attrs={"class": "form-control", "placeholder": "Nombre del Representante"}),
            "rapellidos": forms.TextInput(
                attrs={"class": "form-control", "placeholder": "Apellidos del Representante"}),
            "rtelefono": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono del Representante"}),
            "ridentificacion": forms.TextInput(
                attrs={"class": "form-control", "placeholder": "Cedula del Representante"}),
            "tipo_parentesco": forms.TextInput(attrs={"class": "form-control", "placeholder": "Parentesco"}),
            "rdireccion_trabajo": forms.TextInput(attrs={"class": "form-control", "placeholder": "Direccion"}),
            "rtelefono_trabajo": forms.TextInput(attrs={"class": "form-control", "placeholder": "Telefono de Trabajo"}),
            "rcorreo": forms.TextInput(attrs={"class": "form-control", "placeholder": "Email"}),
            "rhorario_laboral": forms.TextInput(attrs={"class": "form-control", "placeholder": "Horario"}),
            "mienbros_hogar": forms.TextInput(attrs={"class": "form-control", "placeholder": "Miembros del Hogar"}),
        }

    def __init__(self, *args, **kwargs):
        super(ConsultarEstudianteForm, self).__init__(*args, **kwargs)

        self.fields['id_genr_genero'].queryset = GenrGeneral.objects.filter(
            tipo='GEN')
        self.fields['id_genr_pais'].queryset = GenrGeneral.objects.filter(tipo='TPA')
        #  self.fields['id_genr_estado_civil'].queryset = GenrGeneral.objects.filter(tipo='EST')
        self.fields['id_genr_tipo_sangre'].queryset = GenrGeneral.objects.filter(tipo='TSA')
        self.fields['id_genr_etnia'].queryset = GenrGeneral.objects.filter(tipo='ETN')
        self.fields['id_genr_jornada'].queryset = GenrGeneral.objects.filter(tipo='JOR')
        self.fields['id_genr_indigena'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_idioma_ancestral'].queryset = GenrGeneral.objects.filter(tipo='IDA')
        self.fields['id_genr_provincia'].queryset = GenrGeneral.objects.filter(tipo='593')
        self.fields['id_genr_ciudad'].queryset = GenrGeneral.objects.filter(tipo__lt=24)
        self.fields['id_genr_categoria_migratoria'].queryset = GenrGeneral.objects.filter(tipo='CMI')
        self.fields['id_genr_tipo_identificacion'].queryset = GenrGeneral.objects.filter(tipo='TID')
        self.fields['id_genr_estado_laboralm'].queryset = GenrGeneral.objects.filter(tipo='ESTL')
        self.fields['id_genr_estado_laboralp'].queryset = GenrGeneral.objects.filter(tipo='ESTL')
        self.fields['nombres'].widget.attrs['readonly'] = True
        self.fields['apellidos'].widget.attrs['readonly'] = True
        self.fields['identificacion'].widget.attrs['readonly'] = True
        self.fields['fecha_de_nacimiento'].widget.attrs['readonly'] = True
        self.fields['lugar_nacimiento'].widget.attrs['readonly'] = True
        self.fields['direccion'].widget.attrs['readonly'] = True
        self.fields['telefono'].widget.attrs['readonly'] = True
        self.fields['celular'].widget.attrs['readonly'] = True
        self.fields['id_genr_genero'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_pais'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_provincia'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_ciudad'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_tipo_sangre'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_etnia'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_jornada'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_indigena'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_idioma_ancestral'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_categoria_migratoria'].widget.attrs['disabled'] = 'disabled'
        self.fields['discapacidad'].widget.attrs['disabled'] = 'disabled'
        self.fields['discapacidad_renal'].widget.attrs['disabled'] = 'disabled'
        self.fields['discapacidad_neurologica'].widget.attrs['disabled'] = 'disabled'
        self.fields['enfermedad_alergica'].widget.attrs['disabled'] = 'disabled'
        self.fields['asma'].widget.attrs['disabled'] = 'disabled'
        self.fields['epilepsia'].widget.attrs['disabled'] = 'disabled'
        self.fields['enfermedad_congenita'].widget.attrs['disabled'] = 'disabled'
        self.fields['enfermedad_respiratoria'].widget.attrs['disabled'] = 'disabled'
        self.fields['atencion_psicologica'].widget.attrs['disabled'] = 'disabled'
        self.fields['pnombres'].widget.attrs['readonly'] = True
        self.fields['papellidos'].widget.attrs['readonly'] = True
        self.fields['pidentificacion'].widget.attrs['readonly'] = True
        self.fields['pdireccion'].widget.attrs['readonly'] = True
        self.fields['ptelefono'].widget.attrs['readonly'] = True
        self.fields['pvive_con_usted'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_estado_laboralp'].widget.attrs['disabled'] = 'disabled'
        self.fields['mnombres'].widget.attrs['readonly'] = True
        self.fields['mapellidos'].widget.attrs['readonly'] = True
        self.fields['midentificacion'].widget.attrs['readonly'] = True
        self.fields['mdireccion'].widget.attrs['readonly'] = True
        self.fields['mtelefono'].widget.attrs['readonly'] = True
        self.fields['mvive_con_usted'].widget.attrs['disabled'] = 'disabled'
        self.fields['id_genr_estado_laboralm'].widget.attrs['disabled'] = 'disabled'
        self.fields['bono_solidario'].widget.attrs['disabled'] = 'disabled'
        self.fields['rnombres'].widget.attrs['readonly'] = True
        self.fields['rapellidos'].widget.attrs['readonly'] = True
        self.fields['rtelefono'].widget.attrs['readonly'] = True
        self.fields['id_genr_tipo_identificacion'].widget.attrs['disabled'] = 'disabled'
        self.fields['ridentificacion'].widget.attrs['readonly'] = True
        self.fields['tipo_parentesco'].widget.attrs['readonly'] = True
        self.fields['rvive_con_usted'].widget.attrs['disabled'] = 'disabled'
        self.fields['rdireccion_trabajo'].widget.attrs['readonly'] = True
        self.fields['rtelefono_trabajo'].widget.attrs['readonly'] = True
        self.fields['rcorreo'].widget.attrs['readonly'] = True
        self.fields['rhorario_laboral'].widget.attrs['readonly'] = True
        self.fields['mienbros_hogar'].widget.attrs['readonly'] = True


class Editarste(ModelForm):
    class Meta:
        model = MovMatriculacionEstudiante
        fields = [

            "id_mov_anioelectivo_curso",

        ]
        labels = {

            "id_mov_anioelectivo_curso": "Curso",

        }

    def __init__(self, *args, **kwargs):
        super(Editarste, self).__init__(*args, **kwargs)
        self.fields['id_mov_anioelectivo_curso'].queryset = MovMatriculacionEstudiante.objects.filter(
            id_mov_anioelectivo_curso_id_curso=1).values('id_mov_anioelectivo_cursoid_curso_nombre')
