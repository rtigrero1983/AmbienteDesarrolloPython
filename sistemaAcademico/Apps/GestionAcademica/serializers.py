from rest_framework import serializers
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import ConfRol
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
class rolSerializers(serializers.Serializer):

    id_rol = serializers.ReadOnlyField()
    codigo = serializers.CharField()
    nombre = serializers.CharField()
    activo = GenrGeneral.objects.get(idgenr_general=97)
    id_genr_estado =serializers.IntegerField(activo)

    def create(self, validate_data):
        instancia = ConfRol()
        instancia.codigo = validate_data.get('codigo')
        instancia.nombre = validate_data.get('nombre')
        instancia.id_genr_estado = validate_data.get('id_genr_estado')
        datos = validate_data()
        if datos:
            instancia.save()
            return instancia
        else:
            raise serializers.ValidationError('Este rol ya esta registrado')

    def validated_rol(self,data):
        rol = ConfRol.objects.filter(id_rol=data)
        if rol:
            raise serializers.ValidationError('Este rol ya esta registrado')
        else:
            return data


