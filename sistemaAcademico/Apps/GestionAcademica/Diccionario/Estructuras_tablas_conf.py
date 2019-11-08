from django.db import models
from django.db.models import AutoField
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantPersona


class ConfEmpresa(models.Model):
    id_empresa = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50, blank=False, null=False)
    razon_social = models.CharField(max_length=200, blank=False, null=False)
    id_genr_tipo_identificacion = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE)
    identificacion = models.CharField(unique=True, max_length=50, blank=False, null=False)
    direccion = models.CharField(max_length=50, blank=False, null=False)
    representante_legal = models.CharField(max_length=50, blank=False, null=False)
    correo = models.CharField(max_length=100, blank=False, null=False)
    telefono = models.CharField(max_length=10, blank=False, null=False)
    fecha_creacion = models.DateField(blank=False, null=False)

    #related_name='estado El atributo related_name especifica el nombre de la relación inversa del modelo de usuario a su modelo.
    # si hay mas de dos claves foraneas que referencian a la misma tabla se debe usar related_name'
    id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name='estado_empresa')
    #------------------------------------------------------------------------------------------------------------------------

    fecha_ingreso = models.DateField(blank=False, null=False, )
    usuario_ing = models.CharField(max_length=45, blank=False, null=False)
    terminal_ing = models.CharField(max_length=45, blank=False, null=False)

    class Meta:
        verbose_name = 'Empresa',
        verbose_name_plural = 'Empresas',
        db_table = 'conf_empresa'

    def __str__(self):
        return self.nombre

class ConfModulo(models.Model):
        id_modulo = models.AutoField(primary_key=True)
        codigo = models.CharField(max_length=20, blank=False, null=False)
        id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE)

        class Meta:
            verbose_name = 'Modulo',
            verbose_name_plural = 'Modulos',
            db_table = 'conf_modulo'

        def __str__(self):
            return self.codigo

class ConfRol(models.Model):
    id_rol = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=10, blank=False, null=False)
    nombre = models.CharField(max_length=45, blank=False, null=False)

    class Meta:
        verbose_name = 'Rol',
        verbose_name_plural = 'Roles',
        db_table = 'conf_rol'

    def __str__(self):
        return self.nombre

class ConfMenu(models.Model):
    id_menu = models.AutoField(primary_key=True)
    id_modulo = models.ForeignKey(ConfModulo,on_delete=models.CASCADE)
    id_padre = models.IntegerField(blank=False,null=False)
    orden = models.IntegerField(blank=False, null=False)
    version = models.CharField(max_length=45, blank=False, null=False)

    class Meta:
        verbose_name = 'Menu',
        verbose_name_plural = 'Menus',
        db_table = 'conf_menu'

    def __str__(self):
        return self.version

class ConfUsuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    usuario = models.CharField(max_length=45, blank=False, null=False)
    clave = models.CharField(max_length=45, blank=False, null=False)
    id_persona = models.ForeignKey(MantPersona, on_delete=models.CASCADE)
    id_genr_tipo_usuario = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="fk_usuario_tipo_usuario")
    id_rol = models.ForeignKey(ConfRol, on_delete=models.CASCADE)
    id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="fk_usuario_estado")

    class Meta:
        verbose_name = 'Usuario',
        verbose_name_plural = 'Usuarios',
        db_table = 'conf_usuario'

    def __str__(self):
        return self.usuario



class ConfPermiso(models.Model):
    id_permiso = models.AutoField(primary_key=True)
    id_menu = models.ForeignKey(ConfMenu, on_delete=models.CASCADE, related_name="fk_permiso_menu")
    id_usuario = models.ForeignKey(ConfUsuario, on_delete=models.CASCADE, related_name="fk_permiso_usuario")
    id_modulo = models.ForeignKey(ConfModulo, on_delete=models.CASCADE, related_name="fk_permiso_modulo")
    id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="fk_permiso_estado")

    class Meta:
        verbose_name = 'Permiso',
        verbose_name_plural = 'Permisos',
        db_table = 'conf_permiso'

    def __str__(self):
        return self.id_permiso

