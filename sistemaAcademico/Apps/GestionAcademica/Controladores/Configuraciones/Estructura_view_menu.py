from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from django.views.generic import ListView
from django.urls import reverse_lazy
import socket
from django.views.decorators.cache import cache_page
from django.core.paginator import Paginator


def menu(request):
    contexto = {}
    if 'usuario' in request.session:
            queryset = ConfMenu.objects.filter(id_genr_estado=97).select_related('id_modulo')
            template_name = 'sistemaAcademico/Configuraciones/Menus/menu.html'
            contexto['menu'] = queryset
            return render(request,template_name,contexto)
    else:
        return HttpResponseRedirect('timeout/')
    
#--------------------------------

def editar_menu(request,id):
    contexto = {}
    mp = ConfMenu.objects.filter(url__contains='#')
    contexto['lista_padre'] = mp
    menu_actual=ConfMenu.objects.get(id_menu=id)
    contexto['menu_actual'] = menu_actual

    if request.method == 'POST':
        var_nombre = request.POST.get('nom_menu')
        var_url = request.POST.get('url')
        var_lazy = request.POST.get('lazyname')
        estado = GenrGeneral.objects.get(idgenr_general=97)

        menu = ConfMenu(id_menu=id,
                        id_modulo=menu_actual.id_modulo,
                        id_padre=menu_actual.id_padre,
                        orden=menu_actual.orden,
                        descripcion=var_nombre,
                        id_genr_estado=estado,
                        url=var_url,
                        lazy_name=var_lazy,
                        icono=menu_actual.icono,
                        view=request.POST.get('view'))
        menu.save()
        return redirect('Academico:menu')

    return render(request, 'sistemaAcademico/Configuraciones/Menus/editar_menu.html',contexto)


#--------------------------------

def eliminar_menu(request,id):
    menu = ConfMenu.objects.get(id_menu = id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        menu.id_genr_estado = inactivo
        menu.save()
        return redirect('Academico:menu')
    return render(request,'sistemaAcademico/Configuraciones/Menus/eliminar_menu.html',{'menu':menu})


def nuevo_menu(request):

    mp = ConfMenu.objects.filter(url__contains='#').select_related('id_modulo')
    if request.method == 'POST':
        var_orden = None
        var_padre = request.POST.get('modulo')
        print(var_padre)
        padre = ConfMenu.objects.get(id_menu=var_padre)
        obj_modulo= ConfModulo.objects.get(id_modulo=int(padre.id_modulo.id_modulo))

        #--Guarda el ultimo orden guardado y le suma uno para guardar en el nuevo menu
        lista_orden= ConfMenu.objects.filter(id_padre=var_padre).order_by('-orden')[:1]
        for registro in lista_orden:
            b = int(registro.orden)
            var_orden = b+1

        var_nombre = request.POST.get('descripcion')
        obj_activo = GenrGeneral.objects.get(idgenr_general=97)
        var_url = request.POST.get('url')
        var_lazy_name = request.POST.get('lazyname')
        var_name = request.POST.get('name')
        var_view = request.POST.get('view')
        obj_menu = ConfMenu.objects.get(id_menu=var_padre)
        #--Crea el menu
        menu = ConfMenu.objects.create(id_modulo=obj_modulo,
                                       id_padre=var_padre,
                                       orden=var_orden,
                                       descripcion=var_nombre,
                                       id_genr_estado=obj_activo,
                                       url=var_url,
                                       icono=padre.icono,
                                       lazy_name=var_lazy_name,
                                       name=var_name,
                                       view=var_view)

        return redirect('Academico:menu')

    return render(request,'sistemaAcademico/Configuraciones/Menus/add_menu.html',{'menu_padre':mp})










