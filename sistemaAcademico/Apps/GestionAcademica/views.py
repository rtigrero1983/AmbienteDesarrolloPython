from .Controladores.Configuraciones.Estructura_view_empresa import *
from .Controladores.Configuraciones.Estructura_view_usuarios import *
from .Controladores.Configuraciones.Estructura_view_menu import *
from .Controladores.Configuraciones.Estructura_view_acciones import *
from .Controladores.Configuraciones.Estructura_view_modulo import *
from .Controladores.Configuraciones.Estructura_view_permisos import *
from .Controladores.Configuraciones.Estructura_view_roles import *
from .Controladores.Mantenimiento.Estructura_view_reportes import *
from .Controladores.Mantenimiento.Estructura_view_consultas import *
from .Controladores.Mantenimiento.Estructura_view_mantenimientos import *
from .Controladores.Mantenimiento.Estructura_view_movimientos import *
from .Controladores.Mantenimiento.Estructura_view_procesos import *
import hashlib
from django.template.loader import get_template

from .Diccionario.Estructuras_tablas_conf import ConfMenu, ConfUsuario, ConfModulo_menu, ConfPermiso


def inicio(request):
    if 'usuario' in request.session:
        contexto = {}
        permiso = ConfPermiso.objects.filter(
            id_rol__fk_rol__id_usuario=request.session.get('usuario'), menu__id_genr_estado=97).select_related('id_rol')
        print(permiso)
        for p in permiso:
            print(p.menu.descripcion)
        usuario = ConfUsuario.objects.get(
            id_usuario=request.session.get('usuario'))
        contexto['permisos'] = permiso
        contexto['info_usuario'] = usuario
        return render(request, 'base/base.html', contexto)
    else:
        return HttpResponseRedirect('timeout/')


def login(request):
    contexto = {}
    try:
        if request.method == 'POST':
            var_usuario = request.POST.get('usu')
            var_contra = request.POST.get('pass')
            h = hashlib.new("sha1")
            var_contra = str.encode(var_contra)
            h.update(var_contra)
            print(h.hexdigest())
            usu = ConfUsuario.objects.get(
                usuario=var_usuario, clave=h.hexdigest(), id_genr_estado=97)

            if usu:
                request.session['usuario'] = usu.id_usuario
                return redirect("Academico:inicio")
    except Exception as e:
        contexto['error'] = e
        return render(request, 'base/login.html', contexto)

    return render(request, 'base/login.html', contexto)


def salir(request):
    del request.session['usuario']
    return HttpResponseRedirect('../')


def pantalla_principal(request):
    t = get_template('sistemaAcademico/Pantalla_principal.html')
    html = t.render()
    return HttpResponse(html)


def timeout(request):
    return render(request, 'sistemaAcademico/timeout.html')
