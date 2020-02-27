from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render,redirect, get_object_or_404
from django.http import HttpResponse
from django.db.models import Q
from decouple import config
from django.template.loader import get_template
from django.urls import reverse_lazy
from django.views.generic import UpdateView

from sistemaAcademico import settings
from sistemaAcademico.Apps.GestionAcademica import forms
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from django.core.mail import EmailMultiAlternatives
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
		campo = ConfCorreosSmpt.objects.all().exists()
		if campo is True:
			return redirect("Academico:edit_smtp",1)
		else:
			form = forms.SMTPForm()
	return render(request,"sistemaAcademico/Configuraciones/SMTP/Ingresar_SMTP.html", {"form":form , "error":error})


class smtp_edit(UpdateView):
	model = ConfCorreosSmpt
	template_name = "sistemaAcademico/Configuraciones/SMTP/Ingresar_SMTP.html"
	form_class = forms.SMTPForm
	context_object_name = "form"

	success_url = reverse_lazy("Academico:usuarios")


def obtener_parametros():
	configuracion = ConfCorreosSmpt.objects.filter(id_genr_estado=97).orderby('-dominio')[:1]
	return configuracion

def enviar_correo_usuario(nombre_usuario,password,url_template,usuario):
	Smtp = obtener_parametros()
	settings.EMAIL_HOST = Smtp.dominio
	settings.EMAIL_PORT = Smtp.puerto
	if(nombre_usuario):
		settings.EMAIL_HOST_USER = nombre_usuario
		settings.EMAIL_HOST_PASSWORD = password
	else:
		settings.EMAIL_HOST_USER = Smtp.usuario_c
		settings.EMAIL_HOST_PASSWORD = Smtp.contrasenia_c
	settings.EMAIL_USE_SSL = True
	subject = 'Preinscripción de estudiantes'
	if(url_template):
		template = get_template(url_template)
	else:
		template = get_template('templates/Correos/correo_verificacion.html')
	content  = template.render({'user':usuario,})
	message = EmailMultiAlternatives(subject,
									'Saludos' ,settings.EMAIL_HOST_USER,[usuario.email])
	message.attach_alternative(content,'text/html')
	message.send()

def view_temporal(request):
	error = None
	if(request.method == "POST"):
		form = forms.SMTPForm(request.POST)
		if(form.is_valid()):
		form.save()
		return redirect("Academico:menu")
		else:
		error = "No se pudo Guardar el formulario"
		else:
		campo = ConfCorreosSmpt.objects.all().exists()
		if campo is True:
		return redirect("Academico:edit_smtp", 1)
	else:
		form = forms.SMTPForm()
		return render(request, "sistemaAcademico/Configuraciones/SMTP/Ingresar_SMTP.html", {"form": form, "error": error})






