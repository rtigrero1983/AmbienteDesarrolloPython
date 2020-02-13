from django.db import models
from django.db.models import AutoField
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantPersona


class ConfEmpresa(models.Model):
    id_empresa = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50, blank=False, null=False)
    razon_social = models.CharField(max_length=200, blank=False, null=False)
    id_genr_tipo_identificacion = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, db_column='id_genr_tipo_identificacion')
    identificacion = models.CharField(unique=True, max_length=50, blank=False, null=False)
    direccion = models.CharField(max_length=50, blank=False, null=False)
    representante_legal = models.CharField(max_length=50, blank=False, null=False)
    correo = models.CharField(max_length=100, blank=False, null=False)
    telefono = models.CharField(max_length=10, blank=False, null=False)
    fecha_creacion = models.DateField(blank=False, null=False)

    #related_name='estado El atributo related_name especifica el nombre de la relación inversa del modelo de usuario a su modelo.
    # si hay mas de dos claves foraneas que referencian a la misma tabla se debe usar related_name'
    id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name='estado_empresa', db_column='estado')
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
        nombre = models.CharField(max_length=20,blank=False, null=False)
        id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, db_column='id_genr_estado')

        class Meta:
            verbose_name = 'Modulo',
            verbose_name_plural = 'Modulos',
            db_table = 'conf_modulo'

        def __str__(self):
            return self.nombre, self.codigo

        def __unicode__(self):
            return self.id_modulo, self.id_genr_estado


class ConfRol(models.Model):
    id_rol = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=10, blank=False, null=False)
    nombre = models.CharField(max_length=45, blank=False, null=False)
    id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,blank=False, null=False,db_column='id_genr_estado')

    class Meta:
        verbose_name = 'Rol',
        verbose_name_plural = 'Roles',
        db_table = 'conf_rol'

    def __str__(self):
        return self.nombre

class ConfMenu(models.Model):
    id_menu = models.AutoField(primary_key=True)
    id_padre = models.IntegerField(blank=False,null=False)
    orden = models.IntegerField(blank=False, null=False)
    descripcion = models.CharField(max_length=45, blank=False, null=False, db_column='descripcion')
    id_genr_estado = models.ForeignKey(GenrGeneral,on_delete=models.CASCADE,db_column='id_genr_estado')
    url = models.CharField(blank=False,null=False, max_length=60)
    icono = models.CharField(max_length=50,blank=False,null=False,default='#')
    lazy_name = models.CharField(max_length=60,blank=False,default='example/')
    name = models.CharField(max_length=60, blank=False,default='example')
    view =  models.CharField(max_length=45,blank=False,null=False)

    class Meta:
        verbose_name = 'Menu',
        verbose_name_plural = 'Menu',
        db_table = 'conf_menu'
        ordering = ['orden']    

    def __str__(self):
        return self.name,self.lazy_name,self.descripcion,self.icono,self.url,self.lazy_name

    def __int__(self):
        return self.orden, self.id_padre

    def __unicode__(self):
        return  self.id_genr_estado


class ConfUsuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    usuario = models.CharField(max_length=45, blank=False, null=False)
    clave = models.CharField(max_length=45, blank=False, null=False)
    id_persona = models.ForeignKey(MantPersona, on_delete=models.CASCADE, db_column='id_persona')
    id_genr_tipo_usuario = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="fk_usuario_tipo_usuario", db_column='id_genr_tipo_usuario')
    id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, related_name="fk_usuario_estado", db_column='id_genr_estado')

    class Meta:
        verbose_name = 'Usuario',
        verbose_name_plural = 'Usuarios',
        db_table = 'conf_usuario'

    def __str__(self):
        return self.usuario


class ConfUsuario_rol(models.Model):
    id_usuario_rol = models.AutoField(primary_key=True)
    id_usuario = models.ForeignKey(ConfUsuario, on_delete=models.CASCADE, related_name="fkusuario_rol", db_column='id_usuario')
    id_rol =models.ForeignKey(ConfRol, on_delete=models.CASCADE, related_name="fkrol_usuario", db_column='id_rol')

    class Meta:
        verbose_name = 'Rol de usuario',
        verbose_name_plural = 'Roles de usuarios',
        db_table = 'conf_usuario_rol'

    def __int__(self):
        return self.id_usuario_rol

