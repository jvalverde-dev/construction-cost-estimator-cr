import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../models/data_models.dart';

class PdfService {
  static Future<void> generatePdf({
    required String projectName,
    required List<AposentoInstance> aposentos,
    required double totalArea,
    required double totalCost,
  }) async {
    try {
      final pdf = pw.Document();

      final font = await PdfGoogleFonts.notoSansRegular();
      final fontBold = await PdfGoogleFonts.notoSansBold();
      final fontItalic = await PdfGoogleFonts.notoSansItalic();

      final currencyFormatter = NumberFormat.currency(
        symbol: '₡',
        decimalDigits: 0,
        customPattern: '\u00A4 #,###',
      );

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          theme: pw.ThemeData.withFont(
            base: font,
            bold: fontBold,
            italic: fontItalic,
          ),
          margin: const pw.EdgeInsets.all(40),
          build: (pw.Context context) {
            return [
              _buildHeader(projectName),
              pw.SizedBox(height: 20),
              _buildSummary(totalArea, totalCost, currencyFormatter),
              pw.SizedBox(height: 30),
              _buildTable(aposentos, currencyFormatter),
              pw.SizedBox(height: 40),
              _buildFooter(),
            ];
          },
        ),
      );

      await Printing.sharePdf(
        bytes: await pdf.save(),
        filename: 'Estimacion_${projectName.replaceAll(' ', '_')}.pdf',
      );
    } catch (e) {
      debugPrint('Error generando el PDF: $e');
    }
  }

  static pw.Widget _buildHeader(String projectName) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Estimador de Costos',
          style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          projectName.isEmpty ? 'Proyecto Sin Nombre' : projectName,
          style: pw.TextStyle(
            fontSize: 24,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blueGrey900,
          ),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          'Fecha: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
          style: const pw.TextStyle(fontSize: 12),
        ),
        pw.Divider(color: PdfColors.grey400),
      ],
    );
  }

  static String _formatMoney(NumberFormat formatter, double value) {
    return formatter.format(value).replaceAll(',', ' ');
  }

  static pw.Widget _buildSummary(
    double area,
    double cost,
    NumberFormat formatter,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(15),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(10),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Área Total',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                '${area.toStringAsFixed(2)} m²',
                style: const pw.TextStyle(fontSize: 18),
              ),
            ],
          ),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text(
                'Costo Estimado',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Text(
                _formatMoney(formatter, cost),
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.blue900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildTable(
    List<AposentoInstance> aposentos,
    NumberFormat formatter,
  ) {
    return pw.TableHelper.fromTextArray(
      border: null,
      headerDecoration: const pw.BoxDecoration(
        color: PdfColors.blueGrey50,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(5)),
      ),
      headerHeight: 30,
      cellHeight: 30,
      headerStyle: pw.TextStyle(
        fontWeight: pw.FontWeight.bold,
        fontSize: 10,
        color: PdfColors.blueGrey800,
      ),
      cellStyle: const pw.TextStyle(fontSize: 10),
      headers: ['Aposento', 'Tipología', 'Área (m²)', 'Costo Parcial'],
      data:
          aposentos
              .map(
                (a) => [
                  a.aposentoType.name,
                  a.typology.id,
                  a.area.toStringAsFixed(2),
                  _formatMoney(formatter, a.totalCost),
                ],
              )
              .toList(),
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.center,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.centerRight,
      },
    );
  }

  static pw.Widget _buildFooter() {
    return pw.Column(
      children: [
        pw.Divider(color: PdfColors.grey400),
        pw.SizedBox(height: 5),
        pw.Text(
          'Nota: Los datos de este documento corresponden a estimaciones basadas en el Manual de Valores Base Unitario del Ministerio de Hacienda. Si bien dichos valores son los que referencia la Ley N° 7509 para la valoración municipal, no sustituyen un presupuesto formal elaborado por un profesional. Su uso es de carácter orientativo y no posee valor legal.',
          style: pw.TextStyle(
            fontSize: 8,
            fontStyle: pw.FontStyle.italic,
            color: PdfColors.grey600,
          ),
          textAlign: pw.TextAlign.justify,
        ),
      ],
    );
  }
}
