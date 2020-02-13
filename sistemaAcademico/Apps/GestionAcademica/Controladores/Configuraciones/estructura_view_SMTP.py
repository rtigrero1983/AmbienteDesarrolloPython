from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render,redirect, get_object_or_404
from django.http import HttpResponse
from django.db.models import Q

from sistemaAcademico.Apps.GestionAcademica import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *

def smtp_view(request):
	error = None
	if(request.method == "POST"):
		form = forms.SMTPForm(request.POST)
		if(form.is_valid()):
			form.save()
			return redirect("Academico:menu")
		else:
			error = "No se pudo Guardar el formulario"
	else:
		form = forms.SMTPForm()
	return render(request,"sistemaAcademico/Configuraciones/SMTP/Ingresar_SMTP.html", {"form":form , "error":error})
