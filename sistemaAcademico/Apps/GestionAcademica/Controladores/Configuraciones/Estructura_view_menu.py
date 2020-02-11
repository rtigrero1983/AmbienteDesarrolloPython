from django.db.models import Q
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
            queryset = ConfMenu.objects.filter(id_genr_estado=97)
            template_name = 'sistemaAcademico/Configuraciones/Menus/menu.html'
            contexto['menu'] = queryset
            return render(request,template_name,contexto)
    else:
        return HttpResponseRedirect('timeout/')
    
#--------------------------------

def editar_menu(request,id):
    contexto = {}
    mp = ConfMenu.objects.filter(url__contains='#')
    menu_actual = ConfMenu.objects.get(id_menu=id)
    contexto['lista_padre'] = mp
    contexto['permisos'] = ConfPermiso.objects.filter(id_modulo_menu__id_menu=menu_actual)
    contexto['menu_actual'] = menu_actual
    if request.method == 'POST':
        menu = ConfMenu(id_menu=id,
                        id_padre=menu_actual.id_padre,
                        orden=menu_actual.orden,
                        descripcion=request.POST.get('nom_menu'),
                        id_genr_estado=GenrGeneral.objects.get(idgenr_general=97),
                        url=request.POST.get('url'),
                        lazy_name=request.POST.get('lazyname'),
                        icono=menu_actual.icono,
                        view=request.POST.get('view')
                        )
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
    try:
        mp = ConfMenu.objects.filter(url__contains='#')
        if request.method == 'POST':
            var_orden = 0
            lista_orden= ConfMenu.objects.filter(id_padre=request.POST.get('modulo')).order_by('-orden')[:1]
            for registro in lista_orden:
                b = int(registro.orden)
                var_orden = b+1
            obj_menu = ConfMenu.objects.get(id_menu=request.POST.get('modulo'))
            menu = ConfMenu.objects.create(
                                    id_padre=request.POST.get('modulo'),
                                    orden=var_orden,
                                    descripcion=request.POST.get('descripcion'),
                                    id_genr_estado=GenrGeneral.objects.get(idgenr_general=97),
                                    url=request.POST.get('url'),
                                    icono=obj_menu.icono,
                                    lazy_name=request.POST.get('lazyname'),
                                    name=request.POST.get('name'),
                                    view=request.POST.get('view')
                                    )
            ConfModulo_menu.objects.create(
                                            id_modulo=ConfModulo.objects.get(nombre=obj_menu.descripcion),
                                            id_menu = menu,
                                            id_genr_estado=GenrGeneral.objects.get(idgenr_general=97)
                                          )

            return redirect('Academico:menu')



    except Exception as e:
        raise e
    
    return render(request,'sistemaAcademico/Configuraciones/Menus/add_menu.html',{'menu_padre':mp})










