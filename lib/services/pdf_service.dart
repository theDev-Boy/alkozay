import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import '../models/models.dart';
import 'package:intl/intl.dart';

class PdfService {
  static Future<File> generateReceipt({
    required Shop shop,
    required Bill bill,
    required double prevBalance,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.roll80, // Receipt style format
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(20),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text('ALKOZAY BOTTLED WATER',
                    style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Divider(),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Shop:'),
                    pw.Text(shop.name, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Date:'),
                    pw.Text(DateFormat('dd MMM yyyy, hh:mm a').format(bill.date)),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Divider(),
                _buildPdfRow('Small Pack Qty', '${bill.smallPackQty}'),
                _buildPdfRow('Large Pack Qty', '${bill.largePackQty}'),
                pw.Divider(),
                _buildPdfRow('Current Bill', 'Rs. ${bill.totalPrice.toStringAsFixed(0)}'),
                _buildPdfRow('Previous Balance', 'Rs. ${prevBalance.toStringAsFixed(0)}'),
                pw.Divider(),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('TOTAL DUE:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('Rs. ${shop.totalDue.toStringAsFixed(0)}',
                        style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Text('Thank you for your business!',
                    style: pw.TextStyle(fontSize: 10, fontStyle: pw.FontStyle.italic)),
              ],
            ),
          );
        },
      ),
    );

    final output = await getExternalStorageDirectory();
    final file = File("${output!.path}/Receipt_${bill.id}.pdf");
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  static pw.Widget _buildPdfRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label),
          pw.Text(value, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        ],
      ),
    );
  }

  static Future<void> printReceipt(File file) async {
    await Printing.layoutPdf(onLayout: (_) => file.readAsBytes());
  }
}
