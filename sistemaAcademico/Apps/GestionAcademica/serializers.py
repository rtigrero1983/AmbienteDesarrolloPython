from rest_framework import serializers
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import ConfRol
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
class rolSerializers(serializers.Serializer):
    id_rol = serializers.ReadOnlyField()
    codigo = serializers.CharField()
    nombre = serializers.CharField()
    activo = GenrGeneral.objects.get(idgenr_general=97)
    id_genr_estado =  serializers.PKOnlyObject(activo)

    def create(self,validate_data):
        instancia  = ConfRol()
        instancia.codigo = validate_data.get('codigo')
        instancia.nombre = validate_data.get('nombre')
        instancia.id_genr_estado = validate_data.get('id_genr_estado')

        instancia.save()
        return instancia

    def validate_rol(self,data):
        rol = ConfRol.objects.filter(id_rol=data)
        if len(rol) != 0:
            raise serializers.ValidationError('Este rol ya esta registrado')
        else:
            return data


