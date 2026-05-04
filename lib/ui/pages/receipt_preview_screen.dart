import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../models/models.dart';
import '../../services/pdf_service.dart';

class ReceiptPreviewScreen extends ConsumerWidget {
  final Shop shop;
  final Bill bill;
  final double prevBalance;

  const ReceiptPreviewScreen({
    super.key,
    required this.shop,
    required this.bill,
    required this.prevBalance,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Receipt Preview'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Receipt Card
            Hero(
              tag: 'receipt-${bill.id}',
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5), // Classic receipt look
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'ALKOZAY WATER',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Quality Bottled Water Service',
                      style: TextStyle(fontSize: 10, color: Colors.grey, letterSpacing: 1),
                    ),
                    const SizedBox(height: 20),
                    const Divider(thickness: 1, color: Colors.black87),
                    const SizedBox(height: 15),
                    
                    _buildDataRow('CUSTOMER', shop.name, isBold: true),
                    _buildDataRow('DATE', DateFormat('dd MMM yyyy').format(bill.date)),
                    _buildDataRow('TIME', DateFormat('hh:mm a').format(bill.date)),
                    _buildDataRow('BILL NO', '#${bill.id.toString().padLeft(4, '0')}'),
                    
                    const SizedBox(height: 20),
                    const Divider(thickness: 1, color: Colors.black26),
                    const SizedBox(height: 15),
                    
                    _buildItemRow('Small Pack (500ml)', '${bill.smallPackQty}'),
                    _buildItemRow('Large Pack (1.5L)', '${bill.largePackQty}'),
                    
                    const SizedBox(height: 20),
                    const Divider(thickness: 1, color: Colors.black87),
                    const SizedBox(height: 15),
                    
                    _buildDataRow('CURRENT BILL', 'Rs. ${bill.totalPrice.toStringAsFixed(0)}'),
                    _buildDataRow('PREV. BALANCE', 'Rs. ${prevBalance.toStringAsFixed(0)}'),
                    
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _buildDataRow(
                        'TOTAL DUE',
                        'Rs. ${shop.totalDue.toStringAsFixed(0)}',
                        isBold: true,
                        fontSize: 18,
                        color: Colors.blue[900],
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    const Text(
                      '--- THANK YOU ---',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Computer Generated Receipt',
                      style: TextStyle(fontSize: 8, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 35),
            
            // Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      final file = await PdfService.generateReceipt(
                        shop: shop,
                        bill: bill,
                        prevBalance: prevBalance,
                      );
                      await PdfService.printReceipt(file);
                    },
                    icon: const Icon(Icons.print),
                    label: const Text('PRINT'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final file = await PdfService.generateReceipt(
                        shop: shop,
                        bill: bill,
                        prevBalance: prevBalance,
                      );
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Saved to: ${file.path}'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.download),
                    label: const Text('DOWNLOAD'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value, {bool isBold = false, double fontSize = 13, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: fontSize, color: Colors.black87)),
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isBold ? FontWeight.w900 : FontWeight.bold,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(String label, String qty) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Colors.black54, fontSize: 13))),
          Text('x$qty', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(width: 20),
          const Text('--', style: TextStyle(color: Colors.black26)),
        ],
      ),
    );
  }
}
