from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *


def menu_padre(request):
    contexto = {}
    menu_padre = ConfMenu.objects.filter(id_padre = 0, id_genr_estado = 97)

    contexto['menu_padre'] = menu_padre
    return contexto


def menu_hijos(request):
	ctx = {}
	menu_h = ConfMenu.objects.filter(id_genr_estado = 97)
	ctx['menu_hijo'] =menu_h
	return ctx






