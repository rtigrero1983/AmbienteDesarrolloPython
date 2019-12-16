from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
import socket

def modulo(request):
    if 'usuario' in request.session:
        modulos= ConfModulo.objects.filter(id_genr_estado=97)
        return render(request,'sistemaAcademico/Configuraciones/Modulos/modulo.html',{'modulos':modulos})
    else:
        return HttpResponse('<center><h1>su session ha caducado</h1></center>')


def nuevo_modulo(request):
    if request.method == 'POST':
        var_codigo = request.POST.get('Codigo')
        var_nombre = request.POST.get('nombre')
        activo = GenrGeneral.objects.get(idgenr_general=97)
        modulo = ConfModulo.objects.create(codigo=var_codigo,nombre=var_nombre,id_genr_estado=activo)
        return redirect('Academico:modulo')

    return render(request,'sistemaAcademico/Configuraciones/Modulos/add_modulo.html')

def editar_modulo(request,id):
    modulo = ConfModulo.objects.get(id_modulo=id);
    contexto = {}
    contexto['modulo'] =  modulo
    if request.method == 'POST':
        var_codigo = request.POST.get('codigo')
        var_nombre = request.POST.get('nom_modulo')


    return render(request,'sistemaAcademico/Configuraciones/Modulos/editar_modulo.html',contexto)

def eliminar_modulo(request,id):
    return render(request,'sistemaAcademico/Configuraciones/Modulos/eliminar_modulo.html')