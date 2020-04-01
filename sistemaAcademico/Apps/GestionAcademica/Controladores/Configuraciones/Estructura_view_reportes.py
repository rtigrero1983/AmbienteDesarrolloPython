import openpyxl
from django.shortcuts import render
from django.views.generic import TemplateView
from openpyxl import Workbook #nos permite crear libro de trabajo en excel
import datetime
import time
from openpyxl.styles import Alignment,Border,Font,PatternFill,Side
from django.http.response import HttpResponse, HttpResponseRedirect
from io import BytesIO
from reportlab.lib.enums import TA_CENTER
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
from reportlab.lib.units import cm
from reportlab.platypus import Paragraph, Table, TableStyle,Image
from reportlab.lib import colors

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *
from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_mant import *

#from trunk.sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import ConfRol


def reporte_usuarios(request, *args, **kwargs):
    if 'usuario' in request.session:
        usuarios = None
        if request.method == 'POST':
            usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
            print(usuario)
            campoChk = request.POST.get('check1')
            campo2 = request.POST.get('campo')
            combo = int(request.POST.get('combo'))
            comboR = int(request.POST.get('comboR'))
            print('el reporte es: ',comboR)

            if(combo == 1):
                usuarios = ConfUsuario.objects.filter(usuario=campo2)
            elif(combo == 2):
                usuarios = ConfUsuario.objects.filter(id_persona__nombres=campo2)
            elif(combo==3):
                usuarios = ConfUsuario.objects.all()


            if(comboR == 1):
                return reporte_excell(usuarios,campoChk,usuario)
            elif(comboR == 2):
                return reportePdf(usuarios,campoChk,usuario)
        return render(request, 'sistemaAcademico/reportes/reportes.html')
    else:
        return HttpResponseRedirect('timeout/')

def reporte_excell(usuarios,campoChk=None,usuarioph=None):
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
    ws['C2'] = datetime.datetime.now().date()

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
    ws['D4'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),bottom=Side(border_style="thin"))


    ws['B5'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B5'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))

    ws['B5'].fill = PatternFill(start_color='33FCFF', end_color='33FCFF', fill_type="solid")
    ws['B5'].font = Font(name='times new roman', size=12, bold=True)
    ws['B5'] = 'REPORTE DE USUARIO'
    # ---------------------------------------cambiar caracteristicas de las celdas--------------------------------------
    ws.merge_cells('B5:D5')
    ws.row_dimensions[3].height = 25
    ws.column_dimensions['B'].width = 25
    ws.column_dimensions['C'].width = 30
    ws.column_dimensions['D'].width = 25

    #ws.column_dimensions['D'].width = 20
    # ----------------------------------------------------darle diseño a mi cabecera------------------------------------

    ws['B6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['B6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['B6'].font = Font(name='times new roman', size=12, bold=True)
    ws['B6'] = 'Usuario'

    ws['C6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['C6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['C6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['C6'].font = Font(name='times new roman', size=12, bold=True)
    ws['C6'] = 'Nombre'

    ws['D6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['D6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['D6'].font = Font(name='times new roman', size=12, bold=True)
    ws['D6'] = 'Tipo de Usuario'




    # ---------------------------pintar datos en excel y EXPORTAR DATOS DE LA BD---------------------------------------------------------
    controlador = 7
    for confusuario in usuarios:
        ws.cell(row=controlador, column=2).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=2).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=2).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=2).value = confusuario.usuario

        ws.cell(row=controlador, column=3).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=3).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=3).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador,column=3).value = confusuario.id_persona.nombres + " " + confusuario.id_persona.apellidos

        ws.cell(row=controlador, column=4).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=4).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=4).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador, column=4).value = confusuario.id_genr_tipo_usuario.nombre
        controlador += 1


    # establecer el nombre de mi archivo
    nombre_archivo = "ReporteUsuarioExcel.xlsx"
    # Definir tipo de respuesta que va a dar
    response = HttpResponse(content_type="application/ms-excel")
    contenido = "attachment; filename = {0}".format(nombre_archivo)
    response["Content-Disposition"] = contenido

    ws.add_image(img,'D2')
    wb.save('logo-login.xlsx')
    wb.save(response)
    return response
def usur(ws, usuario):
    print(usuario)
    ws['B4'] = 'Usuario: '
    ws['C4'] = ' {0}'.format(usuario)




