from django.shortcuts import render
from django.views.generic import TemplateView
from openpyxl import Workbook #nos permite crear libro de trabajo en excel
from openpyxl.styles import Alignment,Border,Font,PatternFill,Side
from django.http.response import HttpResponse, HttpResponseRedirect

from sistemaAcademico.Apps.GestionAcademica.Diccionario.Estructuras_tablas_conf import *

def view_reporte(request, *args, **kwargs):
    if 'usuario' in request.session:
        if request.method == 'POST':
            campo2 = request.POST.get('campo')
            combo = int(request.POST.get('combo'))
            if(combo == 1):
                usuarios = ConfUsuario.objects.filter(id_usuario=campo2)
            elif(combo == 2):
                usuarios = ConfUsuario.objects.filter(usuario=campo2)
            elif(combo == 3):
                persona = MantPersona.objects.get(nombres=campo2)
                usuarios = ConfUsuario.objects.filter(id_persona=persona.id_persona)
            wb = Workbook()
            ws = wb.active
            ws.title = 'Hoja' + str()
            # ---------------------------------para darle diseño a mi titulo en la hoja-----------------------------------------

            ws['A1'].alignment = Alignment(horizontal="center", vertical="center")
            ws['A1'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                                     top=Side(border_style="thin"), bottom=Side(border_style="thin"))

            ws['A1'].fill = PatternFill(start_color='66FFCC', end_color='66FFCC', fill_type="solid")
            ws['A1'].font = Font(name='Calibri', size=12, bold=True)
            ws['A1'] = 'REPORTE DE USUARIO'
            # ---------------------------------------cambiar caracteristicas de las celdas--------------------------------------
            ws.merge_cells('A1:D1')
            ws.row_dimensions[1].height = 25
            ws.column_dimensions['A'].width = 20
            ws.column_dimensions['B'].width = 20
            ws.column_dimensions['C'].width = 20
            ws.column_dimensions['D'].width = 20
            # ----------------------------------------------------darle diseño a mi cabecera------------------------------------
            ws['A3'].alignment = Alignment(horizontal="center", vertical="center")
            ws['A3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                                     top=Side(border_style="thin"), bottom=Side(border_style="thin"))
            ws['A3'].fill = PatternFill(start_color='66CFCC', end_color='66CFCC', fill_type="solid")
            ws['A3'].font = Font(name='Calibri', size=12, bold=True)
            ws['A3'] = 'Usuario'

            ws['B3'].alignment = Alignment(horizontal="center", vertical="center")
            ws['B3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                                     top=Side(border_style="thin"), bottom=Side(border_style="thin"))
            ws['B3'].fill = PatternFill(start_color='66CFCC', end_color='66CFCC', fill_type="solid")
            ws['B3'].font = Font(name='Calibri', size=12, bold=True)
            ws['B3'] = 'Persona'

            ws['C3'].alignment = Alignment(horizontal="center", vertical="center")
            ws['C3'].border = Border(left=Side(border_style="thin"), right=Side(border_style="thin"),
                                     top=Side(border_style="thin"), bottom=Side(border_style="thin"))
            ws['C3'].fill = PatternFill(start_color='66CFCC', end_color='66CFCC', fill_type="solid")
            ws['C3'].font = Font(name='Calibri', size=12, bold=True)
            ws['C3'] = 'tipo de usuario'
            # ---------------------------pintar datos en excel y EXPORTAR DATOS DE LA BD---------------------------------------------------------
            controlador = 4
            for confusuario in usuarios:
                ws.cell(row=controlador, column=1).alignment = Alignment(horizontal="center")
                ws.cell(row=controlador, column=1).border = Border(left=Side(border_style="thin"),
                                                                   right=Side(border_style="thin"),
                                                                   top=Side(border_style="thin"),
                                                                   bottom=Side(border_style="thin"))
                ws.cell(row=controlador, column=1).font = Font(name='Calibri', size=8)
                ws.cell(row=controlador, column=1).value = confusuario.usuario

                ws.cell(row=controlador, column=2).alignment = Alignment(horizontal="center")
                ws.cell(row=controlador, column=2).border = Border(left=Side(border_style="thin"),
                                                                   right=Side(border_style="thin"),
                                                                   top=Side(border_style="thin"),
                                                                   bottom=Side(border_style="thin"))
                ws.cell(row=controlador, column=2).font = Font(name='Calibri', size=8)
                ws.cell(row=controlador,
                        column=2).value = confusuario.id_persona.nombres + " " + confusuario.id_persona.apellidos

                ws.cell(row=controlador, column=3).alignment = Alignment(horizontal="center")
                ws.cell(row=controlador, column=3).border = Border(left=Side(border_style="thin"),
                                                                   right=Side(border_style="thin"),
                                                                   top=Side(border_style="thin"),
                                                                   bottom=Side(border_style="thin"))
                ws.cell(row=controlador, column=3).font = Font(name='Calibri', size=8)
                ws.cell(row=controlador, column=3).value = confusuario.id_genr_tipo_usuario.nombre
                controlador += 1
            # cont += 1

            # establecer el nombre de mi archivo
            nombre_archivo = "ReportePersonalizadoExcel.xlsx"
            # Definir tipo de respuesta que va a dar
            response = HttpResponse(content_type="application/ms-excel")
            contenido = "attachment; filename = {0}".format(nombre_archivo)
            response["Content-Disposition"] = contenido
            wb.save(response)
            return response
        return render(request, 'sistemaAcademico/reportes/reportes.html')
    else:
        return HttpResponseRedirect('timeout/')

