from django.shortcuts import render,redirect
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.urls import reverse_lazy

# Create your views here.

def base(request):
    return render(request,'base/base.html')

def inicio(request):
    return render(request,'sistemaAcademico/inicio.html')

def login(request):
    usu = ConfUsuario.objects.filter(id_genr_estado = 97)   #select * from conf_usuario where id_genr_estado = 97 (ESTADO ACTIVO)
    error = 'Usuario inactivo o credenciales incorrectas'
    var_usuario =None
    var_contra = None
    contexto = {}
    if request.method == 'POST':
            var_usuario = request.POST.get('usu')
            var_contra = request.POST.get('pass')
            for usuarios in usu:
                if usuarios.usuario == var_usuario and usuarios.clave == var_contra:
                    contexto['usuario'] = usuarios
                    return redirect('Academico:inicio')
                else:
                    contexto['error']: error
                    return redirect('Academico:login')
    return render(request,'sistemaAcademico/login.html',contexto)



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


