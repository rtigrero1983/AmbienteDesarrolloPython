from django.http import HttpResponseRedirect, HttpResponse
from django.template.loader import get_template
from django.shortcuts import render, redirect
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from sistemaAcademico.Apps.GestionAcademica.Api.Configuracion.serializers import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import ConfModulo
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from django.views.decorators.cache import cache_page


class Modulo(APIView):

    error_mensaje = 'Error'
    def estados(self,estado):
        var_estado = None
        if estado == 'activo':
           var_estado = GenrGeneral.objects.get(idgenr_general=97)
        if estado == 'inactivo':
            var_estado = GenrGeneral.objects.get(idgenr_general=98)
        if estado == 'en proceso':
            var_estado = GenrGeneral.objects.get(idgenr_general=99)
        return var_estado


    def get_object(self):
        try:
            return ConfModulo.objects.filter(id_genr_estado=97)
        except ConfModulo.DoesNotExist:
            raise status.HTTP_404_NOT_FOUND
        
    def get(self,request):
        queryset = self.get_object()
        serializer = moduloSerializers(queryset,many=True)
        return Response(data=serializer.data,status=status.HTTP_200_OK)    

    def post(self, request):
        #request.data['id_genr_estado'] = self.estados('activo')
        serializer = moduloSerializers(data = request.data)
        try:
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data,status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response(self.error_mensaje,status=status.HTTP_404_NOT_FOUND)
    
    def delete(self,request):
        modulo = ConfModulo.objects.get(id_modulo=request.data['id_modulo'])
        modulo.id_genr_estado = self.estados('inactivo')
        modulo.save()
        return Response("Modulo inactivo",status=status.HTTP_202_ACCEPTED)

    def put(self,request):
     modulo = ConfModulo.objects.get(id_modulo=request.data['id_modulo'])
     serializer = moduloSerializers(modulo,data=request.data)
     if serializer.is_valid():  
         serializer.save()
         return Response("Datos actualizados",status=status.HTTP_202_ACCEPTED)


@cache_page(60 * 10)
def modulo(request):
    if 'usuario' in request.session:
        t = get_template('sistemaAcademico/Configuraciones/Modulos/modulo.html')
        html = t.render()
        return HttpResponse(html)
    else:
        return HttpResponseRedirect('timeout/')


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