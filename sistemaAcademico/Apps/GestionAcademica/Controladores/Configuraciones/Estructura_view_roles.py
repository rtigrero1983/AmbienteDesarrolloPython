from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, redirect

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *


def roles(request):
    if 'usuario' in request.session:
        roles = ConfRol.objects.filter(id_genr_estado=97)
        return render(request, 'sistemaAcademico/Configuraciones/Roles/rol.html', {'lista_roles': roles})
    else:
        return HttpResponse('<center><h1>su session ha caducado</h1></center>')


def nuevo_rol(request):
    if 'usuario' in request.session:
        if request.method == 'POST':
            codigo = request.POST.get('codigo')
            nombre = request.POST.get('nombre')
            ConfRol.objects.create(codigo=codigo, nombre=nombre,id_genr_estado=97)
            return redirect('Academico:roles')
        return render(request, 'sistemaAcademico/Configuraciones/Roles/add_rol.html')
    else:
        return HttpResponse('<center><h1>su session ha caducado</h1></center>')


def editar_rol(request, id):
    if 'usuario' in request.session:
        contexto = {}
        roles = ConfRol.objects.get(id_rol=id)
        contexto['roles'] = roles
        if request.method == 'POST':
            nombre = request.POST.get('nombre')
            codigo = request.POST.get('codigo')
            print(codigo)
            save = ConfRol(id_rol=id, codigo=codigo, nombre=nombre, id_genr_estado=97)
            save.save()
            return redirect('Academico:roles')
        return render(request, 'sistemaAcademico/Configuraciones/Roles/editar_rol.html', contexto)
    else:
        return HttpResponse('<center><h1>su session ha caducado</h1></center>')


def eliminar_rol(request, id):
    if 'usuario' in request.session:
        roles = ConfRol.objects.get(id_rol=id)
        inactivo = GenrGeneral.objects.get(idgenr_general=98)
        if request.method == 'POST':
            roles.id_genr_estado = 98
            roles.save()
            return redirect('Academico:roles')
        return render(request, 'sistemaAcademico/Configuraciones/Roles/eliminar_rol.html', {'roles': roles})
    else:
        return HttpResponse('<center><h1>su session ha caducado</h1></center>')
