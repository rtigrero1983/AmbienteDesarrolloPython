from django.db import models
from django.db.models import AutoField
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantEstudiante, MantAnioLectivo
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral

class MovAdmision(models.Model):
    id_admision = models.AutoField(primary_key=True)
    tipo_documento = models.CharField(max_length=45, blank=False, null=False)
    documento = models.CharField(max_length=45, blank=False, null=False)#Cambiar a tipo de dato para almacenar documento
    id_estudiante = models.ForeignKey(MantEstudiante, on_delete=models.CASCADE, blank=False, null=False, related_name="fk_admision_estudiante", db_column='id_estudiante')
    class Meta:
        verbose_name = 'Admision'
        verbose_name_plural = 'Admisiones'
        db_table = 'mov_admision'
    def __str__(self):
        return self.tipo_documento

class MovCabCurso(models.Model):
    id_curso = models.AutoField(primary_key=True)
    codigo = models.CharField(unique=True, max_length=10)
    nombre = models.CharField(max_length=10)
    id_genr_regimen = models.ForeignKey(GenrGeneral, default=97, on_delete=models.CASCADE, blank=False, related_name='fk_cabcurso_regimen', null=False, db_column='id_genr_regimen')
    id_genr_modalidad = models.ForeignKey(GenrGeneral, default=97, on_delete=models.CASCADE, blank=False, null=False, related_name='fk_cabcurso_modalidad', db_column='id_genr_modalidad')
    id_genr_tipo_edu = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, blank=False, null=False, related_name='fk_materiaprof_tipoedu', db_column='id_genr_tipo_educacion')
    id_genr_formacion = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, blank=False, null=False, related_name="fk_cabcurso_formacion", db_column='id_genr_formacion')
    id_genr_curso = models.ForeignKey(GenrGeneral, default=97, on_delete=models.CASCADE, blank=False, null=False, related_name="fk_cabcurso_curso", db_column='id_genr_curso')#silenciar
    id_genr_jornada = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, blank=False, null=False, related_name= "fk_cabcurso_jornada", db_column='id_genr_jornada')
    cupo = models.IntegerField()
    class Meta:
        verbose_name = 'Curso'
        verbose_name_plural = 'Cursos'
        db_table = 'mov_cab_curso'
    def __str__(self):
        return self.nombre + " "+self.id_genr_formacion.nombre


class MovCabRegistroNotas(models.Model):
    id_registro_notas = models.AutoField(primary_key=True)
    id_detalle_registro_notas = models.ForeignKey('MovDetalleRegistroNotas', on_delete=models.CASCADE, blank=True, null=True, related_name="fk_cabregistronotas_detalleregistronotas", db_column='id_detalle_registro_notas')
    id_mov_anioelectivo_curso = models.ForeignKey('Mov_Aniolectivo_curso', on_delete=models.CASCADE, blank=True, null=True, related_name="fk_cabregistronotas_aniolectivocurso", db_column='id_mov_anioelectivo_curso')
    promedio_curso_1q = models.FloatField(blank=False, null=False)
    promedio_curso_2q = models.FloatField(blank=False, null=False)
    promedio_curso_general = models.FloatField(blank=False, null=False)
    fecha_ingreso = models.DateTimeField(blank=True, null=True)
    usuario_ing = models.CharField(max_length=45, blank=True, null=True)
    terminal_ing = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        verbose_name = 'Registro Notas'
        verbose_name_plural = 'Registro Notas'
        db_table = 'mov_cab_registro_notas'
    def __int__(self):
        return self.id_registro_notas

'''''
class MovDetalleEmpleado(models.Model):
    id_detalle_empleado = models.AutoField(primary_key=True)
    id_curso = models.ForeignKey(MovCabCurso, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleEmpleado_cabcurso",db_column='id_curso')
    id_genr_paralelo = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleEmpleado_paralelo",db_column='id_genr_paralelo')
    id_genr_materia = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleEmpleado_materia",db_column='id_genr_materia')
    id_anio_lectivo = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleEmpleado_aniolectivo",db_column='id_anio_lectivo')
    class Meta:
        verbose_name = 'Detalle Empleado'
        verbose_name_plural = 'Detalle Empleados'
        db_table = 'mov_detalle_empleado
    def __int__(self):
        return self.id_genr_paralelo
'''
class Mov_Aniolectivo_curso(models.Model):
    id_mov_anioelectivo_curso=models.AutoField(primary_key=True)
    id_anio_electivo=models.ForeignKey(MantAnioLectivo,on_delete=models.CASCADE)
    id_curso=models.ForeignKey(MovCabCurso,on_delete=models.CASCADE, blank=False, null=False,db_column='id_curso')
    id_genr_paralelo=models.ManyToManyField('GenrGeneral', blank=False, related_name="fk_mavaniolectivo_curso_genrparalelo", db_column='id_genr_paralelo')
    id_estado_gnral = models.ForeignKey('GenrGeneral', on_delete=models.CASCADE, blank=False, null=False, default=97, db_column='estado')
    class Meta:
        verbose_name = 'Ani_electivo_curso_paralelo'
        db_table = 'Mov_anioelectivo_curso_paralelo'
        constraints = [
            models.UniqueConstraint(fields=['id_anio_electivo', 'id_curso'], name='Unicos')
        ]

    def __str__(self):
        return  self.id_curso.nombre
