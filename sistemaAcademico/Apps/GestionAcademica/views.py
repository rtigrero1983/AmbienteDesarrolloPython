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
        return render(request, 'sistemaAcademico/inicio.html', {'usu':request.session.get('usuario')})
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

















