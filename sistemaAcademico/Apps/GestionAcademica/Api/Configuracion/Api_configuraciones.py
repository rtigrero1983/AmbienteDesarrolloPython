from django.http import HttpResponseRedirect, HttpResponse
from django.template.loader import get_template
from django.shortcuts import render, redirect
from rest_framework.views import APIView
from rest_framework.response import Response
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from .serializers import menuSerializers
from rest_framework import status

class Menuapi(APIView):
    bandera = 'permitido'
    error_mensaje = 'nombre de menu ya existe por favor ingrese otro'
    error_sistema = 'ocurrio un error interno'
    def post(self,request):
        serializer = menuSerializers(data=request.data)
        try:
          if serializer.is_valid():
            menu = ConfMenu.objects.get(descripcion=serializer.data['descripcion'])
            if menu:
                return Response('no permitido', status=status.HTTP_200_OK)
            else:
                return Response(serializer.data, status.HTTP_226_IM_USED)

        except Exception as e:
            return Response(serializer.data,status=status.HTTP_404_NOT_FOUND)


