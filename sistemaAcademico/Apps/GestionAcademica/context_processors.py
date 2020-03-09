from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *


def acciones(request):
    Agregar = []
    Editar = []
    Eliminar = []
    Imprimir = []
    permiso = ConfMenu.objects.filter(fk_permiso_modmenu__id_rol__fk_rol__id_usuario=request.session.get('usuario'), id_genr_estado=97).values('descripcion')
    a = ConfAccion.objects.filter(id_rol_id__fk_permiso_rol__id_rol__fk_rol__id_usuario=request.session.get('usuario'))
    for accion in a:
            if accion.descripcion == 'Agregar':
                for m in accion.id_menu.all():
                    Agregar.append(m)

            if accion.descripcion == 'Editar':
                for m in accion.id_menu.all().values('id_menu','descripcion','url'):
                    Editar.append(m)

            if accion.descripcion == 'Eliminar':
                for m in accion.id_menu.all().values('id_menu','descripcion','url'):
                    Eliminar.append(m)

            if accion.descripcion == 'Imprimir':
                for m in accion.id_menu.all().values('id_menu','descripcion','url'):
                    Imprimir.append(m)

    return {'permisos':permiso,'agregar':Agregar,'editar':Editar,'eliminar':Eliminar,'imprimir':Imprimir}




