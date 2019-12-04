from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.urls import reverse_lazy
import hashlib
from django.core.paginator import Paginator

# Create your views here.

def base(request):
    return render(request,'base/base.html')

def inicio(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
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
            # select * from conf_usuario where id_genr_estado = 97 (ESTADO ACTIVO)
            if usu:
                contexto['usuario_logeado']= usu
                request.session['usuario'] = usu.id_usuario
                return redirect("Academico:inicio")

            else:
                contexto['error']= "Credenciales incorrectas o esta cuenta esta inactiva"
                print(h.hexdigest())

    return render(request,'base/login.html',contexto)


#Vistas del modulo de Configuraciones---------------------
def usuarios(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        usuarios = ConfUsuario.objects.all()
        # ---crea la paginacion de las tablas
        paginator = Paginator(usuarios, 5)
        page = request.GET.get('page')
        lista_usuarios = paginator.get_page(page)
        return render(request,'sistemaAcademico/Configuraciones/Usuarios/usuario.html', {'lista_usuarios':lista_usuarios})
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------



def roles(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        roles= ConfRol.objects.all()
        # ---crea la paginacion de las tablas
        paginator = Paginator(roles, 5)
        page = request.GET.get('page')
        lista_roles = paginator.get_page(page)
        return render(request,'sistemaAcademico/Configuraciones/Roles/rol.html', {'lista_roles': lista_roles})
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def perfiles(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Configuraciones/perfiles.html')
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------




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
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        modulos= ConfModulo.objects.all()
        # ---crea la paginacion de las tablas
        paginator = Paginator(modulos, 5)
        page = request.GET.get('page')
        lista_modulos= paginator.get_page(page)
        return render(request,'sistemaAcademico/Configuraciones/Modulos/modulo.html', {'lista_modulos': lista_modulos})
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


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
        empresas= ConfEmpresa.objects.filter(id_genr_estado=97)
        # ---crea la paginacion de las tablas
        paginator = Paginator(empresas, 10)
        page = request.GET.get('page')
        lista_empresa = paginator.get_page(page)
        return render(request,'sistemaAcademico/Configuraciones/Empresas/empresa.html', {'lista_empresa': lista_empresa})
    else:
        return HttpResponseRedirect('../')
#---------------------------------------------------------

#------------------------Vistas del modulo de Admision--------------------------------------------
def mantenimientoPersonas(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/admision_personas.html')
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def movimientos(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/movimientos.html')
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def consultas(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/consultas.html')
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def procesos(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/procesos.html')
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def reportes(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Admision/reportes.html')
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------
#-------------------------------------------------------------------------------------------



#-------------------------Salir de la sesion------------------------------------------------
def salir(request):
    del request.session['usuario']
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
            correo = request.POST.get('inputEmail3')
            telefono = request.POST.get('telefono')
            fecha_creacion = request.POST.get('f_creacion')
            var_estado = GenrGeneral.objects.get(idgenr_general=(int(request.POST.get('estado'))))
            empresa = ConfEmpresa(nombre=var_empresa_nombre, razon_social=var_rsocial,
                                  id_genr_tipo_identificacion=var_tip_ident, identificacion=var_ident,
                                  direccion=direccion, representante_legal=representante_legal, correo=correo,
                                  telefono=telefono, fecha_creacion=fecha_creacion,id_genr_estado=var_estado)
            empresa.save()
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
                usuario = ConfUsuario(usuario=var_usuario,clave=h.hexdigest(),id_persona=tipo_persona,id_genr_tipo_usuario=tipo_usuario,id_rol=rol,id_genr_estado=estado)
                usuario.save()
                return redirect('Academico:usuarios')
            else:
                contexto['error'] = 'No se pudo encontrar el usuario'

        return render(request, 'sistemaAcademico/Configuraciones/Usuarios/crear-usuario.html',contexto)
    else:
        return HttpResponseRedirect('../')

def editar_usuario(request):
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/editar-usuario.html')

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
        menu = ConfMenu(id_modulo=var_modulo,id_padre=var_menu_padre,orden=var_orden,descripcion=var_nombre,id_genr_estado=estado,url=var_url)
        menu.save()
        return redirect('Academico:menu')
    return render(request, 'sistemaAcademico/Configuraciones/Menus/add_menu.html',contexto)




def editar_menu(request,id):
    contexto = {}
    modulos = ConfModulo.objects.all()
    lista_padre = ConfMenu.objects.filter(id_padre=0)
    contexto['lista_padre'] = lista_padre
    contexto['modulos'] = modulos
    if request.method == 'GET':
        menu_actual= ConfMenu.objects.get(id_menu = id)
        contexto['menu_actual'] = menu_actual

    if request.method == 'POST':
        var_menu_padre = request.POST.get('num_padre')
        var_orden = request.POST.get('orden')
        var_modulo = ConfModulo.objects.get(id_modulo=int(request.POST.get('modulo')))
        estado = GenrGeneral.objects.get(idgenr_general=97)
        var_nombre = request.POST.get('nom_menu')
        var_url = request.POST.get('url')
        menu = ConfMenu(id_modulo=var_modulo,id_padre=var_menu_padre,orden=var_orden,descripcion=var_nombre,id_genr_estado=estado,url=var_url)
        menu.save()
    return render(request, 'sistemaAcademico/Configuraciones/Menus/editar_menu.html',contexto)