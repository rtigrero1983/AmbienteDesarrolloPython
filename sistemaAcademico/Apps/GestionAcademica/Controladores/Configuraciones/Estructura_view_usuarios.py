import socket
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
import hashlib
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *


def usuarios(request):
    if 'usuario' in request.session:
        usuarios = ConfUsuario.objects.filter(id_genr_estado=97)
        return render(request,'sistemaAcademico/Configuraciones/Usuarios/usuario.html',{'lista_usuarios':usuarios})
    else:
        return HttpResponse('<center><h1>su session ha caducado</h1></center>')


def editar_usuario(request,id):
    usuario=ConfUsuario.objects.get(id_usuario=id)
    permiso = GenrGeneral.objects.filter(tipo='TUS')
    rol = ConfRol.objects.get(id_rol=int(request.POST.get('rol')))
    contexto = {}
    usuario.fecha_creacion = usuario.fecha_creacion.strftime('%Y-%m-%d')
    contexto['empresa'] = usuario
    contexto['permiso'] = permiso
    estado = GenrGeneral.objects.get(idgenr_general=97)

    if request.method == 'POST':
        var_usuario = request.POST.get('usuario')
        var_contra = request.POST.get('contrasenia')
        conf_contra = request.POST.get('contrasenia2')
        tipo_persona = MantPersona.objects.get(id_persona=int(request.POST.get('persona')))
        tipo_usuario = GenrGeneral.objects.get(idgenr_general=int(request.POST.get('tipousuario')))


        usuario = ConfUsuario(usuario=var_usuario, contrasenia=var_contra,
                              contrasenia2=conf_contra, persona=tipo_persona,
                              id_genr_tipo_usuario=tipo_usuario, id_rol=rol, id_genr_estado=estado)
        usuario.save()
        return redirect('Academico:usuario')

    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/editar-usuario.html')


def nuevo_usuario(request):
    if 'usuario' in request.session:
        contexto = {}
        persona = MantPersona.objects.all()
        permiso = GenrGeneral.objects.filter(tipo='TUS')
        estado = GenrGeneral.objects.filter(tipo='STA')
        roles = ConfRol.objects.all()
        contexto['rol'] = roles
        contexto['lista_personas'] = persona
        contexto['genr_general'] = permiso
        contexto['estados'] = estado
        if request.method == 'POST':
            var_usuario = request.POST.get('usuario')
            var_contra = request.POST.get('contrasenia')
            conf_contra = request.POST.get('contrasenia2')
            tipo_persona = MantPersona.objects.get(id_persona=int(request.POST.get('persona')))
            tipo_usuario = GenrGeneral.objects.get(idgenr_general=int(request.POST.get('tipousuario')))
            estado = GenrGeneral.objects.get(idgenr_general=int(request.POST.get('estado')))
            rol = ConfRol.objects.get(id_rol=int(request.POST.get('rol')))
            if var_contra == conf_contra:
                h = hashlib.new("sha1")
                var_contra = str.encode(var_contra)
                h.update(var_contra)
                ConfUsuario.objects.create(usuario=var_usuario,clave=h.hexdigest(), id_persona=tipo_persona,
                                      id_genr_tipo_usuario=tipo_usuario, id_rol=rol, id_genr_estado=estado)
                return redirect('Academico:usuarios')
            else:
                contexto['error'] = 'No se pudo encontrar el usuario'

        return render(request, 'sistemaAcademico/Configuraciones/Usuarios/crear-usuario.html',contexto)
    else:
        return HttpResponse('<center><h1>su session ha caducado</h1></center>')