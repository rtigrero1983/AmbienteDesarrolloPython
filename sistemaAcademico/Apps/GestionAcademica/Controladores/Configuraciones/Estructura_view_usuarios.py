import socket
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
import hashlib
import os
from django.views.decorators.cache import cache_page
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from sistemaAcademico.Apps.GestionAcademica import forms
from django.views.generic import ListView,CreateView,UpdateView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Configuracion.forms_configuraciones import UsuarioForm


class Usuarios(ListView):
    model = ConfMenu
    template_name = 'sistemaAcademico/Configuraciones/Menus/menu.html'
    queryset = ConfMenu.objects.filter(id_genr_estado=97)
    context_object_name = 'menu'

def usuarios(request):
    if 'usuario' in request.session:
        usuarios = ConfUsuario.objects.filter(id_genr_estado=97).select_related('id_persona','id_genr_tipo_usuario')
        return render(request, 'sistemaAcademico/Configuraciones/Usuarios/usuario.html', {'lista_usuarios': usuarios})


class CreateUsuario(CreateView):
    model = ConfUsuario
    form_class = UsuarioForm
    template_name = 'sistemaAcademico/Configuraciones/Usuarios/crear-usuario.html'
    success_url= reverse_lazy('Academico:usuarios')

    def get_context_data(self, **kwargs):
        context=super(CreateUsuario,self).get_context_data(**kwargs)
        pk=self.kwargs.get('id_usuario',0)
        context['id_usuario'] = pk
        return context


    def post(self,request,*args,**kargs):
        self.object =self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
           c=form.save()
           lista_orden= self.model.objects.filter(tipo=c.tipo).order_by('-orden')[:1]
           for registro in lista_orden:
               b = int(registro.orden)
               var_orden = b+1
           c.orden = var_orden
           c.save(commit=False)
           return redirect(self.get_success_url())
        else:
           return self.render_to_response(self.get_context_data(form=form))



def nuevo_usuario(request):
	error = None
	if(request.method == "POST"):
		form = forms.UsuarioForm(request.POST)
		if(form.is_valid()):
			form.save()
			return redirect("Academico:usuarios")
		else:
			error = "No se pudo Guardar el formulario"
	else:
		form = forms.UsuarioForm()
	return render(request, 'sistemaAcademico/Configuraciones/Usuarios/crear-usuario.html', {"form":form , "error":error})

def editar_usuario(request,id):
    usuario = ConfUsuario.objects.get(id_usuario=id)
    permiso = GenrGeneral.objects.filter(tipo='TUS').values()
    personas = MantPersona.objects.all().values()
    roles = ConfRol.objects.all().values()
    contexto = {}
    contexto['roles'] = roles
    contexto['usuario'] = usuario
    contexto['permiso'] = permiso
    contexto['lista_personas'] = personas
    estado = GenrGeneral.objects.get(idgenr_general=97)
    if request.method == 'POST':
        var_usuario = request.POST.get('usuario')
        tipo_persona = MantPersona.objects.get(id_persona=int(request.POST.get('persona')))
        tipo_usuario = GenrGeneral.objects.get(idgenr_general=int(request.POST.get('permiso')))
        roles = ConfRol.objects.get(id_rol=(int(request.POST.get('roles'))))

        usuario=ConfUsuario(id_usuario=id, usuario=var_usuario, clave=usuario.clave,id_persona=tipo_persona,
                                    id_genr_tipo_usuario=tipo_usuario,id_genr_estado=estado)
        usuario.save()


        rol=ConfUsuario_rol(id_usuario=usuario, id_rol=roles)

        rol.save()

        return redirect('Academico:usuarios')
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/editar-usuario.html', contexto)



def eliminar_usuario(request,id):
    usuarios = ConfUsuario.objects.get(id_usuario=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        usuarios.id_genr_estado = inactivo
        usuarios.save()
        return redirect('Academico:usuarios')
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/eliminar.html', {'usuario': usuarios})