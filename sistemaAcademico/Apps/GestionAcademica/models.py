# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class ConfEmpresa(models.Model):
    id_empresa = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=20, blank=True, null=True)
    razon_social = models.CharField(max_length=50, blank=True, null=True)
    id_genr_tipo_identificacion = models.ForeignKey('GenrGeneral', models.DO_NOTHING, db_column='idgenr_general', blank=True, null=True)
    identificacion = models.CharField(unique=True, max_length=13, blank=True, null=True)
    direccion = models.CharField(max_length=45, blank=True, null=True)
    representante_legal = models.CharField(max_length=45, blank=True, null=True)
    correo = models.CharField(max_length=45, blank=True, null=True)
    telefono = models.CharField(max_length=45, blank=True, null=True)
    fecha_creacion = models.DateField(blank=True, null=True)
    estado = models.ForeignKey('GenrGeneral', models.DO_NOTHING, db_column='estado',blank=True, null=True)
    fecha_ingreso = models.DateField(blank=True, null=True)
    usuario_ing = models.CharField(max_length=45, blank=True, null=True)
    terminal_ing = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'conf_empresa'


class ConfMenu(models.Model):
    id_menu = models.AutoField(primary_key=True)
    id_modulo = models.ForeignKey('ConfModulo', models.DO_NOTHING, db_column='id_modulo', blank=True, null=True)
    id_padre = models.IntegerField(blank=True, null=True)
    orden = models.IntegerField(blank=True, null=True)
    descripcion = models.CharField(max_length=45, blank=True, null=True)
    id_genr_estado = models.ForeignKey('GenrGeneral', models.DO_NOTHING, db_column='id_genr_estado', blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'conf_menu'


class ConfModelo(models.Model):
    id_modelo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    version = models.CharField(max_length=45, blank=True, null=True)
    anio = models.IntegerField(blank=True, null=True)
    fecha_inicio = models.DateField(blank=True, null=True)
    fecha_final = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'conf_modelo'


class ConfModulo(models.Model):
    id_modulo = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=20, blank=True, null=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)
    id_genr_estado = models.ForeignKey('GenrGeneral', models.DO_NOTHING, db_column='id_genr_estado', blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'conf_modulo'


class ConfPermiso(models.Model):
    id_permiso = models.AutoField(primary_key=True)
    id_menu = models.ForeignKey(ConfMenu, models.DO_NOTHING, db_column='id_menu', blank=True, null=True)
    id_usuario = models.ForeignKey('ConfUsuario', models.DO_NOTHING, db_column='id_usuario', blank=True, null=True)
    id_modulo = models.ForeignKey(ConfModulo, models.DO_NOTHING, db_column='id_modulo', blank=True, null=True)
    id_genr_estado = models.ForeignKey('GenrGeneral', models.DO_NOTHING, db_column='id_genr_estado', blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'conf_permiso'


class ConfRol(models.Model):
    id_rol = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=10, blank=True, null=True)
    nombre = models.CharField(max_length=15, blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'conf_rol'


class ConfUsuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    usuario = models.CharField(max_length=45)
    clave = models.CharField(max_length=45)
    id_persona = models.ForeignKey('MantPersona', models.DO_NOTHING, db_column='id_persona', blank=True, null=True)
    id_genr_tipo_usuario = models.ForeignKey('GenrGeneral', models.DO_NOTHING, db_column='id_genr_tipo_usuario', blank=True, null=True)
    id_rol = models.ForeignKey(ConfRol, models.DO_NOTHING, db_column='id_rol', blank=True, null=True)
    id_genr_estado = models.ForeignKey('GenrGeneral', models.DO_NOTHING, db_column='id_genr_estado', blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'conf_usuario'


class GenrGeneral(models.Model):
    idgenr_general = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=45, blank=True, null=True)
    codigo = models.CharField(max_length=15, blank=True, null=True)
    nombre = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'genr_general'


class GenrHistorial(models.Model):
    id_historial = models.AutoField(primary_key=True)
    modulo = models.CharField(max_length=45, blank=True, null=True)
    accion = models.CharField(max_length=15, blank=True, null=True)
    usuario_mod = models.CharField(max_length=45, blank=True, null=True)
    terminal_mod = models.CharField(max_length=45, blank=True, null=True)
    fecha_mod = models.DateField(blank=True, null=True)
    id_menu = models.ForeignKey(ConfMenu, models.DO_NOTHING, db_column='id_menu', blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'genr_historial'


class MantPersona(models.Model):
    id_persona = models.AutoField(primary_key=True)
    nombres = models.CharField(max_length=45)
    apellidos = models.CharField(max_length=45)
    fecha_de_nacimiento = models.DateField()
    estado = models.IntegerField()
    foto = models.TextField(blank=True, null=True)
    id_genr_genero = models.ForeignKey(GenrGeneral, models.DO_NOTHING, db_column='id_genr_genero')
    id_genr_pais = models.ForeignKey(GenrGeneral, models.DO_NOTHING, db_column='id_genr_pais')
    id_genr_tipo_identificacion = models.ForeignKey(GenrGeneral, models.DO_NOTHING, db_column='id_genr_tipo_identificacion')
    id_genr_estado_civil = models.ForeignKey(GenrGeneral, models.DO_NOTHING, db_column='id_genr_estado_civil')
    identificacion = models.CharField(unique=True, max_length=13)
    telefono = models.CharField(max_length=15)
    correo = models.CharField(max_length=40)
    fecha_ingreso = models.DateTimeField(blank=True, null=True)
    usuario_ing = models.CharField(max_length=45, blank=True, null=True)
    terminal_ing = models.CharField(max_length=45, blank=True, null=True)
    id_genr_tipo_sangre = models.IntegerField(blank=True, null=True)
    id_genr_etnia = models.IntegerField(blank=True, null=True)
    direccion = models.CharField(max_length=150, blank=True, null=True)
    id_genr_jornada = models.IntegerField(blank=True, null=True)
    id_genr_indigena = models.IntegerField(blank=True, null=True)
    id_genr_idioma_ancestral = models.IntegerField(blank=True, null=True)
    celular = models.CharField(max_length=15, blank=True, null=True)
    lugar_nacimiento = models.CharField(max_length=45, blank=True, null=True)
    id_genr_provincia = models.ForeignKey(GenrGeneral, models.DO_NOTHING, db_column='id_genr_provincia', blank=True, null=True)
    id_genr_ciudad = models.ForeignKey(GenrGeneral, models.DO_NOTHING, db_column='id_genr_ciudad', blank=True, null=True)
    id_genr_categoria_migratoria = models.ForeignKey(GenrGeneral, models.DO_NOTHING, db_column='id_genr_categoria_migratoria', blank=True, null=True)
    discapacidad = models.IntegerField(blank=True, null=True)
    discapacidad_renal = models.IntegerField(blank=True, null=True)
    discapacidad_neurologica = models.IntegerField(blank=True, null=True)
    enfermedad_alergica = models.IntegerField(blank=True, null=True)
    asma = models.IntegerField(blank=True, null=True)
    epilepsia = models.IntegerField(blank=True, null=True)
    enfermedad_congenita = models.IntegerField(blank=True, null=True)
    enfermedad_respiratoria = models.IntegerField(blank=True, null=True)
    atencion_psicologica = models.IntegerField(blank=True, null=True)
    bono_solidario = models.IntegerField(blank=True, null=True)
    mienbros_hogar = models.IntegerField(blank=True, null=True)
    id_genr_tipo_usuario = models.IntegerField(blank=True, null=True)
    id_genr_estado_laboralp = models.IntegerField(blank=True, null=True)
    pnombres = models.CharField(max_length=45, blank=True, null=True)
    papellidos = models.CharField(max_length=45, blank=True, null=True)
    pidentificacion = models.IntegerField(unique=True, blank=True, null=True)
    pdireccion = models.CharField(max_length=45, blank=True, null=True)
    ptelefono = models.CharField(max_length=45, blank=True, null=True)
    pvive_con_usted = models.IntegerField(blank=True, null=True)
    id_genr_estado_laboralm = models.IntegerField(blank=True, null=True)
    mnombres = models.CharField(max_length=45, blank=True, null=True)
    mapellidos = models.CharField(max_length=45, blank=True, null=True)
    mdireccion = models.CharField(max_length=45, blank=True, null=True)
    mtelefono = models.CharField(max_length=45, blank=True, null=True)
    midentificacion = models.IntegerField(unique=True, blank=True, null=True)
    mvive_con_usted = models.IntegerField(blank=True, null=True)
    rnombres = models.CharField(max_length=45, blank=True, null=True)
    rapellidos = models.CharField(max_length=45, blank=True, null=True)
    rdireccion = models.CharField(max_length=45, blank=True, null=True)
    rtelefono = models.CharField(max_length=45, blank=True, null=True)
    id_genr_tipo_parentesco = models.IntegerField(blank=True, null=True)
    rvive_con_usted = models.IntegerField(blank=True, null=True)
    ridentificacion = models.CharField(unique=True, max_length=13, blank=True, null=True)

    class Meta:
        managed = False
        abstract = True
        db_table = 'mant_persona'
