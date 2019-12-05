from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *

def contextos_globales(request):
    contexto = {}
    if 'usuario' in request.session:
        permiso = ConfPermiso.objects.filter(fk_permiso_rol__id_rol__fkrol_usuario__id_usuario=request.session.get('usuario'))
        usuario = ConfUsuario.objects.get(id_usuario = request.session.get('usuario'))
        contexto['permisos'] = permiso
        contexto['info_usuario'] = usuario
    return contexto








