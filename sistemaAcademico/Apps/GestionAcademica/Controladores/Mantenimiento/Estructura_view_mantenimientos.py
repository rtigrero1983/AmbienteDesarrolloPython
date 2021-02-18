import socket

from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.utils import timezone
from django.views.generic import CreateView, ListView, UpdateView

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Forms.Admision.forms_mantenimientos import *


class Empleado(ListView):
    model = MantPersona
    context_object_name = 'empleado'
    template_name = 'sistemaAcademico/Admision/Mantenimiento/admision_personas.html'
    def get_queryset(self):
        return self.model.objects.filter(Q(estado=97),
                                    Q(id_genr_tipo_usuario=20) |
                                    Q(id_genr_tipo_usuario=21)
                                    ).select_related('id_genr_tipo_usuario')

    def get_context_data(self,**kwargs):
        contexto = {}
        contexto['empleado'] = self.get_queryset()
        return contexto

    def get(self, request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request, self.template_name, self.get_context_data())
        else:
            return HttpResponseRedirect('timeout/')


class Estudiante(ListView):
    model = MantPersona
    context_object_name = 'mantenimiento'
    template_name = 'sistemaAcademico/Admision/Mantenimiento/Estudiante.html'

    def get_context_data(self,**kwargs):
        context = {}
        queryset = self.model.objects.filter(estado=97, id_genr_tipo_usuario=19).select_related('id_genr_tipo_usuario').values(
        'id_persona', 'nombres',
        'apellidos',
        'identificacion')
        lista=[]
        for i in queryset.values():
            newDict={}
            try:
                usuarioTemp = UsuarioTemp.objects.get(id_persona=i['id_persona'])
                newDict = {'val':True}
                newDict.update(i)
                lista.append(newDict)

            except UsuarioTemp.DoesNotExist:
                newDict = {'val':False}
                newDict.update(i)
                lista.append(newDict)
                continue
            newDict={}


        context['mantenimiento']=lista
        return context
    def get(self,request, *args, **kwargs):
        if 'usuario' in request.session:
            return render(request,self.template_name,self.get_context_data())
        else:
            return redirect('Academico:timeout')


class NuevoEmpleado(CreateView):
    model = MantPersona
    form_class = EmpleadoForm
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_reg_empleado.html'
    success_url = reverse_lazy('Academico:empleado')

    def get_context_data(self, **kwargs):
        context = super(NuevoEmpleado, self).get_context_data(**kwargs)
        pk = self.kwargs.get('id_persona', 0)
        context['id_persona'] = pk
        if 'form' not in context:
            context['form'] = self.form_class(self.request.GET)
        return context

    def post(self, request, *args, **kwargs):
        self.object = self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
            empleado = form.save()
            usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
            empleado.estado = GenrGeneral.objects.get(idgenr_general=97)
            empleado.fecha_ingreso = timezone.now()
            empleado.usuario_ing = usuario.usuario
            empleado.terminal_ing = socket.gethostname()
            id_anio_lectivo = MantAnioLectivo.objects.get(id_genr_estado=97)
            id_empleado = MantPersona.objects.get(id_persona=empleado.id_persona)
            empleado_model = MantEmpleado(id_persona=id_empleado, id_anio_lectivo=id_anio_lectivo,
                                          terminal_ing=socket.gethostname(), usuario_ing=usuario.usuario,
                                          fecha_ingreso=timezone.now())
            empleado_model.save()
            movMateria = Mov_Materia_profesor(
                id_empleado=MantEmpleado.objects.get(id_persona=empleado_model.id_persona))
            movMateria.save()
            form.save()
            return HttpResponseRedirect(self.get_success_url())
        else:
            return self.render_to_response(self.get_context_data(form=form))


class UpdateEmpleado(UpdateView):
    model = MantPersona
    form_class = EditarEmpleadoForm
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_edit_empleado.html'
    success_url = reverse_lazy('Academico:empleado')
    context_object_name = 'e'


class ConsultarEmpleado(UpdateView):
    model = MantPersona
    form_class = ConsultarEmpleadoForm
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_consultar_empleado.html'
    context_object_name = 'm'


def eliminar_empleado(request, id):
    if 'usuario' in request.session:
        empleados = MantPersona.objects.get(id_persona=id)
        inactivo = GenrGeneral.objects.get(idgenr_general=98)
        if request.method == 'POST':
            empleados.estado = inactivo
            empleados.save()
            return redirect('Academico:empleado')
        return render(request, 'sistemaAcademico/Admision/Mantenimiento/form_eliminar_empleado.html',
                    {'empleado': empleados})
    else:
        return redirect('Academico:timeout')