class ConfModulo_menu(models.Model):
    id_modulo_menu = models.AutoField(primary_key=True)
    id_modulo = models.ForeignKey(ConfModulo, on_delete=models.CASCADE, related_name="fk_modmen_modulo", db_column='id_modulo')
    id_menu = models.ForeignKey(ConfMenu, on_delete=models.CASCADE, related_name="fk_modmen_menu", db_column='id_menu')
    id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, db_column='id_genr_estado', default='97')

    class Meta:
        verbose_name = 'Modulo_Menu'
        verbose_name_plural = 'Modulos_Menus'
        db_table = 'conf_modulo_menu'

    def __unicode__(self):
        return self.id_modulo_menu, self.id_menu, self.id_modulo,self.id_genr_estado

class ConfAccion(models.Model):
        id_accion = models.AutoField(primary_key=True)
        descripcion = models.CharField(max_length=20, blank=False, null=False)
        id_menu = models.ForeignKey(ConfMenu, on_delete=models.CASCADE,related_name="fk_accion_menu", db_column='id_menu')
        id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE,related_name="fk_accion_genr" , db_column='id_genr_estado')

        class Meta:
            verbose_name = 'Accion'
            verbose_name_plural = 'Acciones'
            db_table = 'conf_accion'

        def __int__(self):
            return self.id_accion

class ConfPermiso(models.Model):
    id_permiso = models.AutoField(primary_key=True)
    id_modulo_menu = models.ForeignKey(ConfModulo_menu, on_delete=models.CASCADE, related_name="fk_permiso_modmenu", db_column='id_modulo_menu')
    id_usuario_rol = models.ForeignKey(ConfUsuario_rol, on_delete=models.CASCADE, related_name="fk_permiso_usurol", db_column='id_usuario_rol')

    class Meta:
        verbose_name = 'Permiso',
        verbose_name_plural = 'Permisos',
        db_table = 'conf_permiso'

    def __int__(self):
        return self.id_modulo

    def __unicode__(self):
        return self.id_usuario_rol

class ConfDetallePermiso(models.Model):
    id_detalle_permiso = models.AutoField(primary_key=True)
    id_permiso = models.ForeignKey(ConfPermiso, on_delete=models.CASCADE, related_name="fk_det_permiso_cab_permiso", db_column='id_permiso')
    id_menu = models.ForeignKey(ConfMenu, on_delete=models.CASCADE, related_name="fk_det_permiso_menu", db_column='id_menu')
    id_accion = models.ForeignKey(ConfAccion, on_delete=models.CASCADE, related_name="fk_det_permiso_accion", db_column='id_accion')
    id_genr_estado = models.ForeignKey(GenrGeneral, on_delete=models.CASCADE, db_column='id_genr_estado')

    class Meta:
        verbose_name = 'Detalle Permiso',
        verbose_name_plural = 'Detalle Permisos',
        db_table = 'conf_detalle_permiso'

    def __int__(self):
        return self.id_detalle_permiso

    def __unicode__(self):
        return self.id_menu, self.id_permiso, self.id_accion

class ConfCorreosSmpt(models.Model):
        id_correos_smpt = models.AutoField(primary_key=True)
        ssl = models.CharField(max_length=30, blank=False, null=False)
        dominio = models.CharField(max_length=30, blank=False, null=False)
        puerto = models.CharField(max_length=20, blank=False, null=False)
        usuario_c = models.CharField(max_length=100, blank=False, null=False)
        contrasenia_c = models.CharField(max_length=100, blank=False, null=False)
        descripcion = models.CharField(max_length=200, blank=False, null=False)

        class Meta:
            verbose_name = 'Correos Smpt',
            verbose_name_plural = 'Correos Smpt',
            db_table = 'conf_correos_smpt'

        def __int__(self):
            return self.id_correos_smpt

        def __str__(self):
            return self.usuario_c, self.contrasenia_c