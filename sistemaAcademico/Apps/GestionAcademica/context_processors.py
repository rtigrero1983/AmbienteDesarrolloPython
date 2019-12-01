from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *

def menu_padre(request):
    contexto = {}
    contador = 0
    menu_padre = ConfMenu.objects.filter(id_padre = 0, id_genr_estado = 97)
    contexto['menu_padre'] = menu_padre
    if 'usuario' in request.session:
        permiso = ConfPermiso.objects.filter(fk_permiso_rol__id_rol__fkrol_usuario__id_usuario=request.session.get('usuario'))
        contexto['permisos'] = permiso
    return contexto


def menu_hijos(request):
	ctx = {}
	menu_h = ConfMenu.objects.filter(id_genr_estado = 97)
	ctx['menu_hijo'] =menu_h
	return ctx






