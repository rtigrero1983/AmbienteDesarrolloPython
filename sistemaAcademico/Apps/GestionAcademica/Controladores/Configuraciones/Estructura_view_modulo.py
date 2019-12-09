from django.http import HttpResponseRedirect
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
        return HttpResponseRedirect('../')


def nuevo_modulo(request):
    if request.method == 'POST':
        var_codigo = request.POST.get('Codigo')
        var_nombre = request.POST.get('nombre')
        activo = GenrGeneral.objects.get(idgenr_general=97)
        modulo = ConfModulo(codigo=var_codigo,nombre=var_nombre,id_genr_estado=activo)
        modulo.save()
        return redirect('Academico:modulo')

    return render(request,'sistemaAcademico/Configuraciones/Modulos/add_modulo.html')