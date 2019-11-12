from django.shortcuts import render,redirect
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from django.views.generic import View,TemplateView,ListView,UpdateView,CreateView,DeleteView
from django.urls import reverse_lazy

# Create your views here.

def inicio(request):
    return render(request,'base/base.html')







