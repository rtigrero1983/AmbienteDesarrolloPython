from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.urls import reverse_lazy
import socket


def menu(request):
    contexto = {}
    if 'usuario' in request.session:
            menu = ConfMenu.objects.filter(id_genr_estado=97).values('id_menu','descripcion','id_padre','icono','url')
            contexto['menu'] = menu
            #print(contexto)
            return render(request, 'sistemaAcademico/Configuraciones/Menus/menu.html',contexto)
    else:
        return HttpResponseRedirect('../')

#--------------------------------

def nuevo_menu(request):
    contexto = {}
    if request.method == 'POST':
        estado = GenrGeneral.objects.get(idgenr_general=97)
        var_nombre = request.POST.get('nom_menu')
        var_url = request.POST.get('url')
        var_icono = request.POST.get('icono')
        menu = ConfMenu(id_modulo=var_modulo,id_padre=var_menu_padre,orden=var_orden,descripcion=var_nombre,id_genr_estado=estado,url=var_url)
        menu.save()
        return redirect('Academico:menu')
    return render(request, 'sistemaAcademico/Configuraciones/Menus/add_menu.html',contexto)

#--------------------------------

def editar_menu(request,id):
    contexto = {}
    modulos = ConfModulo.objects.all()
    lista_padre = ConfMenu.objects.filter(id_padre=0)
    contexto['lista_padre'] = lista_padre
    contexto['modulos'] = modulos
    menu_actual= ConfMenu.objects.get(id_menu = id)
    contexto['menu_actual'] = menu_actual

    if request.method == 'POST':
        var_menu_padre = request.POST.get('num_padre')
        var_orden = request.POST.get('orden')
        var_modulo = ConfModulo.objects.get(id_modulo=int(request.POST.get('modulo')))
        estado = GenrGeneral.objects.get(idgenr_general=97)
        var_nombre = request.POST.get('nom_menu')
        var_icono=request.POST.get('icono')
        var_url = request.POST.get('url')
        menu = ConfMenu(id_menu=id,id_modulo=var_modulo,id_padre=var_menu_padre,orden=var_orden,descripcion=var_nombre,id_genr_estado=estado,url=var_url,icono=var_icono)
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



class Menu(ListView):
    model = ConfMenu
    template_name = 'sistemaAcademico/Configuraciones/Menus/menu.html'
    context_object_name = 'menu'
    queryset =  ConfMenu.objects.filter(id_genr_estado = 97)


def nuevo_menu(request):

    if request.method == 'POST':
        var_path = request.POST.get('path')
        var_nombre = request.POST.get('nom_menu')
        var_url = request.POST.get('url')
        modulo = ConfModulo.objects.get(id_modulo=id)

        menu = ConfMenu.objects.create()

        return redirect('Academico:menu')

    return render(request,'sistemaAcademico/Configuraciones/Menus/add_menu.html')










