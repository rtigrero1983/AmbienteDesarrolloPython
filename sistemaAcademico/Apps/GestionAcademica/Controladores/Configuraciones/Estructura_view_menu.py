from django.db.models import Q
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect,render_to_response
from django.utils import timezone
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from django.views.generic import ListView, CreateView, UpdateView
from django.urls import reverse_lazy
import socket
from django.views.decorators.cache import cache_page
from django.core.paginator import Paginator
from dal import autocomplete
from sistemaAcademico.Apps.GestionAcademica.Forms.Configuracion.forms_configuraciones import modulo_form,menu_form


class Menu(ListView):
    model = ConfMenu
    template_name = 'sistemaAcademico/Configuraciones/Menus/menu.html'
    queryset = ConfMenu.objects.filter(id_genr_estado=97)
    context_object_name = 'menu'
    
#--------------------------------

class UpdateMenu(UpdateView):
    model = ConfMenu
    template_name = 'sistemaAcademico/Configuraciones/Menus/edit_menu.html'
    form_class = menu_form
    success_url = reverse_lazy('Academico:menu')
    context_object_name = 'm'

def editar_menu(request,id):
    contexto = {}
    mp = ConfMenu.objects.filter(url__contains='#')
    menu_actual = ConfMenu.objects.get(id_menu=id)
    contexto['lista_padre'] = mp
    contexto['permisos'] = ConfPermiso.objects.filter(id_modulo_menu__id_menu=menu_actual)
    contexto['menu_actual'] = menu_actual
    if request.method == 'POST':
        menu = ConfMenu(id_menu=id,
                        id_padre=menu_actual.id_padre,
                        orden=menu_actual.orden,
                        descripcion=request.POST.get('nom_menu'),
                        id_genr_estado=GenrGeneral.objects.get(idgenr_general=97),
                        url=request.POST.get('url'),
                        lazy_name=request.POST.get('lazyname'),
                        icono=menu_actual.icono,
                        view=request.POST.get('view')
                        )
        menu.save()
        return redirect('Academico:menu')

    return render(request, 'sistemaAcademico/Configuraciones/Menus/editar_menu.html',contexto)


#--------------------------------

def eliminar_menu(request,id):
    menu = ConfMenu.objects.get(id_menu = id)
    inactivo = GenrGeneral.objects.get(idgenr_general=98)
    if request.method == 'POST':
        menu.id_genr_estado = inactivo
        menu.save()
        return redirect('Academico:menu')
    return render(request,'sistemaAcademico/Configuraciones/Menus/eliminar_menu.html',{'menu':menu})


class CreateMenu(CreateView):
    model = ConfMenu
    form_class = menu_form
    template_name = 'sistemaAcademico/Configuraciones/Menus/agregar_menu.html'
    success_url= reverse_lazy('Academico:menu')

    def get_context_data(self, **kwargs):
        context=super(CreateMenu,self).get_context_data(**kwargs)
        pk=self.kwargs.get('id_menu',0)
        context['id_menu'] = pk
        return context


    def post(self,request,*args,**kargs):
        self.object =self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
           var_orden = 0
           c=form.save()
           lista_orden= self.model.objects.filter(id_padre=c.id_padre).order_by('-orden')[:1]
           for registro in lista_orden:
               b = int(registro.orden)
               var_orden = b+1
           c.orden = var_orden
           c.save()
           menu = ConfMenu.objects.get(descripcion=c.descripcion)
           menu_padre = ConfMenu.objects.get(id_menu=c.id_padre)
           modulo = ConfModulo.objects.get(nombre=menu_padre.descripcion)
           ConfModulo_menu.objects.create(id_modulo=modulo,id_menu=menu)
           return redirect(self.get_success_url())

        else:
           return self.render_to_response(self.get_context_data(form=form))

def nuevo_menu(request):
    try:
        mp = ConfMenu.objects.filter().values('id_menu','id_padre','descripcion')
        if request.method == 'POST':
            var_orden = 0
            lista_orden= ConfMenu.objects.filter(id_padre=request.POST.get('modulo')).order_by('-orden')[:1]
            for registro in lista_orden:
                b = int(registro.orden)
                var_orden = b+1
            obj_menu = ConfMenu.objects.get(id_menu=request.POST.get('modulo'))
            
            menu = ConfMenu.objects.create(
                                    id_padre=request.POST.get('modulo'),
                                    orden=var_orden,
                                    descripcion=request.POST.get('descripcion'),
                                    id_genr_estado=GenrGeneral.objects.get(idgenr_general=97),
                                    url=request.POST.get('url'),
                                    icono=obj_menu.icono,
                                    lazy_name=request.POST.get('lazyname'),
                                    name=request.POST.get('name'),
                                    view=request.POST.get('view')
                                    )
            ConfModulo_menu.objects.create(
                                            id_modulo=ConfModulo.objects.get(nombre=obj_menu.descripcion),
                                            id_menu = menu,
                                            id_genr_estado=GenrGeneral.objects.get(idgenr_general=97)
                                          )

            return redirect('Academico:menu')



    except Exception as e:
        raise e
    
    return render(request,'sistemaAcademico/Configuraciones/Menus/add_menu.html',{'menu_padre':mp})










