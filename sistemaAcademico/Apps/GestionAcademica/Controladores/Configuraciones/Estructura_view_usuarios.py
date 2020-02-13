import socket
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
import hashlib
import os
from django.views.decorators.cache import cache_page
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *


def usuarios(request):
    if 'usuario' in request.session:
        usuarios = ConfUsuario.objects.filter(id_genr_estado=97).select_related('id_persona','id_genr_tipo_usuario')
        return render(request, 'sistemaAcademico/Configuraciones/Usuarios/usuario.html', {'lista_usuarios': usuarios})



def editar_usuario(request,id):
    usuario = ConfUsuario.objects.get(id_usuario=id)
    permiso = GenrGeneral.objects.filter(tipo='TUS').values()
    personas = MantPersona.objects.all().values()
    roles = ConfRol.objects.all().values()
    contexto = {}
    contexto['roles'] = roles
    contexto['usuario'] = usuario
    contexto['permiso'] = permiso
    contexto['lista_personas'] = personas
    estado = GenrGeneral.objects.get(idgenr_general=97)
    if request.method == 'POST':
        var_usuario = request.POST.get('usuario')
        tipo_persona = MantPersona.objects.get(id_persona=int(request.POST.get('persona')))
        tipo_usuario = GenrGeneral.objects.get(idgenr_general=int(request.POST.get('permiso')))
        roles = ConfRol.objects.get(id_rol=(int(request.POST.get('roles'))))

        usuario=ConfUsuario(id_usuario=id, usuario=var_usuario, clave=usuario.clave,id_persona=tipo_persona,
                                    id_genr_tipo_usuario=tipo_usuario,id_genr_estado=estado)
        usuario.save()


        rol=ConfUsuario_rol(id_usuario=usuario, id_rol=roles)

        rol.save()

        return redirect('Academico:usuarios')
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/editar-usuario.html', contexto)


def nuevo_usuario(request):
    if 'usuario' in request.session:
        contexto = {}
        persona = MantPersona.objects.all()
        permiso = GenrGeneral.objects.filter(tipo='TUS')
        estado = GenrGeneral.objects.filter(tipo='STA')
        roles = ConfRol.objects.all()
        contexto['lista_personas'] = persona
        contexto['genr_general'] = permiso
        contexto['estados'] = estado
        contexto['roles'] = roles


        if request.method == 'POST':
            var_usuario = request.POST.get('usuario')
            var_contra = request.POST.get('contrasenia')
            conf_contra = request.POST.get('contrasenia2')
            tipo_persona = MantPersona.objects.get(id_persona=int(request.POST.get('persona')))
            tipo_usuario = GenrGeneral.objects.get(idgenr_general=int(request.POST.get('permiso')))
            estado = GenrGeneral.objects.get(idgenr_general=97)
            roles = ConfRol.objects.get(id_rol=int(request.POST.get('roles')))
            if var_contra == conf_contra:
                h = hashlib.new("sha1")
                var_contra = str.encode(var_contra)
                h.update(var_contra)
                ConfUsuario.objects.create(usuario=var_usuario, clave=h.hexdigest(), id_persona=tipo_persona,
                         id_genr_tipo_usuario=tipo_usuario, id_genr_estado=estado)


                ConfUsuario_rol.objects.create(id_usuario=ConfUsuario.objects.get(usuario=request.POST.get('usuario')), id_rol=roles)

                return redirect('Academico:usuarios')
            else:
                contexto['error'] = 'No se pudo encontrar el usuario'
        return render(request, 'sistemaAcademico/Configuraciones/Usuarios/crear-usuario.html', contexto)
    else:
        return HttpResponse('<center><h1>su session ha caducado</h1></center>')


def eliminar_usuario(request,id):
    usuarios = ConfUsuario.objects.get(id_usuario=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        usuarios.id_genr_estado = inactivo
        usuarios.save()
        return redirect('Academico:usuarios')
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/eliminar.html', {'usuario': usuarios})