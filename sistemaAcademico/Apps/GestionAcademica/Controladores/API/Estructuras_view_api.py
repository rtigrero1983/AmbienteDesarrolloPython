from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from sistemaAcademico.Apps.GestionAcademica.Api.Configuracion.serializers import *
import socket
from django.views.decorators.cache import cache_page

class QuizView(APIView):

    def get_queryset(self):
        idEmpresa = self.request.query_params.get('id')

        queryset = 0
        try:
            queryset = ConfEmpresa.objects.filter(razon_social=idEmpresa)
            print(queryset)
        except Exception:
            Response(status= status.HTTP_404_NOT_FOUND)
        return queryset


    def get(self,request):
        queryset = self.get_queryset()
        serializacion = empresaSerializers(queryset,many=True)
        return Response(data=serializacion.data,status= status.HTTP_200_OK)




