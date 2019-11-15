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









