from django.db import models
from django.db.models import AutoField

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral

class MantPersona(models.Model):
    id_persona = models.AutoField(primary_key=True)
    nombres = models.CharField(max_length=50, blank=False, null=False)
    apellidos = models.CharField(max_length=50, blank=False, null=False)
    fecha_de_nacimiento = models.DateField(blank=False, null=False)
    estado = models.IntegerField(blank=False, null=False)
    foto = models.ImageField(blank=False, null=False)
    id_genr_genero = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="genero")
    id_genr_pais = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE)
    id_genr_tipo_identificacion = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="identificacion")
    id_genr_estado_civil = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="estado_civil")
    identificacion = models.CharField(unique=True, max_length=50, blank=False, null=False)
    telefono = models.CharField(max_length=15, blank=False, null=False)
    correo = models.CharField(max_length=50, blank=False, null=False)
    fecha_ingreso = models.DateTimeField(blank=False, null=False)
    usuario_ing = models.CharField(max_length=60, blank=False, null=False)
    terminal_ing = models.CharField(max_length=60, blank=False, null=False)
    id_genr_tipo_sangre = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="tipo_de_sangre")
    id_genr_etnia = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="etnia")
    direccion = models.CharField(max_length=150, blank=True, null=True)
    id_genr_jornada = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="jornada")
    id_genr_indigena = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="indigena")
    id_genr_idioma_ancestral = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="acestral")
    celular = models.CharField(max_length=15, blank=False, null=False)
    lugar_nacimiento = models.CharField(max_length=45, blank=False, null=False)
    id_genr_provincia = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="provincia")
    id_genr_ciudad = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="ciudad")
    id_genr_categoria_migratoria = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="categoria_migratoria")
    discapacidad = models.IntegerField(blank=False, null=False)
    discapacidad_renal = models.IntegerField(blank=False, null=False)
    discapacidad_neurologica = models.IntegerField(blank=False, null=False)
    enfermedad_alergica = models.IntegerField(blank=False, null=False)
    asma = models.IntegerField(blank=False, null=False)
    epilepsia = models.IntegerField(blank=False, null=False)
    enfermedad_congenita = models.IntegerField(blank=False, null=False)
    enfermedad_respiratoria = models.IntegerField(blank=False, null=False)
    atencion_psicologica = models.IntegerField(blank=False, null=False)
    bono_solidario = models.IntegerField(blank=False, null=False)
    mienbros_hogar = models.IntegerField(blank=False, null=False)
    id_genr_tipo_usuario = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="persona_tipo_usuario")
    id_genr_estado_laboralp = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="estado_laboralp")
    pnombres = models.CharField(max_length=45, blank=False, null=False)
    papellidos = models.CharField(max_length=45, blank=False, null=False)
    pidentificacion = models.IntegerField(unique=True, blank=False, null=False)
    pdireccion = models.CharField(max_length=45, blank=False, null=False)
    ptelefono = models.CharField(max_length=45, blank=False, null=False)
    pvive_con_usted = models.IntegerField(blank=False, null=False)
    id_genr_estado_laboralm = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="estado_laboralm")
    mnombres = models.CharField(max_length=45, blank=False, null=False)
    mapellidos = models.CharField(max_length=45, blank=False, null=False)
    mdireccion = models.CharField(max_length=45, blank=False, null=False)
    mtelefono = models.CharField(max_length=45, blank=False, null=False)
    midentificacion = models.IntegerField(unique=True, blank=False, null=False)
    mvive_con_usted = models.IntegerField(blank=False, null=False)
    rnombres = models.CharField(max_length=45, blank=False, null=False)
    rapellidos = models.CharField(max_length=45, blank=False, null=False)
    rdireccion = models.CharField(max_length=45, blank=False, null=False)
    rtelefono = models.CharField(max_length=45, blank=False, null=False)
    id_genr_tipo_parentesco = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="tipo_parentesco")
    rvive_con_usted = models.IntegerField(blank=False, null=False)
    ridentificacion = models.CharField(unique=True, max_length=13, blank=False, null=False)

    class Meta:
        verbose_name = 'Persona',
        verbose_name_plural = 'Personas',
        db_table = 'mant_persona'

    def __str__(self):
        return self.nombres