class NuevoEstudiante(CreateView):
    model = MantPersona
    form_class = EstudianteForm
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_reg_estudiante.html'
    success_url = reverse_lazy('Academico:estudiante')

    def get_context_data(self, **kwargs):
        context = super(NuevoEstudiante, self).get_context_data(**kwargs)
        pk = self.kwargs.get('id_persona', 0)
        context['id_persona'] = pk
        if 'form' not in context:
            context['form'] = self.form_class(self.request.GET)
        return context

    def post(self, request, *args, **kwargs):
        self.object = self.get_object
        form = self.form_class(request.POST)
        if form.is_valid():
            estudiante = form.save()
            usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
            estudiante.fecha_ingreso = timezone.now()
            estudiante.usuario_ing = usuario.usuario
            estudiante.terminal_ing = socket.gethostname()
            id_persona = MantPersona.objects.get(id_persona=estudiante.id_persona)
            estudiante_model = MantEstudiante(id_persona=id_persona, fecha_ingreso=timezone.now(),
                                              tipo_estudiante='Asignado', usuario_ing=usuario.usuario,
                                              terminal_ing=socket.gethostname())
            estudiante_model.save()
            form.save()
            return HttpResponseRedirect(self.get_success_url())
        else:
            return self.render_to_response(self.get_context_data(form=form))


class ConsultarEstudiante(UpdateView):
    model = MantPersona
    form_class = ConsultarEstudianteForm
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_consultar_estudiante.html'
    context_object_name = 'm'

    def get_context_data(self, **kwargs):
        context = super(ConsultarEstudiante, self).get_context_data(**kwargs)
        id_persona = context['m'].id_persona
        persona = MantEstudiante.objects.get(id_persona=id_persona)
        id_estudiante = persona.id_estudiante
        c_estudiante = MovMatriculacionEstudiante.objects.get(id_estudiante=id_estudiante)
        curso_estudiante = MovCabCurso.objects.get(id_curso=c_estudiante.id_mov_anioelectivo_curso.id_curso.nombre)
        paralelo_estudiante = GenrGeneral.objects.get(
            nombre=c_estudiante.id_mov_anioelectivo_curso.id_genr_paralelo.nombre)
        jornada_estudiante = GenrGeneral.objects.get(
            nombre=c_estudiante.id_mov_anioelectivo_curso.id_curso.id_genr_jornada.nombre)
        context['curso_estudiante'] = curso_estudiante
        context['paralelo_estudiante'] = paralelo_estudiante
        context['jornada_estudiante'] = jornada_estudiante
        return context


class UpdateEstudiante(UpdateView):
    model = MantPersona
    second_model = MovMatriculacionEstudiante
    form_class = EstudianteEditForm
    template_name = 'sistemaAcademico/Admision/Mantenimiento/form_edit_estudiante.html'
    success_url = reverse_lazy('Academico:estudiante')
    context_object_name = 'm'

    def get_context_data(self, **kwargs):
        context = super(UpdateEstudiante, self).get_context_data(**kwargs)
        id_persona = context['m'].id_persona
        persona = MantEstudiante.objects.get(id_persona=id_persona)
        id_estudiante = persona.id_estudiante
        c_estudiante = MovMatriculacionEstudiante.objects.get(id_estudiante=id_estudiante)
        curso_estudiante = MovCabCurso.objects.get(id_curso=c_estudiante.id_mov_anioelectivo_curso.id_curso.nombre)
        paralelo_estudiante = GenrGeneral.objects.get(
            nombre=c_estudiante.id_mov_anioelectivo_curso.id_genr_paralelo.nombre)
        jornada_estudiante = GenrGeneral.objects.get(
            nombre=c_estudiante.id_mov_anioelectivo_curso.id_curso.id_genr_jornada.nombre)
        context['curso_estudiante'] = curso_estudiante
        context['paralelo_estudiante'] = paralelo_estudiante
        context['jornada_estudiante'] = jornada_estudiante
        return context


class DatosEstudiante(UpdateView):
    model = MovMatriculacionEstudiante
    form_class = Editarste
    queryset = MantPersona.objects.all()
    template_name = 'sistemaAcademico/Admision/Mantenimiento/datos_estudiante_htmldepruebas.html'
    success_url = reverse_lazy('Academico:estudiante')
    context_object_name = 's'


def eliminar_estudiante(request, id):
    if 'usuario' in request.session:
        estudiantes = MantPersona.objects.get(id_persona=id)
        inactivo = GenrGeneral.objects.get(idgenr_general=98)
        if request.method == 'POST':
            estudiantes.estado = inactivo
            estudiantes.save()
            return redirect('Academico:estudiante')
        return render(request, 'sistemaAcademico/Admision/Mantenimiento/form_eliminar_estudiante.html',
                    {'estudiante': estudiantes})
    return redirect('Academico:timeout')