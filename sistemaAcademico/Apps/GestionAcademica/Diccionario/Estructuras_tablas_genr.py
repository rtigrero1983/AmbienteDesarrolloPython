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