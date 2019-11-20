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
        usu = ConfUsuario.objects.filter(usuario=var_usuario, clave=h.hexdigest(), id_genr_estado=97)

        # select * from conf_usuario where id_genr_estado = 97 (ESTADO ACTIVO)
        if usu:

            contexto['usuario_logeado'] = usu
            request.session['usuario'] = usu
            return redirect("Academico:inicio")
        else:
            contexto['error'] = "Credenciales incorrectas o esta cuenta esta inactiva"
            print(contexto)
    return render(request,'base/login.html'),#contexto)


#Vistas del modulo de Configuraciones---------------------

#PRINCIPALES
def lista_us(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
   # if 'usuario' in request.session:
        # lista los usuarios en una tabla
            usuarios = ConfUsuario.objects.all()
            return render(request, 'sistemaAcademico/Configuraciones/Usuarios/usuario.html', {'usuarios': usuarios})
   # else:
    #    return HttpResponseRedirect('../')
    #----------------------------------------------------------------


    #----------------------------------------------------------------

def lista_permisos(request):
    # lista los registros de permisos
    permisos = ConfPermiso.objects.all()
    return render(request, 'sistemaAcademico/Configuraciones/Permisos/permisos.html', {'permisos': permisos})

 #----------------------------------------------------------------

def lista_em(request):
   # lista los registros de empresas
    empresas = ConfEmpresa.objects.all()
    return render(request, 'sistemaAcademico/Configuraciones/Empresas/empresa.html', {'empresas': empresas})


# ----------------------------------------------------------------

def perfiles(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    #if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Configuraciones/perfiles.html')
    #else:
     #   return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def lista_menus(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    #if 'usuario' in request.session:
      #lista los registros de menu en una tabla
            menus = ConfMenu.objects.all()
            return render(request, 'sistemaAcademico/Configuraciones/Menus/menu.html', {'menus': menus})
    #else:
     #   return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def lista_modulos(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    #if 'usuario' in request.session:
         # lista los registros de modulos en una tabla
            modulos = ConfModulo.objects.all()
            return render(request, 'sistemaAcademico/Configuraciones/Modulos/modulo.html', {'modulos': modulos})
    #else:
     #   return HttpResponseRedirect('../')
    #----------------------------------------------------------------


def acciones(request):
    #-----Valida si la sesion sigue activa sino regresa al login.html
    #if 'usuario' in request.session:
        return render(request,'sistemaAcademico/Configuraciones/acciones.html')
    #else:
     #   return HttpResponseRedirect('../')
    #----------------------------------------------------------------



#FORMULARIOS DE REGISTRO
def addempresa(request):
    return render(request, 'sistemaAcademico/Configuraciones/Empresas/add_empresa.html')

def addrol(request):
    return render(request, 'sistemaAcademico/Configuraciones/Roles/add_rol.html')

def addusuario(request):
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/crear-usuario.html')

#---------------------------------------------------------
# formularios de edicion
def editar_usuario(request):
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/editar-usuario.html')



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

