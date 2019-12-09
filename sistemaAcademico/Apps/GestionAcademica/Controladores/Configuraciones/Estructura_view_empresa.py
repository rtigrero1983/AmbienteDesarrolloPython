from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import socket

def empresas(request):
    if 'usuario' in request.session:
        lista_empresa= ConfEmpresa.objects.filter(id_genr_estado=97)
        return render(request,'sistemaAcademico/Configuraciones/Empresas/empresa.html', {'lista_empresa': lista_empresa})
    else:
        return HttpResponseRedirect('../')

def nueva_empresa(request):
    if 'usuario' in request.session:
        contexto = {}
        tip_ident = GenrGeneral.objects.filter(tipo='TID')
        estado = GenrGeneral.objects.filter(tipo='STA')
        contexto['tip_ident'] = tip_ident
        contexto['estados'] = estado
        if request.method == 'POST':
            var_empresa_nombre = request.POST.get('nombre')
            var_rsocial = request.POST.get('rsocial')
            var_tip_ident = GenrGeneral.objects.get(idgenr_general=(int(request.POST.get('tip_ident'))))
            var_ident = request.POST.get('identificacion')
            direccion = request.POST.get('direccion')
            representante_legal = request.POST.get('rlegal')
            correo = request.POST.get('correo')
            telefono = request.POST.get('telefono')
            fecha_creacion = request.POST.get('f_creacion')
            nombre_equipo = socket.gethostname()
            usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
            menu = ConfMenu.objects.get(id_menu=23)
            estado = GenrGeneral.objects.get(idgenr_general=97)

            empresa = ConfEmpresa(nombre=var_empresa_nombre, razon_social=var_rsocial,
                                  id_genr_tipo_identificacion=var_tip_ident, identificacion=var_ident,
                                  direccion=direccion, representante_legal=representante_legal, correo=correo,
                                  telefono=telefono, fecha_creacion=fecha_creacion, id_genr_estado=estado,
                                  fecha_ingreso=timezone.now(),
                                  usuario_ing=usuario.usuario, terminal_ing=str(nombre_equipo))
            empresa.save()

            historial = GenrHistorial(modulo="Configuraciones", accion="Crear", usuario_mod=usuario.usuario,
                                      terminal_mod=str(nombre_equipo), fecha_mod=timezone.now(), id_menu=menu)
            historial.save()

            return redirect('Academico:empresas')
        return render(request,'sistemaAcademico/Configuraciones/Empresas/add_empresa.html', contexto)
    else:
        return HttpResponseRedirect('../')


def editar_empresa(request,id):
    empresa = ConfEmpresa.objects.get(id_empresa=id)
    var_tip_ident = GenrGeneral.objects.filter(tipo='TID')
    contexto={}
    empresa.fecha_creacion = empresa.fecha_creacion.strftime('%Y-%m-%d')
    contexto['empresa'] = empresa
    contexto['ident'] = var_tip_ident
    estado = GenrGeneral.objects.get(idgenr_general=97)
    if request.method == 'POST':
                var_empresa_nombre = request.POST.get('nombre')
                var_rsocial = request.POST.get('rsocial')
                var_tip_ident = GenrGeneral.objects.get(idgenr_general=(int(request.POST.get('tip_ident'))))
                var_ident = request.POST.get('identificacion')
                direccion = request.POST.get('direccion')
                representante_legal = request.POST.get('rlegal')
                correo = request.POST.get('inputEmail3')
                telefono = request.POST.get('telefono')
                fecha_creacion = request.POST.get('f_creacion')
                empresa = ConfEmpresa(id_empresa=id,nombre=var_empresa_nombre, razon_social=var_rsocial,
                                      id_genr_tipo_identificacion=var_tip_ident, identificacion=var_ident,
                                      direccion=direccion, representante_legal=representante_legal, correo=correo,
                                      telefono=telefono, fecha_creacion=fecha_creacion,id_genr_estado=estado)
                empresa.save()
                return redirect('Academico:empresas')
    return render(request, 'sistemaAcademico/Configuraciones/Empresas/Editar_empresa.html',contexto)

def eliminar_empresa(request,id):
    empresas = ConfEmpresa.objects.get(id_empresa=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        empresas.id_genr_estado = inactivo
        empresas.save()
        return redirect('Academico:empresas')
    return render(request, 'sistemaAcademico/Configuraciones/Empresas/eliminar.html', {'menu': empresas})