import socket
from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import hashlib
from django.core.paginator import Paginator



def base(request):
    return render(request,'base/base.html')

def inicio(request):
    if 'usuario' in request.session:
        return render(request, 'sistemaAcademico/inicio.html', {'usu':request.session.get('usuario')})
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------
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

def usuarios(request):
    if 'usuario' in request.session:
        usuarios = ConfUsuario.objects.filter(id_genr_estado=97)

        return render(request,'sistemaAcademico/Configuraciones/Usuarios/usuario.html',{'lista_usuarios':usuarios})
    else:
        return HttpResponseRedirect('../')



def roles(request):
    if 'usuario' in request.session:
        roles= ConfRol.objects.all()
        # ---crea la paginacion de las tablas
        paginator = Paginator(roles, 5)
        page = request.GET.get('page')
        lista_roles = paginator.get_page(page)
        return render(request,'sistemaAcademico/Configuraciones/Roles/rol.html', {'lista_roles': lista_roles})
    else:
        return HttpResponseRedirect('../')



def perfiles(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        permiso=ConfPermiso.objects.filter(id_genr_estado=97)
        return render(request,'sistemaAcademico/Configuraciones/Permisos/permisos.html',{'permiso': permiso})
    else:
        return HttpResponseRedirect('../')





def menu(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    contexto = {}
    if 'usuario' in request.session:

            menu = ConfMenu.objects.filter(id_genr_estado = 97)
            contexto['menu'] = menu
            return render(request, 'sistemaAcademico/Configuraciones/Menus/menu.html',contexto)
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def modulo(request):
    if 'usuario' in request.session:
        modulos= ConfModulo.objects.filter(id_genr_estado=97)
        return render(request,'sistemaAcademico/Configuraciones/Modulos/modulo.html',{'modulos':modulos})
    else:
        return HttpResponseRedirect('../')


def acciones(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Configuraciones/acciones.html')
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------

#Modulo de Mantenimiento -----------------------------------
def empresas(request):
    if 'usuario' in request.session:
        lista_empresa= ConfEmpresa.objects.filter(id_genr_estado=97)
        return render(request,'sistemaAcademico/Configuraciones/Empresas/empresa.html', {'lista_empresa': lista_empresa})
    else:
        return HttpResponseRedirect('../')
#---------------------------------------------------------

#------------------------Vistas del modulo de Admision--------------------------------------------
def mantenimientoPersonas(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/admision_personas.html')
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def movimientos(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/movimientos.html')
    else:
        return HttpResponseRedirect('../')



def consultas(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/consultas.html')
    else:
        return HttpResponseRedirect('../')



def procesos(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/procesos.html')
    else:
        return HttpResponseRedirect('../')



def reportes(request):

    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/reportes.html')
    else:
        return HttpResponseRedirect('../')

#-------------------------------------------------------------------------------------------




#-------------------------crear y editar ------------------------------------

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

def editar_empresa(request, id):
    empresa = ConfEmpresa.objects.get(id_empresa=id)
    var_tip_ident = GenrGeneral.objects.filter(tipo='TID')
    contexto = {}
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
                empresa = ConfEmpresa(id_empresa=id, nombre=var_empresa_nombre, razon_social=var_rsocial,
                                      id_genr_tipo_identificacion=var_tip_ident, identificacion=var_ident,
                                      direccion=direccion, representante_legal=representante_legal, correo=correo,
                                      telefono=telefono, fecha_creacion=fecha_creacion, id_genr_estado=estado)
                empresa.save()
                return redirect('Academico:empresas')
    return render(request, 'sistemaAcademico/Configuraciones/Empresas/Editar_empresa.html', contexto)

def eliminar_empresa(request, id):
    empresas = ConfEmpresa.objects.get(id_empresa=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        empresas.id_genr_estado = inactivo
        empresas.save()
        return redirect('Academico:empresas')
    return render(request, 'sistemaAcademico/Configuraciones/Empresas/eliminar.html', {'menu': empresas})


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
                usuario = ConfUsuario(usuario=var_usuario, clave=h.hexdigest(), id_persona=tipo_persona,
                                      id_genr_tipo_usuario=tipo_usuario, id_rol=rol, id_genr_estado=estado)
                usuario.save()
                return redirect('Academico:usuarios')
            else:
                contexto['error'] = 'No se pudo encontrar el usuario'

        return render(request, 'sistemaAcademico/Configuraciones/Usuarios/crear-usuario.html',contexto)
    else:
        return HttpResponseRedirect('../')


def editar_usuario(request, id):
    usuario = ConfUsuario.objects.get(id_usuario=id)
    permiso = GenrGeneral.objects.filter(tipo='TUS')
    personas = MantPersona.objects.all()
    contexto = {}
    roles = ConfRol.objects.all()
    contexto['roles'] = roles
    contexto['usuario'] = usuario
    contexto['permiso'] = permiso
    contexto['lista_personas'] = personas
    estado = GenrGeneral.objects.get(idgenr_general=97)
    idconf_usuario_rol = GenrGeneral(ConfUsuario_rol.objects.filter(id_usuario=usuario))

    if request.method == 'POST':
        usuario = ConfUsuario(usuario=usuario, id_genr_estado=estado,
                              id_genr_tipo_usuario=idconf_usuario_rol)
        usuario.save()

        return redirect('Academico:usuarios')

    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/editar-usuario.html', contexto)


def nuevo_modulo(request):
    if request.method == 'POST':
        var_codigo = request.POST.get('Codigo')
        var_nombre = request.POST.get('nombre')
        activo = GenrGeneral.objects.get(idgenr_general=97)
        modulo = ConfModulo(codigo=var_codigo, nombre=var_nombre, id_genr_estado=activo)
        modulo.save()
        return redirect('Academico:modulo')

    return render(request, 'sistemaAcademico/Configuraciones/Modulos/add_modulo.html')
    

def nuevo_rol(request):
    return render(request, 'sistemaAcademico/Configuraciones/Roles/add_rol.html')

def editar_rol(request):
    return render(request, 'sistemaAcademico/Configuraciones/Roles/editar_rol.html')

def nuevo_menu(request):
    contexto = {}
    modulos = ConfModulo.objects.all()
    contexto['modulos'] = modulos
    lista_padre = ConfMenu.objects.filter(id_padre=0)
    contexto['lista_padre'] = lista_padre
    if request.method == 'POST':
        var_menu_padre = request.POST.get('num_padre')
        var_orden = request.POST.get('orden')
        var_modulo = ConfModulo.objects.get(id_modulo=int(request.POST.get('modulo')))
        estado = GenrGeneral.objects.get(idgenr_general=97)
        var_nombre = request.POST.get('nom_menu')
        var_url = request.POST.get('url')
        menu = ConfMenu(id_modulo=var_modulo, id_padre=var_menu_padre, orden=var_orden,
                        descripcion=var_nombre, id_genr_estado=estado, url=var_url)
        menu.save()
        return redirect('Academico:menu')
    return render(request, 'sistemaAcademico/Configuraciones/Menus/add_menu.html', contexto)

def editar_menu(request,id):
    contexto = {}
    modulos = ConfModulo.objects.all()
    lista_padre = ConfMenu.objects.filter(id_padre=0)
    contexto['lista_padre'] = lista_padre
    contexto['modulos'] = modulos
    menu_actual = ConfMenu.objects.get(id_menu = id)
    contexto['menu_actual'] = menu_actual

    if request.method == 'POST':
        var_menu_padre = request.POST.get('num_padre')
        var_orden = request.POST.get('orden')
        var_modulo = ConfModulo.objects.get(id_modulo=int(request.POST.get('modulo')))
        estado = GenrGeneral.objects.get(idgenr_general=97)
        var_nombre = request.POST.get('nom_menu')
        var_icono = request.POST.get('icono')
        var_url = request.POST.get('url')
        menu = ConfMenu(id_menu=id, id_modulo=var_modulo, id_padre=var_menu_padre,
                        orden=var_orden, descripcion=var_nombre, id_genr_estado=estado,
                        url=var_url, icono=var_icono)
        menu.save()
        return redirect('Academico:menu')

    return render(request, 'sistemaAcademico/Configuraciones/Menus/editar_menu.html',contexto)

def eliminar_menu(request,id):
    menu = ConfMenu.objects.get(id_menu = id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        menu.id_genr_estado = inactivo
        menu.save()
        return redirect('Academico:menu')
    return render(request, 'sistemaAcademico/Configuraciones/Menus/eliminar_menu.html', {'menu': menu})
def add_permiso(request):
    if 'usuario' in request.session:
        contexto={}
        menu = ConfMenu.objects.filter(id_genr_estado=97)
        modulo = ConfModulo.objects.filter(id_genr_estado=97)
        estado = GenrGeneral.objects.filter(tipo='STA')
        contexto['modulo'] = modulo
        contexto['estado'] = estado
        contexto['menu'] = menu
        if request.method == 'POST':
            menu = ConfMenu.objects.get(id_menu=int(request.POST.get('menu')))
            #var_usuario = request.POST.get('usuario')
            modulo = ConfModulo.objects.get(id_modulo=int(request.POST.get('modulo')))
            permiso = GenrGeneral.objects.get(idgenr_general=int(request.POST.get('estado')))
            guardar_pemiso = ConfPermiso(id_menu=menu, id_modulo=modulo, id_genr_estado=permiso)
            guardar_pemiso.save()
            return redirect('Academico:perfiles')

        return render(request, 'sistemaAcademico/Configuraciones/Permisos/add_permisos.html', contexto)
    else:
        return HttpResponseRedirect('../')


def editar_permiso(request,id):
    contexto={}
    modulo = ConfModulo.objects.filter(id_genr_estado=97)
    estado = GenrGeneral.objects.filter(tipo='STA')
    menu = ConfMenu.objects.all()
    contexto['modulo'] = modulo
    contexto['estado'] = estado
    contexto['menu']=menu
    permiso = ConfPermiso.objects.all()
    contexto['permiso'] = permiso
    if request.method == 'POST':
        menu = ConfMenu.objects.get(id_menu=int(request.POST.get('menu')))
        modulo = ConfModulo.objects.get(id_modulo=int(request.POST.get('modulo')))
        est = GenrGeneral.objects.get(idgenr_general=int(request.POST.get('estado')))
        print(menu)
        guardar_pemiso = ConfPermiso(id_permiso=id, id_menu=menu, id_modulo=modulo, id_genr_estado=est)
        guardar_pemiso.save(force_update=True)
        return redirect('Academico:perfiles')


    return render (request,'sistemaAcademico/Configuraciones/Permisos/editar_permiso.html',contexto)
