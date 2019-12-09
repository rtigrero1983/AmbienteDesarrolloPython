from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *

def contextos_globales(request):
    contexto = {}
    if 'usuario' in request.session:
        permiso = ConfMenu.objects.filter(fk_permiso_menu__fk_permiso_rol__id_rol__fkrol_usuario__id_usuario=request.session.get('usuario')).values('descripcion','url','id_padre','id_menu','icono').order_by('orden')
        usuario = ConfUsuario.objects.get_or_create(id_usuario = request.session.get('usuario'))
        contexto['permisos'] = permiso
        contexto['info_usuario'] = usuario
        #print(contexto)
    return contexto








