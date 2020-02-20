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

from .Diccionario.Estructuras_tablas_conf import ConfMenu, ConfUsuario, ConfModulo_menu,ConfPermiso



def pruebas(request):
    #permiso = ConfPermiso.objects.filter(id_usuario_rol__id_usuario=8).select_related('id_modulo_menu')
    mpss = ConfModulo_menu.objects.filter(fk_permiso_modmenu__fkrol_usuario__id_usuario__id_usuario=request.session.get('usuario')).select_related('id_menu','id_modulo')
    for p in mpss:
        print(p.id_modulo_menu)
    return render(request,'base/pruebas.html', {'menus': mpss})





def inicio(request):
    if 'usuario' in request.session:
        contexto = {}
        permiso = ConfModulo_menu.objects.filter(
            fk_permiso_modmenu__id_rol__fkrol_usuario__id_usuario=request.session.get('usuario')).select_related('id_menu','id_modulo')
        usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
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
            usu = ConfUsuario.objects.get(usuario=var_usuario,clave=h.hexdigest(),id_genr_estado=97)
            print(usu)
            if usu:
                print(usu.id_usuario)
                request.session['usuario'] = usu.id_usuario
                return redirect("Academico:inicio")
    except Exception as e:
            print(e)
            contexto['error'] = 'Claves incorrectas o cuenta inactiva'
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

