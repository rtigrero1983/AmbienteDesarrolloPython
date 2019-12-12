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



def base(request):
    return render(request,'base/blank.html')


def inicio(request):
    if 'usuario' in request.session:
        contexto = {}
        permiso = ConfMenu.objects.filter(
            fk_permiso_menu__fk_permiso_rol__id_rol__fkrol_usuario__id_usuario=request.session.get('usuario')).values(
            'descripcion', 'url', 'id_padre', 'id_menu', 'icono').order_by('orden')
        usuario = ConfUsuario.objects.get_or_create(id_usuario=request.session.get('usuario'))
        contexto['permisos'] = permiso
        contexto['info_usuario'] = usuario
        return render(request, 'sistemaAcademico/inicio.html', contexto)
    else:
        return HttpResponseRedirect('../')


def login(request):
    contexto = {}
    if request.method == 'POST':
            var_usuario = request.POST.get('usu')
            var_contra = request.POST.get('pass')
            h = hashlib.new("sha1")
            var_contra = str.encode(var_contra)
            h.update(var_contra)
            usu = ConfUsuario.objects.get(usuario=var_usuario,clave=h.hexdigest(),id_genr_estado=97)
            if usu:
                request.session['usuario'] = usu.id_usuario
                return redirect("Academico:inicio")
            else:
                contexto['error']= "Credenciales incorrectas o esta cuenta esta inactiva"
    return render(request,'base/login.html',contexto)


def salir(request):
    del request.session['usuario']
    return HttpResponseRedirect('../')



def pantalla_principal(request):
    return render(request,'sistemaAcademico/Pantalla_principal.html')

