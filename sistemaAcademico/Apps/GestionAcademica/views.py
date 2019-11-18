from django.shortcuts import render,redirect
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.urls import reverse_lazy
import hashlib

# Create your views here.

def base(request):
    return render(request,'base/base.html')

def inicio(request):
    return render(request,'sistemaAcademico/inicio.html')

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
                contexto['usuario']=usu
                return redirect("Academico:inicio")
    return render(request,'base/login.html',contexto)



#Vistas del modulo de Configuraciones---------------------
def usuarios(request):
    return render(request,'sistemaAcademico/Configuraciones/usuarios.html')

def roles(request):
    return render(request,'sistemaAcademico/Configuraciones/roles.html')

def perfiles(request):
    return render(request,'sistemaAcademico/Configuraciones/perfiles.html')

def menu(request):
    return render(request,'sistemaAcademico/Configuraciones/menu.html')

def modulo(request):
    return render(request,'sistemaAcademico/Configuraciones/modulo.html')

def acciones(request):
    return render(request,'sistemaAcademico/Configuraciones/acciones.html')
#---------------------------------------------------------

#Vistas del modulo de Admision--------------------------------------------
def mantenimientoPersonas(request):
    return render(request,'sistemaAcademico/Admision/admision_personas.html')

def movimientos(request):
    return render(request,'sistemaAcademico/Admision/movimientos.html')

def consultas(request):
    return render(request,'sistemaAcademico/Admision/consultas.html')

def procesos(request):
    return render(request,'sistemaAcademico/Admision/procesos.html')

def reportes(request):
    return render(request,'sistemaAcademico/Admision/reportes.html')
    

#-------------------------------------------------------------------------


