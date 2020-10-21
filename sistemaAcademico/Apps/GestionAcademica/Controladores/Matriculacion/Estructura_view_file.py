from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from sistemaAcademico.Apps.GestionAcademica.Forms.Admision.form_file import UploadFileForm
from django.urls import reverse_lazy
from django.views import View
import os
from django.shortcuts import render
import pandas as pd

class Upload_File(View):

    template_name = 'sistemaAcademico/Matriculacion/PreRegistro/preregistro.html'
    success_url = reverse_lazy('Academico:estudiante')
    success_message = "%(name)s was created successfully"
    form_class = UploadFileForm()


    def get(self, request, *args, **kwargs):
        form = self.form_class
        return render(request,self.template_name,{  'form' :form})

    def post(self, request, *args, **kwargs):

        def handle_uploaded_file(file, filename):
            if not os.path.exists('files/'):
                os.mkdir('files/')
            array = filename.split('.')
            if array[1]=='xlsx' or array[1]=='xlsx':
                with open('files/' + filename, 'wb+') as destination:
                    for chunk in file.chunks():
                        destination.write(chunk)
                df = pd.read_excel(('files/{0}').format(filename))
                print(df)

            else:
                form = UploadFileForm()

        form = UploadFileForm(self.request.POST, self.request.FILES)

        if form.is_valid():
            handle_uploaded_file(self.request.FILES['file'], str(self.request.FILES['file']))

        else:
            form = UploadFileForm()


        return render(request,self.template_name,{  'form' : self.form_class,})

