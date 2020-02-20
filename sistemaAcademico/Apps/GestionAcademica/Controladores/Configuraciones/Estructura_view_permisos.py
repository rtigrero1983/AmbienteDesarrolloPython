from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import socket


def perfiles(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        contexto={}
        rol=ConfRol.objects.filter(id_genr_estado=97)
        contexto['rol']=rol
        return render(request,'sistemaAcademico/Configuraciones/Permisos/permisos.html',contexto)
    else:
        return HttpResponseRedirect('timeout/')


def add_permiso(request,id):
    if 'usuario' in request.session:
        contexto={}
        rol=ConfRol.objects.filter(id_rol=id)
        accion=ConfAccion.objects.filter(id_menu=33)
        menu=ConfMenu.objects.filter(id_genr_estado=97, id_padre=23)
        menu2=ConfMenu.objects.filter(id_genr_estado=97,id_padre=27)
        modulo = ConfModulo.objects.filter(id_genr_estado=97)
        contexto['modulo'] = modulo
        contexto['menu'] = menu
        contexto['accion']= accion
        contexto['rol']=rol
        contexto['menu2']=menu2
        if request.method=='POST':
            pass

        return render(request, 'sistemaAcademico/Configuraciones/Permisos/add_permisos.html',contexto)
    else:
        return HttpResponseRedirect('timeout/')



def editar_permiso(request,id):
    contexto={}
    modulo = ConfModulo.objects.filter(id_genr_estado=97)
    estado = GenrGeneral.objects.filter(tipo='STA')
    menu= ConfMenu.objects.all()
    contexto['modulo'] = modulo
    contexto['estado'] = estado
    contexto['menu']=menu
    permiso=ConfPermiso.objects.all()
    contexto['permiso']= permiso
    if request.method == 'POST':
        menu = ConfMenu.objects.get(id_menu=int(request.POST.get('menu')))
        modulo = ConfModulo.objects.get(id_modulo=int(request.POST.get('modulo')))
        est = GenrGeneral.objects.get(idgenr_general=int(request.POST.get('estado')))
        print(menu)
        guardar_pemiso = ConfPermiso(id_permiso=id,id_menu=menu, id_modulo=modulo, id_genr_estado=est)
        guardar_pemiso.save(force_update=True)
        return redirect('Academico:perfiles')


    return render (request,'sistemaAcademico/Configuraciones/Permisos/editar_permiso.html',contexto)