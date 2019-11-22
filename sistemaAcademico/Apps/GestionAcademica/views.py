from django.http import HttpResponseRedirect
from django.shortcuts import render,redirect
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.urls import reverse_lazy
import hashlib

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
    var_usuario = None
    var_contra = None
    contexto = {}
    if request.method == 'POST':
            var_usuario = request.POST.get('usu')
            var_contra = request.POST.get('pass')
            h = hashlib.new("sha1")
            var_contra = str.encode(var_contra)
            h.update(var_contra)
            usu = ConfUsuario.objects.filter(usuario=var_usuario,clave=h.hexdigest(), id_genr_estado=97)

            # select * from conf_usuario where id_genr_estado = 97 (ESTADO ACTIVO)
            if usu:
                contexto ['usuario_logeado']= usu
                request.session['usuario'] = "usuario"
                return redirect("Academico:inicio")
            else:
                contexto['error']= "Credenciales incorrectas o esta cuenta esta inactiva"
                print(contexto)
    return render(request,'base/login.html',contexto)


#Vistas del modulo de Configuraciones---------------------
def usuarios(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        usuarios= ConfUsuario.objects.all()
        return render(request,'sistemaAcademico/Configuraciones/Usuarios/usuario.html', {'usuarios':usuarios})
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def roles(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        roles= ConfRol.objects.all()
        return render(request,'sistemaAcademico/Configuraciones/Roles/rol.html', {'roles': roles})
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
    if 'usuario' in request.session:
        menus = ConfMenu.objects.all()
        return render(request,'sistemaAcademico/Configuraciones/Menus/menu.html', {'menus':menus})
    else:
        return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def modulo(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    if 'usuario' in request.session:
        modulos= ConfModulo.objects.all()
        return render(request,'sistemaAcademico/Configuraciones/Modulos/modulo.html', {'modulos': modulos})
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
        empresas= ConfEmpresa.objects.all()
        return render(request,'sistemaAcademico/Configuraciones/Empresas/empresa.html', {'empresas': empresas})
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
    return render(request, 'sistemaAcademico/Configuraciones/Empresas/add_empresa.html')

def editar_empresa(request):
    return render(request, 'sistemaAcademico/Configuraciones/Empresas/editar_empresa.html')

def nuevo_usuario(request):
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/crear-usuario.html')

def editar_usuario(request):
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/editar-usuario.html')

def nuevo_rol(request):
    return render(request, 'sistemaAcademico/Configuraciones/Roles/add_rol.html')

def editar_rol(request):
    return render(request, 'sistemaAcademico/Configuraciones/Roles/editar_rol.html')