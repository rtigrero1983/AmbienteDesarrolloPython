from rest_framework import serializers
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral



class moduloSerializers(serializers.ModelSerializer):
    class Meta:
        model = ConfModulo
        fields = '__all__'
        
