from  rest_framework.response import  Response
from .serializers import rolSerializers
from rest_framework.views import APIView
from rest_framework import status

class RolApi(APIView):
    def post(self,request):
        serializers = rolSerializers(data= request.data)
        if serializers.is_valid():
            rol = serializers.save()
            return Response(serializers.data,status = status.HTTP_201_CREATED)
        else:
            return Response(serializers.errors, status = status.HTTP_400_BAD_REQUEST)
