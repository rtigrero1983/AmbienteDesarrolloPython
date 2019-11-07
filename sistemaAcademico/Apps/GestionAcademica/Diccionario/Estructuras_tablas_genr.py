from django.db import models
from django.db.models import AutoField


class GenrGeneral(models.Model):
    idgenr_general = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=50, blank=False, null=False)
    codigo = models.CharField(max_length=50, blank=False, null=False)
    nombre = models.CharField(max_length=50, blank=False, null=False)

    class Meta:
        verbose_name = 'Lista',
        verbose_name_plural = 'Listas',
        db_table = 'genr_general'

    def __str__(self):
        return self.nombre

class GenrHistorial(models.Model):
    id_historial = models.AutoField(primary_key=True)
    modulo = models.CharField(max_length=50, blank=False, null=False)
    accion = models.CharField(max_length=50, blank=False, null=False)
    usuario_mod = models.CharField(max_length=50, blank=False, null=False)
    terminal_mod = models.CharField(max_length=50, blank=False, null=False)
    fecha_mod = models.DateField(blank=False, null=False)
    id_menu = models.ForeignKey('ConfMenu',on_delete=models.CASCADE,blank=False, null=False, related_name="fk_genrhistorial_confmenu")

    class Meta:
        verbose_name = 'Lista',
        verbose_name_plural = 'Listas',
        db_table = 'genr_historial'
