from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render,redirect
from django.utils import timezone
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_genr import *
from sistemaAcademico.Apps.GestionAcademica.Serializers.Configuracion.serializers import *
import socket
from django.views.decorators.cache import cache_page
from django.http import JsonResponse
from django.db.models import Q

class QuizView(APIView):

    def get_queryset(self):
        idEmpresa = self.request.query_params.get('id')
        queryset = 0
        try:
            if idEmpresa is None:
                queryset = ConfEmpresa.objects.all()
            else:
                queryset = ConfEmpresa.objects.filter(razon_social=idEmpresa)
                print(queryset)
        except Exception:
            Response(status= status.HTTP_404_NOT_FOUND)
        return queryset


    def get(self,request):
        queryset = self.get_queryset()
        serializacion = empresaSerializers(queryset,many=True)
        return Response(data=serializacion.data,status= status.HTTP_200_OK)
        try:
            if idEmpresa is None:
                queryset = ConfEmpresa.objects.all()
                
            else:
                queryset = ConfEmpresa.objects.filter(razon_social=idEmpresa)
                print(queryset)
        except Exception:
            return Response(status= status.HTTP_404_NOT_FOUND) 


class Menu_api(APIView): 

    def post(self,request):
        if self.request.data is None:
            return response(status=status.HTTP_204_NO_CONTENT)
        else:
            descripcion = self.request.data['descripcion']
            url = self.request.data['url']
            lazyname = self.request.data['lazyname']
            view = self.request.data['view']
            name = self.request.data['name']
            try:
                
                queryset = ConfMenu.objects.filter(

                     Q(descripcion__contains=descripcion)
                    | Q(url=url)#or
                    | Q(view=view)#or
                    | Q(lazy_name=lazyname)#or
                    | Q(name=name)#or
                    & Q(id_genr_estado=97)#and
                )

                if queryset:  
                    serializacion = menuSerializers(queryset,many=True)
                    return Response(data=serializacion.data,status=status.HTTP_226_IM_USED)

                else:
                    serializacion = menuSerializers(queryset,many=True)
                    return Response(data=serializacion.data, status=status.HTTP_200_OK)

            except Exception as e:
                print(e)      


