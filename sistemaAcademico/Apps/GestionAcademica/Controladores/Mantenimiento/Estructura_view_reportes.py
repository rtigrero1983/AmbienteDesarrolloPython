import openpyxl
from django.shortcuts import render
from django.views.generic import TemplateView
from openpyxl import Workbook #nos permite crear libro de trabajo en excel
from openpyxl.styles import Alignment,Border,Font,PatternFill,Side
from openpyxl.drawing.image import Image
from django.http.response import HttpResponse, HttpResponseRedirect
from io import BytesIO
import time
from reportlab.lib.enums import TA_CENTER
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
from reportlab.lib.units import cm
from reportlab.platypus import Paragraph, Table, TableStyle, Image
from reportlab.lib import colors

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *

from django.template.loader import get_template
from xhtml2pdf import pisa
from datetime import datetime,date
from sistemaAcademico.utils import link_callback

def reporte_estudiante(request):
        if 'usuario' in request.session:
            persona = None
            if request.method == 'POST':
                usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
                print(usuario)
                campoChk = request.POST.get('check1')
                campoP = request.POST.get('campoPersona')
                combo = int(request.POST.get('combo'))
                comboR = int(request.POST.get('comboR'))
                print('el reporte es: ', comboR)
                if (combo == 1):
                    persona = MantEstudiante.objects.filter(id_persona__nombres=campoP)
                elif (combo == 2):
                    persona = MantEstudiante.objects.all()
                elif (combo == 3):
                    persona = MantEstudiante.objects.filter(usuario_ing=campoP)
                elif(combo == 4):
                    return render(request, 'sistemaAcademico/reportes/reportePersona.html')

                if (comboR == 1):
                    return mant_estudiante(persona, campoChk, usuario)
                elif (comboR == 2):
                    return ReporteEstudiante(persona, campoChk, usuario)
            return render(request, 'sistemaAcademico/reportes/reportePersona.html')
        else:
            return HttpResponseRedirect('timeout/')





