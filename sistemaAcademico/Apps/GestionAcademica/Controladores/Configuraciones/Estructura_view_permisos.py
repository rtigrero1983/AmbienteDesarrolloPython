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

def editar_permisos(request,id):
    rol = ConfRol.objects.get(id_rol=id)
    rol_menu = ConfModulo_menu.objects.filter(fk_permiso_modmenu__id_rol=id).select_related('id_menu','id_modulo')
    menu_padre = ConfMenu.objects.filter(id_genr_estado=97,id_padre=0)
    return render(request,'sistemaAcademico/Configuraciones/Permisos/asignar_permisos.html',{'rol':rol,'menu':menu_padre,'rol_menu':rol_menu})




def add_permiso(request,id):
    queryset_rol = ConfRol.objects.get(id_rol=id)
    queryset = ConfModulo_menu.objects.filter()
    if 'usuario' in request.session:
        if request.method=='POST':
            c = ConfModulo_menu.objects.get(id_menu=request.post.get('menu'))
            ConfPermiso.objects.create(id_mod_menu=c,id_rol=queryset_rol)
            return redirect('Academico:perfiles')

        return render(request, 'sistemaAcademico/Configuraciones/Permisos/permisos_nuevo.html',{'rol':queryset_rol,'mod_menu':queryset})
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