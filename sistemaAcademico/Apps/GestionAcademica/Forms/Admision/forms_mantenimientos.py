
from sistemaAcademico.Apps.GestionAcademica import models
from django import forms

class CrearEmpleado(forms.ModelForm):
    class Meta:
        model = models.MantPersona
        fields = [
            "nombres",
            "apellidos",
            "fecha_de_nacimiento",
            "id_genr_genero",
            "id_genr_pais",
            "id_genr_tipo_identificacion",
            "identificacion",
            "id_genr_estado_civil",
            "telefono",
            "correo",
            "celular",
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
# Datos del Familiar
            "pnombres",
            "papellidos",
            "pidentificacion",
            "pdireccion",
            "ptelefono",
        ]
        labels = {
            "nombres": "Nombres",
            "apellidos":"Apellidos",
            "fecha_de_nacimiento":"Fecha de Nacimiento",
            "id_genr_genero":"Genero",
            "id_genr_pais":"Pais",
            "id_genr_tipo_identificacion":"Tipo de Identificacion",
            "identificacion": "Identificacion",
            "id_genr_estado_civil":"Estado Civil",
            "telefono":"Telefono",
            "correo":"Email",
            "celular":"Numero de Celular",
            "id_genr_tipo_sangre":"Tipo de sangre",
            "id_genr_etnia":"Etnia",
            "id_genr_jornada":"Jornada",
            "id_genr_indigena":"Raza indigena",
            "id_genr_idioma_ancestral":"Idioma Ancestral",
            "lugar_nacimiento":"Lugar de Nacimiento",
            "id_genr_provincia":"Provincia",
            "id_genr_ciudad":"Ciudad",
            "id_genr_categoria_migratoria":"Categoria Migratoria",
            "discapacidad":"Discapacidad",
            "discapacidad_renal":"Discapacidad renal",
            "discapacidad_neurologica":"Discapacidad neurologica",
            "enfermedad_alergica":"Enfermedad alergica",
            "asma":"Asma",
            "epilepsia":"Epilepsia",
            "enfermedad_congenita":"Enfermedad congenitiva",
            "enfermedad_respiratoria":"Enfermedad respiratoria",
            "atencion_psicologica":"Atencion psicologica",
            "bono_solidario":"Bono solidario",
            "mienbros_hogar":"Mienbros del hogar",
            "id_genr_estado_laboralp":"Estado laboral",
# Datos del Familiar
            "pnombres":"Nombres del familiar",
            "papellidos": "Apellidos del familiar",
            "pidentificacion":"Identificacion",
            "pdireccion":"Direccion",
            "ptelefono":"Telefono",
        }
        widgets = {
            "nombres": forms.TextInput(),
            "apellidos": forms.TextInput(),
            "fecha_de_nacimiento": forms.DateField(),
            "id_genr_genero": forms.CheckboxSelectMultiple(),
            "id_genr_pais": forms.ChoiceField(choices=models.GenrGeneral.nombre.filter(tipo='TPA')),
            "id_genr_tipo_identificacion": forms.CheckboxSelectMultiple(),
            "identificacion": forms.TextInput(),
            "id_genr_estado_civil": forms.CheckboxSelectMultiple(),
            "telefono": forms.TextInput(),
            "correo": forms.TextInput(),
            "celular": forms.TextInput(),
            "id_genr_tipo_sangre": forms.CheckboxSelectMultiple(),
            "id_genr_etnia": forms.CheckboxSelectMultiple(),
            "id_genr_jornada": forms.CheckboxSelectMultiple(),
            "id_genr_indigena": forms.CheckboxSelectMultiple(),
            "id_genr_idioma_ancestral": forms.CheckboxSelectMultiple(),
            "lugar_nacimiento": forms.TextInput(),
            "id_genr_provincia": forms.CheckboxSelectMultiple(),
            "id_genr_ciudad": forms.CheckboxSelectMultiple(),
            "id_genr_categoria_migratoria": forms.CheckboxSelectMultiple(),
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
            "mienbros_hogar": forms.TextInput(),
            "id_genr_estado_laboralp": forms.CheckboxInput(),
            # Datos del Familiar
            "pnombres": forms.TextInput(),
            "papellidos": forms.TextInput(),
            "pidentificacion": forms.TextInput(),
            "pdireccion": forms.TextInput(),
            "ptelefono": forms.TextInput(),
        }