def mant_estudiante(persona,campoChk3=None,usuariophh=None):
    wb = Workbook()
    ws = wb.active
    ws.title = 'Hoja' + str()
    img = openpyxl.drawing.image.Image('static/img/logo-login.png')
    img.width = 130
    img.height = 65

    ws['B2'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B2'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))

    ws['B2'].font = Font(name='times new roman', size=11, bold=True)
    ws['B2'] = 'Fecha:'

    ws['D2'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D2'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['D2'].font = Font(name='times new roman', size=11)
    ws['D2'] = date.today()

    ws['B3'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['B3'].font = Font(name='times new roman', size=11, bold=True)
    ws['B3'] = 'Hora: '

    ws['D3'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['D3'].font = Font(name='times new roman', size=11)
    ws['D3'] = time.strftime("%H:%M")

    ws['B4'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B4'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['B4'].font = Font(name='times new roman', size=11, bold=True)

    ws['D4'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D4'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['D4'].font = Font(name='times new roman', size=11)
    if campoChk3 != None:
        usur2(ws,usuariophh)


    ws['F2'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                            top=Side(border_style="thin"))
    ws['F3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"))
    ws['F4'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             bottom=Side(border_style="thin"))

    ws['B5'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B5'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))

    ws['B5'].fill = PatternFill(start_color='33FCFF', end_color='33FCFF', fill_type="solid")
    ws['B5'].font = Font(name='times new roman', size=12, bold=True)
    ws['B5'] = 'REPORTE DE ESTUDIANTE'
    # ---------------------------------------cambiar caracteristicas de las celdas--------------------------------------
    ws.merge_cells('B5:F5')

    ws.merge_cells('B2:C2')
    ws.merge_cells('B3:C3')
    ws.merge_cells('B4:C4')
    ws.merge_cells('D2:E2')
    ws.merge_cells('D3:E3')
    ws.merge_cells('D4:E4')

    ws.row_dimensions[3].height = 25
    ws.column_dimensions['B'].width = 25
    ws.column_dimensions['C'].width = 25
    ws.column_dimensions['D'].width = 25
    ws.column_dimensions['E'].width = 25
    ws.column_dimensions['F'].width = 25

    # ws.column_dimensions['D'].width = 20
    # ----------------------------------------------------darle diseño a mi cabecera------------------------------------

    ws['B6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['B6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['B6'].font = Font(name='times new roman', size=12, bold=True)
    ws['B6'] = 'Nombre'

    ws['C6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['C6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['C6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['C6'].font = Font(name='times new roman', size=12, bold=True)
    ws['C6'] = 'Tipo Estudiante'

    ws['D6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['D6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['D6'].font = Font(name='times new roman', size=12, bold=True)
    ws['D6'] = 'Fecha Ingreso'

    ws['E6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['E6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['E6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['E6'].font = Font(name='times new roman', size=12, bold=True)
    ws['E6'] = 'Usuario'

    ws['F6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['F6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['F6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['F6'].font = Font(name='times new roman', size=12, bold=True)
    ws['F6'] = 'Dirección '


    # ---------------------------pintar datos en excel y EXPORTAR DATOS DE LA BD---------------------------------------------------------
    controlador = 7
    cont = 0
    for mant in persona:
        ws.cell(row=controlador, column=2).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=2).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=2).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=2).value = mant.id_persona.nombres

        ws.cell(row=controlador, column=3).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=3).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=3).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=3).value = mant.tipo_estudiante
        ws.cell(row=controlador, column=4).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=4).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=4).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=4).value = mant.fecha_ingreso

        ws.cell(row=controlador, column=5).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=5).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=5).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=5).value = mant.usuario_ing

        ws.cell(row=controlador, column=6).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=6).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=6).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=6).value = mant.id_persona.direccion

        controlador += 1
        cont += 1


    # establecer el nombre de mi archivo
    nombre_archivo = "ReporteEstudianteExcel.xlsx"
    # Definir tipo de respuesta que va a dar
    response = HttpResponse(content_type="application/ms-excel")
    contenido = "attachment; filename = {0}".format(nombre_archivo)
    response["Content-Disposition"] = contenido

    ws.add_image(img, 'F2')
    wb.save('logo-login.xlsx')
    wb.save(response)
    return response

def usur2(ws, usuario):
    print(usuario)
    ws['B4'] = 'Usuario: '
    ws['D4'] = ' {0}'.format(usuario)

def ReporteEstudiante(persona,campoChk=None,usuarioph=None):
    template_path = 'sistemaAcademico/DiseñoReporte/DiseñoEstudiante.html'
    response = HttpResponse(content_type='application/pdf')
    context = {}
    context['fecha_actual'] = date.today()
    context['hora_actual'] = time.strftime("%H:%M")
    response['Content-Disposition'] = 'attachment; filename=ReporteEstudiante.pdf'
    context['lista_estudiante'] = persona
    if campoChk != None: 
        estu(context,usuarioph)

    template = get_template(template_path)
    html = template.render(context)
    pisaStatus = pisa.CreatePDF(html, dest=response, link_callback=link_callback)
    if pisaStatus.err:
        return HttpResponse('we had some errors <pre>'+html+'</pre>')
    return response 
def estu(context,usuario):
    context['nombre_usuario'] = usuario
##############################################################################################################################################

def reporte_empleado(request):
        if 'usuario' in request.session:
            empleado = None
            if request.method == 'POST':
                usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
                print(usuario)
                campoChk = request.POST.get('check1')
                campoP = request.POST.get('campoEmpleado')
                combo = int(request.POST.get('combo'))
                comboR = int(request.POST.get('comboR'))
                print('el reporte es: ', comboR)
                if (combo == 1):
                    empleado = MantEmpleado.objects.filter(id_persona__nombres=campoP)
                elif (combo == 3):
                    empleado = MantEmpleado.objects.filter(id_usuario__usuario=campoP)
                elif (combo == 2):
                    empleado = MantEmpleado.objects.all()
                elif (combo == 4): 
                    return render(request, 'sistemaAcademico/reportes/reporteEmpleado.html')

                if (comboR == 1):
                    return mant_empleado(empleado, campoChk, usuario)
                elif (comboR == 2):
                    return ReporteEmpleado(empleado, campoChk, usuario)
            return render(request, 'sistemaAcademico/reportes/reporteEmpleado.html')
        else:
            return HttpResponseRedirect('timeout/')




def mant_empleado(empleado,campoChk=None, usuarioph=None):
    wb = Workbook()
    ws = wb.active
    ws.title = 'Hoja' + str()
    img = openpyxl.drawing.image.Image('static/img/logo-login.png')
    img.width = 130
    img.height = 65

    # ---------------------------------para darle diseño a mi titulo en la hoja-----------------------------------------
    ws['B2'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B2'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))

    ws['B2'].font = Font(name='times new roman', size=11, bold=True)
    ws['B2'] = 'Fecha:'

    ws['C2'].alignment = Alignment(horizontal="center", vertical="center")
    ws['C2'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['C2'].font = Font(name='times new roman', size=11)
    ws['C2'] = date.today()

    ws['B3'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['B3'].font = Font(name='times new roman', size=11, bold=True)
    ws['B3'] = 'Hora: '

    ws['C3'].alignment = Alignment(horizontal="center", vertical="center")
    ws['C3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['C3'].font = Font(name='times new roman', size=11)
    ws['C3'] = time.strftime("%H:%M")

    ws['B4'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B4'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['B4'].font = Font(name='times new roman', size=11, bold=True)

    ws['C4'].alignment = Alignment(horizontal="center", vertical="center")
    ws['C4'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['C4'].font = Font(name='times new roman', size=11)

    if campoChk != None:
        usur(ws, usuarioph)

    ws['D2'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D2'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"))

    ws['D3'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"))

    ws['D4'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D4'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             bottom=Side(border_style="thin"))

    ws['E2'].alignment = Alignment(horizontal="center", vertical="center")
    ws['E2'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"))

    ws['E3'].alignment = Alignment(horizontal="center", vertical="center")
    ws['E3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"))

    ws['E4'].alignment = Alignment(horizontal="center", vertical="center")
    ws['E4'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             bottom=Side(border_style="thin"))



    ws['B5'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B5'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))

    ws['B5'].fill = PatternFill(start_color='33FCFF', end_color='33FCFF', fill_type="solid")
    ws['B5'].font = Font(name='times new roman', size=12, bold=True)
    ws['B5'] = 'REPORTE DE EMPLEADO'
    # ---------------------------------------cambiar caracteristicas de las celdas--------------------------------------
    ws.merge_cells('B5:E5')
    ws.merge_cells('C2:D2')
    ws.merge_cells('C3:D3')
    ws.merge_cells('C4:D4')

    ws.row_dimensions[3].height = 25
    ws.column_dimensions['B'].width = 25
    ws.column_dimensions['C'].width = 25
    ws.column_dimensions['D'].width = 25
    ws.column_dimensions['E'].width = 25

    # ws.column_dimensions['D'].width = 20
    # ----------------------------------------------------darle diseño a mi cabecera------------------------------------

    ws['B6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['B6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['B6'].font = Font(name='times new roman', size=12, bold=True)
    ws['B6'] = 'Nombre'

    ws['C6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['C6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['C6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['C6'].font = Font(name='times new roman', size=12, bold=True)
    ws['C6'] = 'Usuario'

    ws['D6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['D6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['D6'].font = Font(name='times new roman', size=12, bold=True)
    ws['D6'] = 'Fecha Ingreso'

    ws['E6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['E6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['E6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['E6'].font = Font(name='times new roman', size=12, bold=True)
    ws['E6'] = 'Año Electivo'

    # ---------------------------pintar datos en excel y EXPORTAR DATOS DE LA BD---------------------------------------------------------
    controlador = 7
    cont = 0
    for empe in empleado:
        ws.cell(row=controlador, column=2).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=2).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=2).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=2).value = empe.id_persona.nombres

        ws.cell(row=controlador, column=3).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=3).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=3).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=3).value = empe.id_usuario.usuario
        ws.cell(row=controlador, column=4).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=4).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=4).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=4).value = empe.fecha_ingreso

        ws.cell(row=controlador, column=5).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=5).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=5).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=5).value = empe.id_anio_lectivo.anio

        controlador += 1
        cont += 1

    # establecer el nombre de mi archivo
    nombre_archivo = "ReporteEmpleadoExcel.xlsx"
    # Definir tipo de respuesta que va a dar
    response = HttpResponse(content_type="application/ms-excel")
    contenido = "attachment; filename = {0}".format(nombre_archivo)
    response["Content-Disposition"] = contenido

    ws.add_image(img, 'E2')
    wb.save('logo-login.xlsx')
    wb.save(response)
    return response
def usur(ws, usuario):
    print(usuario)
    ws['B4'] = 'Usuario: '
    ws['C4'] = ' {0}'.format(usuario)


def ReporteEmpleado(empleado,campoChk=None,usuarioph=None ):
    template_path = 'sistemaAcademico/DiseñoReporte/DiseñoEmpleado.html'
    response = HttpResponse(content_type='application/pdf')
    context = {}
    context['fecha_actual'] = date.today()
    context['hora_actual'] = time.strftime("%H:%M")
    response['Content-Disposition'] = 'attachment; filename=ReporteEmpleado.pdf'
    context['lista_empleado'] = empleado
    if campoChk != None: 
        usu(context,usuarioph)

    template = get_template(template_path)
    html = template.render(context)
    pisaStatus = pisa.CreatePDF(html, dest=response, link_callback=link_callback)
    if pisaStatus.err:
        return HttpResponse('we had some errors <pre>'+html+'</pre>')
    return response 
def usu(context,usuario):
    context['nombre_usuario'] = usuario