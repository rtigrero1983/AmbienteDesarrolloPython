from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleRegistroNotas,Mov_Materia_profesor,MovMatriculacionEstudiante,MovDetalleMateriaCurso
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import ConfUsuario
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_registro_notas import Registro_notas_form
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantEmpleado,MantPersona
from django.urls import reverse_lazy
from django.shortcuts import render, redirect, get_object_or_404

class List_Notas (ListView):
    model = MovDetalleRegistroNotas
    template_name = 'sistemaAcademico/Matriculacion/RegistroNotas/RegistroNotas.html'
    context_object_name = 'm'
    
    def get(self, request):
        context = {}
        materias = []
        
        if 'usuario' in request.session:
            usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
            if usuario:
                tipo = usuario.id_genr_tipo_usuario.codigo
                if tipo == 'ADM':
                    queryset = self.model.objects.all()
                    context['object_list'] = queryset  

                elif tipo =='PRO':
                    persona = MantPersona.objects.get(id_persona= usuario.id_persona.id_persona)
                    if persona:
                        empleado = MantEmpleado.objects.get(id_persona=persona.id_persona)
                        materia_profesor = Mov_Materia_profesor.objects.filter(id_empleado=empleado.id_empleado)
                        for i in materia_profesor:
                            queryset= self.model.objects.filter(id_materia_profesor=i.id_materia_profesor)        
                            materias.append(queryset)
                        print(materias)
                        context['object_list'] = materias  
        return render(request, self.template_name, context)
    
    

class Create_notas (CreateView):
    model = MovDetalleRegistroNotas
    template_name = 'sistemaAcademico/Matriculacion/RegistroNotas/CrearRegistroNotas.html'
    form_class = Registro_notas_form
    success_url = reverse_lazy('Academico:registro_notas')
    #context_object_name = 'a'
class Update_notas (UpdateView):
    model = MovDetalleRegistroNotas
    template_name = 'sistemaAcademico/Matriculacion/RegistroNotas/ActualizarNotas.html'
    form_class = Registro_notas_form
    success_url = reverse_lazy('Academico:registro_notas')
    context_object_name = 'a'

    def get_context_data(self, *args, **kwargs):
        context = super(Update_notas, self).get_context_data(**kwargs)
        objecto = context['a']
        context['alumno'] = objecto.id_matriculacion_estudiante
        context['quimestre'] = objecto.id_general_quimestre
        #id de la materia profesor
        id_materia_prof = objecto.id_materia_profesor.id_materia_profesor
        #obtiene el registro de matricula
        matricula = MovMatriculacionEstudiante.objects.get(id_matriculacion_estudiante=objecto.id_matriculacion_estudiante.id_matriculacion_estudiante)
        #id del año lectivo
        id_anio_lectivocurso = matricula.id_mov_anioelectivo_curso.id_mov_anioelectivo_curso
        #recorre todas las materias que tiene ese curso en ese paralelo
        for i in  MovDetalleMateriaCurso.objects.filter(id_mov_anio_lectivo_curso=id_anio_lectivocurso):
            try:
                #obtiene el profesor de esa materia
                materia  =Mov_Materia_profesor.objects.get(id_detalle_materia_curso=i.id_detalle_materia_curso)
                if materia:
                    if materia.id_materia_profesor ==id_materia_prof:
                        context['profesor'] = materia
                        context['materia'] = i
            except Exception as e:
                print(e)
            


        return context


        
class Delete_notas (DeleteView):
    model = MovDetalleRegistroNotas
    template_name = 'sistemaAcademico/Matriculacion/RegistroNotas/EliminarNotas.html'
    success_url = reverse_lazy('Academico:registro_notas')
    context_object_name = 'a'