class MovDetalleMateriaCurso(models.Model):
    id_detalle_materia_curso = models.AutoField(primary_key=True)
    id_mov_anio_lectivo_curso = models.ForeignKey(Mov_Aniolectivo_curso, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detallemateriacurso_aniolectivocurso",db_column='id_mov_aniolectivo_curso')
    total_horas = models.IntegerField(null=False, blank=False, default=1)
    estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, blank=False, null=False, related_name="fk_detallemateriacurso_estado",db_column='estado' ,default='97')
    id_genr_materias = models.ManyToManyField(GenrGeneral, blank=False, related_name="fk_detallemateriacurso_materias",db_column='id_genr_materias')
    class Meta:
        verbose_name = 'Detalle Materia Curso'
        verbose_name_plural = 'Detalle Materia Curso'
        db_table = 'mov_detalle_materia_curso'

    def __str__(self):
        return self.id_genr_materias.nombre+" "+self.id_mov_anio_lectivo_curso.id_curso.nombre+" "+self.id_mov_anio_lectivo_curso.id_genr_paralelo.nombre+" "+self.id_mov_anio_lectivo_curso.id_curso.id_genr_formacion.nombre


class MovDetalleRegistroNotas(models.Model):
    id_detalle_registro_notas = models.AutoField(primary_key=True)
    id_matriculacion_estudiante = models.ForeignKey('MovMatriculacionEstudiante', on_delete=models.CASCADE, blank=True, null=True, related_name="fk_detalleregistronotas_matriestudiante", db_column='id_matriculacion_estudiante')
    primer_parcial = models.FloatField(blank=False, null=False)
    segundo_parcial = models.FloatField(blank=False, null=False)
    tercer_parcial = models.FloatField(blank=False, null=False)
    examen = models.FloatField(blank=False, null=False)
    promedio = models.FloatField(blank=False, null=False)
    total_promedio_general = models.FloatField(blank=False, null=False)
    id_materia_profesor = models.ForeignKey('Mov_Materia_profesor', on_delete=models.CASCADE, blank=True, null=True, related_name="fk_detalleregistronotas_materiaprofesor", db_column='id_materia_profesor')
    id_general_quimestre = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, blank=False, null=False, related_name="fk_detalleregistronotas_quimestre", db_column='id_general_quimestre')
    class Meta:
        verbose_name = 'Detalle Registro de Curso'
        verbose_name_plural = 'Detalle Registro de Curso'
        db_table = 'mov_detalle_registro_notas'
    def __float__(self):
        return self.primer_parcial, self.segundo_parcial, self.tercer_parcial, self.examen, self.promedio, self.total_promedio_general


class MovMatriculacionEstudiante(models.Model):
    id_matriculacion_estudiante = models.AutoField(primary_key=True)
    id_estudiante = models.ForeignKey(MantEstudiante, on_delete=models.CASCADE, blank=False, null=False, related_name="fk_matriculacionestudiante_estudiante", db_column='id_estudiante')
    id_mov_anioelectivo_curso = models.ForeignKey('Mov_Aniolectivo_curso', on_delete=models.CASCADE, blank=True, null=True, related_name="fk_matriculacionestudiante_aniolectivo_curso", db_column='id_mov_anioelectivo_curso')
    estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, default=97 , related_name="fk_matriculacionestudiante_estado", db_column='estado')
    fecha_ingreso = models.DateTimeField(blank=True, null=True)
    usuario_ing = models.CharField(max_length=45, blank=True, null=True)
    terminal_ing = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        verbose_name = 'Matriculacion estudiante'
        verbose_name_plural = 'Matriculacion estudiante'
        db_table = 'mov_matriculacion_estudiante'
    def __int__(self):
        return self.id_matriculacion_estudiante



class Mov_Materia_profesor(models.Model):
    id_materia_profesor = models.AutoField(primary_key=True)
    id_empleado = models.ForeignKey('MantEmpleado', on_delete=models.CASCADE, blank=False, null=False,related_name='fk_materiaprof_empleado',db_column='id_empleado')
    id_detalle_materia_curso = models.ManyToManyField('MovDetalleMateriaCurso',  db_table="mov_profesor_materiacurso",related_name="fk_materia_profesor")
    class Meta:
        verbose_name='Mov_Materia_profesor'
        verbose_name_plural='Mov_Materia_profesores'
        db_table='mov_materia_profesor'

class Mov_Horario_materia(models.Model):
    id_horario = models.AutoField(primary_key=True)
    id_materia_profesor = models.ForeignKey('Mov_Materia_profesor', on_delete=models.CASCADE, blank=False, null=False, related_name='fk_horario_materiaprof',db_column='id_materia_profesor')
    hora_inicio = models.TimeField(null=False, blank=False)
    hora_fin = models.TimeField(null=False, blank=False)
    id_genr_dia = models.ForeignKey('GenrGeneral', null=False,blank=False,on_delete=models.CASCADE, default=97, related_name='fk_materiaprof_genrdia', db_column='id_genr_dia')
    fecha_ingreso = models.DateTimeField(blank=False, null=False)
    usuario_ing = models.CharField(max_length=45, blank=False, null=False)
    terminal_ing = models.CharField(max_length=45, blank=False, null=False)
    class Meta:
        verbose_name ='Mov_Horario_materia'
        verbose_name_plural='Mov_Horario_materias'
        db_table ='mov_horario_materia'

class Mov_Horas_docente(models.Model):
    id_horas_docente = models.AutoField(primary_key=True)
    total_horas = models.DecimalField(null=False, decimal_places=2, max_digits=65)
    horas_disponible =  models.DecimalField(null=False, decimal_places=2, max_digits=65)
    id_empleado = models.ForeignKey('MantEmpleado', on_delete=models.CASCADE, blank=False, null=False, related_name='fk_horario_docente_empelado', db_column='id_empleado')
    class Meta:
        verbose_name = 'Mov_Horas_docente'
        verbose_name_plural = 'Mov_Horas_docentes'
        db_table = 'mov_horas_docentes'