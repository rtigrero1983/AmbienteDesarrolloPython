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
from .Controladores.Matriculacion.View_estudiante import *
import hashlib
from django.template.loader import get_template

from .Diccionario.Estructuras_tablas_conf import ConfMenu, ConfUsuario, ConfModulo_menu, ConfPermiso
from .Diccionario.Estructuras_tablas_mant import *


def inicio(request):
    if 'usuario' in request.session:
        contexto = {}
        permiso = ConfMenu.objects.filter(
            fk_permiso_modmenu__id_rol__fk_rol__id_usuario=request.session.get('usuario'), id_genr_estado=97).values()
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
            usu = ConfUsuario.objects.filter(
                usuario=var_usuario, clave=h.hexdigest(), id_genr_estado=97).first()
            if usu:
                request.session['usuario'] = usu.id_usuario
                return redirect("Academico:inicio")
            else:
                usu = UsuarioTemp.objects.filter(usuario=var_usuario,clave=h.hexdigest()).first()
                if usu:
                    request.session['usuario'] = usu.id_usuario
                    return redirect("Academico:inicio")
                else:
                    contexto['error'] = "Usuario o contraseña incorrectos"
                    return render(request, 'base/login.html', contexto)

    except Exception as e:
        contexto['error'] = "Usuario o contraseña incorrectos"
        return render(request, 'base/login.html', contexto)
    return render(request,'base/login.html',contexto)


def salir(request):
    del request.session['usuario']
    return HttpResponseRedirect('../')


def pantalla_principal(request):
    usuarios = ConfUsuario.objects.filter(id_genr_estado=97).count()
    personas = MantPersona.objects.filter().count()
    alumnos = MantEstudiante.objects.filter().count()
    empleados =  MantEmpleado.objects.filter().count()

    return render(request,'sistemaAcademico/Pantalla_principal.html',{'usuarios':usuarios,'personas':personas,'alumnos':alumnos,'empleados':empleados})


def timeout(request):
    return render(request, 'sistemaAcademico/timeout.html')
