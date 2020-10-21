from django.shortcuts import render, redirect
from django.views.generic import ListView
from sistemaAcademico.Apps.GestionAcademica.Forms.Matriculacion.forms_estudiantes_filter import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovMatriculacionEstudiante
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import MantEstudiante,MantPersona
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import GenrGeneral
from django.urls import reverse_lazy
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mov import MovMatriculacionEstudiante
def filtro_estudiantes_lista(request):
    if request.GET:
        cox = {}
        nombres=request.GET['nombres']
        apellidos = request.GET['apellidos']
        curso = request.GET['curso']
        paralelo = request.GET['paralelo']
        anio = request.GET['anio']
        query = MovMatriculacionEstudiante.objects.raw(
            "SELECT *,est.`id_estudiante`as idEstudiante,mat.id_matriculacion_estudiante,per.`nombres` as nombres , per.`apellidos` as apellidos,"
            " cur.`nombre` as curso ,genr.`nombre` as paralelo ,aniol.`anio` as anio_electivo,"
            "est.`tipo_estudiante` as tipo_estudiante FROM mov_matriculacion_estudiante mat "
            "INNER JOIN mant_estudiante est ON mat.`id_estudiante` = est.`id_estudiante` "
            "INNER JOIN mant_persona per ON est.`id_persona` = per.`id_persona` "
            "INNER JOIN mov_anioelectivo_curso_paralelo anio ON mat.`id_mov_anioelectivo_curso` = anio.`id_mov_anioelectivo_curso` "
            "INNER JOIN mov_cab_curso cur ON anio.`id_curso` = cur.`id_curso` "
            "INNER JOIN genr_general genr ON genr.`idgenr_general`= anio.id_genr_paralelo_id "
            "INNER JOIN `mant_anio_lectivo` aniol ON anio.`id_anio_electivo_id` = aniol.`id_anio_lectivo`"
            "where per.`nombres`= %s or per.`apellidos`= %s or cur.`nombre`= %s or genr.`nombre`= %s or aniol.`anio`= %s",[nombres,apellidos,curso,paralelo,anio])
        cox['consultas']=query

        return render(request, 'sistemaAcademico/Matriculacion/Estudiantes_filtros/Filtrar.html', cox)
    return render(request, 'sistemaAcademico/Matriculacion/Estudiantes_filtros/Filtrar.html')
def filtro_estudiantes(request):
    query=MovMatriculacionEstudiante.objects.raw("SELECT *,est.`id_estudiante`as idEstudiante,mat.id_matriculacion_estudiante,per.`nombres` as nombres , per.`apellidos` as apellidos,"
                                                 " cur.`nombre` as curso ,genr.`nombre` as paralelo ,aniol.`anio` as anio_electivo,"
                                                 "est.`tipo_estudiante` as tipo_estudiante FROM mov_matriculacion_estudiante mat "
                                                 "INNER JOIN mant_estudiante est ON mat.`id_estudiante` = est.`id_estudiante` "
                                                 "INNER JOIN mant_persona per ON est.`id_persona` = per.`id_persona` "
                                                 "INNER JOIN mov_anioelectivo_curso_paralelo anio ON mat.`id_mov_anioelectivo_curso` = anio.`id_mov_anioelectivo_curso` "
                                                 "INNER JOIN mov_cab_curso cur ON anio.`id_curso` = cur.`id_curso` "
                                                 "INNER JOIN genr_general genr ON genr.`idgenr_general`= anio.id_genr_paralelo_id "
                                                 "INNER JOIN `mant_anio_lectivo` aniol ON anio.`id_anio_electivo_id` = aniol.`id_anio_lectivo`")
    cox={}
    cox['consultas']=query
    return render(request, 'sistemaAcademico/Matriculacion/Estudiantes_filtros/Filtrar.html', cox)
class FilterEstudinatesestado(UpdateView):
    model = MovMatriculacionEstudiante
    form_class = FilterEstudinatesestadoforms
    context_object_name = 'id'
    template_name = 'sistemaAcademico/Matriculacion/Estudiantes_filtros/Actualizar_estado.html'
    success_url = reverse_lazy('Academico:estudiante_filtro')
class FilterTipoEstudinates(UpdateView):
    model = MantEstudiante
    form_class = FilterTipoEstudinatesforms
    context_object_name = 'id'
    template_name = 'sistemaAcademico/Matriculacion/Estudiantes_filtros/Actualizar_tipoEstudiantes.html'
    success_url = reverse_lazy('Academico:estudiante_filtro')