def reportePdf(usuarios,campoChk=None,usuarioph=None):
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename=Reporte_Usuario.pdf'
    buffer = BytesIO()
    high = 650
    this_U = None

    styles = getSampleStyleSheet()
    sytlesBH = styles["Heading3"]
    sytlesBH.alignment = TA_CENTER
    sytlesBH.fontSinze = 7

    # styles = getSampleStyleSheet()
    styleN = styles["BodyText"]
    styleN.alignment = TA_CENTER
    styleN.fontSize = 7
    width, height = A4

    usuario = Paragraph('''Usuario''', sytlesBH)
    persona = Paragraph('''Nombre''', sytlesBH)
    tipoU = Paragraph('''Tipo Usuario''', sytlesBH)
    data = []
    data.append([usuario, persona, tipoU])
    this_U = []
    #response['Content-Disposition']='attachment; filename=ReportePdf.pdf'
    for pdf in usuarios:
        this_U += [{'#':pdf.usuario,'h':pdf.id_persona.nombres + " " + pdf.id_persona.apellidos, 'l':pdf.id_genr_tipo_usuario.nombre}]
        #data.append(this_usuario)
        high = high-18


    for students in this_U:
         u = [students['#'], students['h'], students['l']]
         data.append(u)

    c = canvas.Canvas(buffer, pagesize=A4)
    cabecerapdfU(high,data,width,height,buffer,c)
    if campoChk != None:
        piePagina(c,usuarioph)

    c.showPage()
    c.save()
    pd = buffer.getvalue()
    buffer.close()
    response.write(pd)
    return response

def cabecerapdfU(high,data,width, height,buffer,c):
    c.setLineWidth(.3)
    c.setFont('Helvetica-Bold', 22)
    c.drawString(240, 760, 'Reporte Usuario')

    fecha2 = datetime.datetime.now().date()
    hora = time.strftime("%H:%M")
    c.setFont('Helvetica-Bold',10)
    c.drawString(300, 50, 'Fecha: {0}'.format(fecha2)+' '+'  hora:{0}'.format(hora))

    c.line(90, 747, 550, 747)
    c.drawImage("static/img/logo-login.png", 50, 760, width=50, height=50)
    table = Table(data, colWidths=[2.9 * cm, 8 * cm, 8.5 * cm])
    table.setStyle(TableStyle([('INNERGRID', (0, 0), (-1, -1), 0.25, colors.black),
                               ('BOX', (0, 0), (-1, -1), 0.25, colors.black), ]))
    table.wrapOn(c, width, height)
    table.drawOn(c, 30, high)


def piePagina(c,usuario):
    print(usuario)
    c.setFont('Helvetica-Bold',10)
    c.drawString(100, 50, 'Usuario: {0}'.format(usuario))


#//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



def reporte_roles(request, *args, **kwargs):
    if 'usuario' in request.session:
        rol = None
        if request.method == 'POST':
            usuario = ConfUsuario.objects.get(id_usuario=request.session.get('usuario'))
            print(usuario)
            campoChk2 = request.POST.get('check2')
            campo2 = request.POST.get('campo')
            combo = int(request.POST.get('combo'))
            if(combo == 1):
                rol = ConfUsuario.objects.all()
            elif(combo ==2):
                rol = ConfUsuario.objects.filter(id_rol__nombre=campo2)



            print('kjkjkjkj',campo2)
            comboR = int(request.POST.get('comboR'))
            print('el reporte es: ',comboR)
            if(comboR == 1):
                return reporte_excel_rol(rol,campoChk2,usuario)
            elif(comboR == 2):
                return reportePdf_Rol(rol,campoChk2,usuario)
        return render(request, 'sistemaAcademico/reportes/reporterol.html')
    else:
       return HttpResponseRedirect('timeout/')



