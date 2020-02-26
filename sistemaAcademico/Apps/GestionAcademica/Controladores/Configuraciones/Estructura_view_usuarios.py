import socket
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render, redirect
from django.utils import timezone
import hashlib
import os
from django.views.decorators.cache import cache_page
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from sistemaAcademico.Apps.GestionAcademica import forms
from django.views.generic import ListView, CreateView, UpdateView
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Forms.Configuracion.forms_configuraciones import UsuarioModelForm, UsuarioUsuarioRolModelForm
from django.urls import reverse


class Usuarios(ListView):
    model = ConfUsuario
    template_name = 'sistemaAcademico/Configuraciones/Menus/menu.html'
    queryset = ConfUsuario.objects.filter(id_genr_estado=97).select_related(
        'id_persona', 'id_genr_tipo_usuario')
    context_object_name = 'lista_usuarios'


def usuarios(request):
    if 'usuario' in request.session:
        usuarios = ConfUsuario.objects.filter(id_genr_estado=97).select_related(
            'id_persona', 'id_genr_tipo_usuario')
        return render(request, 'sistemaAcademico/Configuraciones/Usuarios/usuario.html', {'lista_usuarios': usuarios})


class CreateUsuario(CreateView):
    form_class = UsuarioUsuarioRolModelForm
    template_name = 'sistemaAcademico/Configuraciones/Usuarios/crear-usuario.html'
    success_url = reverse_lazy('Academico:usuarios')

    def get_context_data(self, **kwargs):
        context = super(CreateUsuario, self).get_context_data(**kwargs)
        pk = self.kwargs.get('id_usuario', 0)
        context['id_usuario'] = pk
        return context

    def post(self, request, *args, **kargs):
        self.object = self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
            usuario = form['usuario'].save()
            var_contra = usuario.clave
            h = hashlib.new("sha1")
            var_contra = str.encode(var_contra)
            h.update(var_contra)
            usuario.clave = h.hexdigest()
            usuario.save
            usuario_rol = form['usuario_rol'].save(commit=False)
            usuario_rol.id_usuario = usuario
            #usuario.usuario_rol= usuario
            usuario_rol.save()
            return redirect(self.get_success_url())

        else:
            return self.render_to_response(self.get_context_data(form=form))
    """
    def form_valid(self, form):
        usuario = form['usuario'].save()
        usuario_rol = form['usuario_rol'].save(commit=False)
        usuario_rol.id_usuario = usuario
        #usuario.usuario_rol= usuario
        usuario_rol.save()
        return HttpResponseRedirect(reverse('Academico:usuarios'))
    """


class UpdateUsuario(UpdateView):
    model = ConfUsuario
    form_class = UsuarioModelForm
    context_object_name = 'm'
    template_name = 'sistemaAcademico/Configuraciones/Usuarios/editar-usuario.html'
    success_url = reverse_lazy('Academico:usuarios')


def editar_usuario(request, id):
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
        tipo_persona = MantPersona.objects.get(
            id_persona=int(request.POST.get('persona')))
        tipo_usuario = GenrGeneral.objects.get(
            idgenr_general=int(request.POST.get('permiso')))
        roles = ConfRol.objects.get(id_rol=(int(request.POST.get('roles'))))

        usuario = ConfUsuario(id_usuario=id, usuario=var_usuario, clave=usuario.clave, id_persona=tipo_persona,
                              id_genr_tipo_usuario=tipo_usuario, id_genr_estado=estado)
        usuario.save()
        # AQUI EMPIEZA EL CODIGO DE NELIO
        # enviar_correo_usuario()

        # AQUI FINALIZA
        rol = ConfUsuario_rol(id_usuario=usuario, id_rol=roles)
        rol.save()
        return redirect('Academico:usuarios')
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/editar-usuario.html', contexto)


def eliminar_usuario(request, id):
    usuarios = ConfUsuario.objects.get(id_usuario=id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        usuarios.id_genr_estado = inactivo
        usuarios.save()
        return redirect('Academico:usuarios')
    return render(request, 'sistemaAcademico/Configuraciones/Usuarios/eliminar.html', {'usuario': usuarios})
