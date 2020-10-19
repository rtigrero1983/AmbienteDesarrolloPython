from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovDetalleRegistroNotas
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_registro_notas import Registro_notas_form
from django.urls import reverse_lazy

class List_Notas (ListView):
    model = MovDetalleRegistroNotas
    template_name = 'sistemaAcademico/Matriculacion/RegistroNotas/RegistroNotas.html'
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
class Delete_notas (DeleteView):
    model = MovDetalleRegistroNotas
    template_name = 'sistemaAcademico/Matriculacion/RegistroNotas/EliminarNotas.html'
    success_url = reverse_lazy('Academico:registro_notas')
    context_object_name = 'a'