def reporte_excel_rol(rol, campoChk2=None,usuarioph=None):

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
    ws['C2'] = datetime.datetime.now().date()

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

    if campoChk2 != None:
        usur(ws,usuarioph)

    ws['D2'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D2'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"))

    ws['D3'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"))

    ws['D4'].alignment = Alignment(horizontal="center", vertical="center")
    ws['D4'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             bottom=Side(border_style="thin"))

    ws['B5'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B5'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))

    ws['B5'].fill = PatternFill(start_color='33FCFF', end_color='33FCFF', fill_type="solid")
    ws['B5'].font = Font(name='times new roman', size=12, bold=True)
    ws['B5'] = 'REPORTE ROL'
    # ---------------------------------------cambiar caracteristicas de las celdas--------------------------------------
    ws.merge_cells('B5:D5')
    ws.row_dimensions[3].height = 25
    ws.column_dimensions['B'].width = 25
    ws.column_dimensions['C'].width = 25
    ws.column_dimensions['D'].width = 25

    # ws.column_dimensions['D'].width = 20
    # ----------------------------------------------------darle diseño a mi cabecera------------------------------------

    ws['B6'].alignment = Alignment(horizontal="center", vertical="center")
    ws['B6'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                             top=Side(border_style="thin"), bottom=Side(border_style="thin"))
    ws['B6'].fill = PatternFill(start_color='3380FF', end_color='3380FF', fill_type="solid")
    ws['B6'].font = Font(name='times new roman', size=12, bold=True)
    ws['B6'] = 'Nombre del Rol'

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
    ws['D6'] = 'Nombre'

    # ---------------------------pintar datos en excel y EXPORTAR DATOS DE LA BD---------------------------------------------------------
    controlador = 7
    cont = 0
    for confRol in rol:
        ws.cell(row=controlador, column=2).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=2).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=2).font = Font(name='times new roman', size=11)
        rol_r = [c.nombre for c in confRol.id_rol.all()]
        ws.cell(row=controlador, column=2).value = ', '.join(rol_r)

        ws.cell(row=controlador, column=3).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=3).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=3).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador,
                column=3).value = confRol.usuario

        ws.cell(row=controlador, column=4).alignment = Alignment(horizontal="center")
        ws.cell(row=controlador, column=4).border = Border(left=Side(border_style="thin"),
                                                           right=Side(border_style="thin"),
                                                           top=Side(border_style="thin"),
                                                           bottom=Side(border_style="thin"))
        ws.cell(row=controlador, column=4).font = Font(name='times new roman', size=11)
        ws.cell(row=controlador,
                column=4).value = confRol.id_persona.nombres

        controlador += 1
        cont += 1

    controlador += 1


    # establecer el nombre de mi archivo
    nombre_archivo = "ReporteRolExcel.xlsx"
    # Definir tipo de respuesta que va a dar
    response = HttpResponse(content_type="application/ms-excel")
    contenido = "attachment; filename = {0}".format(nombre_archivo)
    response["Content-Disposition"] = contenido

    ws.add_image(img, 'D2')
    wb.save('logo-login.xlsx')
    wb.save(response)
    return response
def usur(ws, usuario):
    print(usuario)
    ws['B4'] = 'Usuario: '
    ws['C4'] = ' {0}'.format(usuario)




def reportePdf_Rol(rol,campoChk2=None,usuarioph=None):
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename=Reporte_Rol.pdf'
    buffer = BytesIO()

    styles = getSampleStyleSheet()
    sytlesBH = styles["Heading3"]
    sytlesBH.alignment = TA_CENTER
    sytlesBH.fontSinze = 7

    # styles = getSampleStyleSheet()
    styleN = styles["BodyText"]
    styleN.alignment = TA_CENTER
    styleN.fontSize = 7
    width, height = A4

    roles = Paragraph('''Nombre del Rol''', sytlesBH)
    usu = Paragraph('''Usuario''', sytlesBH)
    nomb = Paragraph('''Nombre''', sytlesBH)
    data = []
    data.append([roles, usu , nomb])

    #response['Content-Disposition']='attachment; filename=ReportePdf.pdf'
    #contro = 2
    this_rol = []
    for pdfrol in rol:
        miguel = [r.nombre for r in pdfrol.id_rol.all()]
        print(miguel)
        this_rol += [{'R':','.join(miguel) ,'U': pdfrol.usuario, 'N': pdfrol.id_persona.nombres }]
        #this_rol += this_rol

    high = 650
    for Rrol in this_rol:
        u = [Rrol['R'], Rrol['U'], Rrol['N']]
        data.append(u)
        high = high - 18

    c = canvas.Canvas(buffer, pagesize=A4)
    cabecerapdfrol(high,data,width,height,buffer,c)
    if campoChk2 != None:
        piePagina(c,usuarioph)

    c.showPage()
    c.save()
    pd = buffer.getvalue()
    buffer.close()
    response.write(pd)
    return response
def cabecerapdfrol(high,data,width, height,buffer,c):
    c.setLineWidth(.3)
    c.setFont('Helvetica-Bold', 22)
    c.drawString(240, 760, 'REPORTE ROL')

    fecha = datetime.datetime.now().date()
    hora = time.strftime("%H:%M")
    c.setFont('Helvetica-Bold',10)
    c.drawString(300, 50, 'FECHA: {0}'.format(fecha)+' '+'  HORA:{0}'.format(hora))

    c.line(90, 747, 550, 747)
    c.drawImage("static/img/logo-login.png", 50, 760, width=50, height=50)



    table = Table(data, colWidths=[8.5 * cm, 5 * cm, 5 * cm])
    table.setStyle(TableStyle([('INNERGRID', (0, 0), (-1, -1), 0.25, colors.black),
                               ('BOX', (0, 0), (-1, -1), 0.25, colors.black), ]))
    table.wrapOn(c, width, height)
    table.drawOn(c, 30, high)



def piePagina(c,usuario):
    print(usuario)
    c.setFont('Helvetica-Bold',10)
    c.drawString(100, 50, 'Usuario: {0}'.format(usuario))
