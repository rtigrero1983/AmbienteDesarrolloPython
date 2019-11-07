from django.db import models
from django.db.models import AutoField
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantEstudiante, MantAnioLectivo
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral


class MovAdmision(models.Model):
    id_admision = models.AutoField(primary_key=True)
    tipo_documento = models.CharField(max_length=45,blank=False, null=False)
    documento = models.CharField(max_length=45,blank=False, null=False)#Cambiar a tipo de dato para almacenar documento
    id_estudiante = models.ForeignKey(MantEstudiante, on_delete=models.CASCADE, blank=False, null=False, related_name="fk_admision_estudiante")

    class Meta:
        verbose_name = 'Admision'
        verbose_name_plural='Admisiones'
        db_table = 'mov_admision'

    def __str__(self):
        return self.tipo_documento

class MovCabCurso(models.Model):
    id_curso = models.AutoField(primary_key=True)
    codigo = models.CharField(unique=True, max_length=10)
    nombre = models.CharField(max_length=10)
    id_genr_formacion = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_cabcurso_formacion")
    id_genr_curso = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_cabcurso_curso" )
    id_genr_paralelo = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_cabcurso_paralelo")
    id_genr_jornada = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_cabcurso_jornada")
    cupo = models.IntegerField()
    id_anio_lectivo = models.ForeignKey(MantAnioLectivo, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_cabcurso_aniolectivo")

    class Meta:
        verbose_name = 'Curso'
        verbose_name_plural = 'Cursos'
        db_table = 'mov_cab_curso'

    def __str__(self):
        return self.nombre

class MovCabRegistroNotas(models.Model):
    id_registro_notas = models.AutoField(primary_key=True)
    id_empleado = models.ForeignKey('MantEmpleado', on_delete=models.CASCADE,blank=False, null=False, related_name="fk_registronotas_empleado")
    id_curso = models.ForeignKey(MovCabCurso, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_registronotas_cabcurso")
    id_genr_materia = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_registronotas_materia")
    id_anio_lectivo = models.ForeignKey(MantAnioLectivo, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_registronotas_anniolectivo")
    promedio_curso_1q = models.FloatField(blank=False, null=False)
    promedio_curso_2q = models.FloatField(blank=False, null=False)
    promedio_curso_general = models.FloatField(blank=False, null=False)

    class Meta:
        verbose_name = 'Registro Notas'
        verbose_name_plural = 'Registro Notas'
        db_table = 'mov_cab_registro_notas'

    def __str__(self):
        return self.id_genr_materia

class MovDetalleEmpleado(models.Model):
    id_detalle_empleado = models.AutoField(primary_key=True)
    id_curso = models.ForeignKey(MovCabCurso, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleEmpleado_cabcurso")
    id_genr_paralelo = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleEmpleado_paralelo")
    id_genr_materia = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleEmpleado_materia")
    id_anio_lectivo = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleEmpleado_aniolectivo")

    class Meta:
        verbose_name = 'Detalle Empleado'
        verbose_name_plural = 'Detalle Empleados'
        db_table = 'mov_detalle_empleado'

    def __str__(self):
        return self.id_genr_paralelo

class MovDetalleMateriaCurso(models.Model):
    id_detalle_curso = models.AutoField(primary_key=True)
    id_curso = models.ForeignKey(MovCabCurso, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detallemateriacurso_cabcurso")
    anio = models.IntegerField(blank=False, null=False)
    estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detallemateriacurso_estado")
    id_genr_materias = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detallemateriacurso_materias")

    class Meta:
        verbose_name = 'Detalle Materia Curso'
        verbose_name_plural = 'Detalle Materia Curso'
        db_table = 'mov_detalle_materia_curso'

    def __str__(self):
        return self.anio

class MovDetalleRegistroNotas(models.Model):
    id_detalle_registro_notas = models.AutoField(primary_key=True)
    primer_parcial = models.FloatField(blank=False, null=False)
    segundo_parcial = models.FloatField(blank=False, null=False)
    tercer_parcial = models.FloatField(blank=False, null=False)
    examen = models.FloatField(blank=False, null=False)
    promedio = models.FloatField(blank=False, null=False)
    total_promedio_general = models.FloatField(blank=False, null=False)
    id_general_quimestre = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleregistronotas_quimestre")
    id_estudiante = models.ForeignKey(MantEstudiante, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_detalleregistronotas_estudiante")

    class Meta:
        verbose_name = 'Detalle Registro de Curso'
        verbose_name_plural = 'Detalle Registro de Curso'
        db_table = 'mov_detalle_registro_notas'

    def __str__(self):
        return self.primer_parcial

class MovEstudianteAsignacionCurso(models.Model):
    id_estudiante_curso = models.AutoField(primary_key=True)
    id_estudiante = models.ForeignKey(MantEstudiante, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_estudianteAsignacioncurso_estudiante")
    id_curso = models.ForeignKey(MovCabCurso, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_estudianteAsignacioncurso_movcabcurso")
    fecha_ingreso = models.DateTimeField(blank=False, null=False)
    usuario_ing = models.CharField(max_length=45, blank=False, null=False)
    terminal_ing = models.CharField(max_length=45, blank=False, null=False)

    class Meta:
        verbose_name = 'Asignacion de curso'
        verbose_name_plural = 'Asignacion de curso'
        db_table = 'mov_estudiante_asignacion_curso'

    def __str__(self):
        return self.usuario_ing

class MovMatriculacionEstudiante(models.Model):
    id_matriculacion_estudiante = models.AutoField(primary_key=True)
    id_estudiante = models.ForeignKey(MantEstudiante, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_matriculacionestudiante_estudiante")
    id_anio_lectivo = models.ForeignKey(MantAnioLectivo, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_matriculacionestudiante_aniolectivo")
    id_curso = models.ForeignKey(MovCabCurso, on_delete=models.CASCADE,blank=False, null=False, related_name="fk_matriculacionestudiante_cabcurso")

    class Meta:
        verbose_name = 'Matriculacion estudiante'
        verbose_name_plural = 'Matriculacion estudiante'
        db_table = 'mov_matriculacion_estudiante'

    def __str__(self):
        return self.id_matriculacion_estudiante