from django.db import models
from django.db.models import AutoField

#from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import ConfUsuario
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
#from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleEmpleado


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

class MantRepresentante(models.Model):
    id_representante = models.AutoField(primary_key=True)
    id_persona = models.ForeignKey(MantPersona, on_delete=models.CASCADE, blank=False, null=False)
    usuario_ing = models.CharField(max_length=45, blank=False, null=False)
    fecha_ingreso = models.DateTimeField(blank=False, null=False)
    terminal_ing = models.CharField(max_length=45, blank=False, null=False)
    id_genr_nivel_formacion = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, blank=False, null=False)
    ingresos_totales = models.FloatField(blank=False, null=False)
    id_usuario = models.IntegerField(blank=False, null=False)

    class Meta:
        verbose_name = 'Representante',
        verbose_name_plural = 'Representantes',
        db_table = 'mant_representante'

    def __str__(self):
        return self.usuario_ing, self.terminal_ing

class MantEstudiante(models.Model):
    id_estudiante = models.AutoField(primary_key=True)
    id_persona = models.ForeignKey(MantPersona, on_delete=models.CASCADE, blank=False, null=False,
                                   related_name="fk_estudiante_persona")
    tipo_estudiante = models.CharField(max_length=45, blank=False, null=False)
    fecha_ingreso = models.DateTimeField(blank=False, null=False)
    usuario_ing = models.CharField(max_length=45, blank=False, null=False)
    terminal_ing = models.CharField(max_length=45, blank=False, null=False)

    class Meta:
        verbose_name = 'Estudiante',
        verbose_name_plural = 'Estudiantes',
        db_table = 'mant_estudiante'

    def __str__(self):
        return self.tipo_estudiante, self.usuario_ing

class MantAnioLectivo(models.Model):
    id_anio_lectivo = models.AutoField(primary_key=True)
    anio = models.IntegerField(blank=False, null=False)
    ciclo = models.IntegerField(blank=False, null=False)
    fecha_incio_ciclo = models.DateField(blank=False, null=False)
    fecha_fin_ciclo = models.DateField(blank=False, null=False)
    id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, blank=False, null=False,
                                       related_name="fk_aniolectivo_estado")

    class Meta:
        verbose_name = 'Año lectivo',
        verbose_name_plural = 'Año lectivo',
        db_table = 'mant_anio_lectivo'

    def __str__(self):
        return self.ciclo, self.anio


class MantEmpleado(models.Model):
    id_empleado = models.AutoField(primary_key=True)
    id_persona = models.ForeignKey(MantPersona, on_delete=models.CASCADE, blank=False, null=False,
                                   related_name="fk_empleado_persona")
    id_detalle_empleado = models.ForeignKey('MovDetalleEmpleado', on_delete=models.CASCADE, blank=False, null=False,
                                            related_name="fk_empleado_detalle")
    id_anio_lectivo = models.ForeignKey(MantAnioLectivo, on_delete=models.CASCADE, blank=False, null=False,
                                        related_name="fk_empleado_anio_lectivo")
    id_usuario = models.ForeignKey('ConfUsuario', on_delete=models.CASCADE, blank=False, null=False,
                                   related_name="fk_empleado_usuario")
    fecha_ingreso = models.DateTimeField(blank=False, null=False)
    usuario_ing = models.CharField(max_length=45, blank=False, null=False)
    terminal_ing = models.CharField(max_length=45, blank=False, null=False)

    class Meta:
        verbose_name = 'Empleado',
        verbose_name_plural = 'Empleados',
        db_table = 'mant_empleado'

    def __str__(self):
        return self.usuario_ing


