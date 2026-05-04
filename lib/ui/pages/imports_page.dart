import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/providers.dart';
import '../../models/models.dart';

class ImportsPage extends ConsumerWidget {
  const ImportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final importsAsync = ref.watch(importsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottle Imports'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => _showAddImportDialog(context, ref),
              tooltip: 'Add new import',
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 24),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSummaryCards(ref),
          Expanded(
            child: importsAsync.when(
              data: (imports) {
                if (imports.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_shipping_outlined, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        const Text(
                          'No imports recorded yet',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: imports.length,
                  itemBuilder: (context, index) {
                    final imp = imports[index];
                    return _buildImportCard(context, ref, imp);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err')),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddImportDialog(context, ref),
        tooltip: 'Add import',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildImportCard(BuildContext context, WidgetRef ref, BottleImport imp) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(imp.supplierName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(DateFormat('dd MMM yyyy').format(imp.date), style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                Text('Rs. ${imp.totalCost.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
              ],
            ),
            _buildDetailRow(context, 'Small Bottles Qty', '${imp.smallBottleQty}', 'Rs. ${(imp.smallBottleQty * imp.smallBottleCost).toStringAsFixed(0)}', Colors.blue),
            _buildDetailRow(context, 'Large Bottles Qty', '${imp.largeBottleQty}', 'Rs. ${(imp.largeBottleQty * imp.largeBottleCost).toStringAsFixed(0)}', Colors.orange),
            _buildDetailRow(context, 'Seals Price', '-', 'Rs. ${imp.sealCost.toStringAsFixed(0)}', Colors.green),
            _buildDetailRow(context, 'Caps Price', '-', 'Rs. ${imp.capCost.toStringAsFixed(0)}', Colors.purple),
            _buildDetailRow(context, 'Plastic Price', '-', 'Rs. ${imp.plasticCost.toStringAsFixed(0)}', Colors.teal),
            _buildDetailRow(context, 'Extra Charges', '-', 'Rs. ${imp.extraCharges.toStringAsFixed(0)}', Colors.grey),
            if (imp.description != null && imp.description!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(8)),
                child: Text('Note: ${imp.description}', style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
              ),
            ],
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () => _showAddImportDialog(context, ref, imp: imp),
                  icon: const Icon(Icons.edit, size: 16),
                  label: const Text('Edit'),
                ),
                TextButton.icon(
                  onPressed: () => _deleteImport(context, ref, imp.id),
                  icon: const Icon(Icons.delete, size: 16, color: Colors.red),
                  label: const Text('Delete', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCards(WidgetRef ref) {
    final stats = ref.watch(importsStatsProvider);
    
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildStatCard('Small Bottles', '${stats['smallQty']}', 'Value: Rs.${stats['smallCost'].toStringAsFixed(0)}', Colors.blue),
          _buildStatCard('Large Bottles', '${stats['largeQty']}', 'Value: Rs.${stats['largeCost'].toStringAsFixed(0)}', Colors.orange),
          _buildStatCard('Total seals Rs', 'Spending:', 'Rs. ${stats['sealCost'].toStringAsFixed(0)}', Colors.green),
          _buildStatCard('Total caps Rs', 'Spending:', 'Rs. ${stats['capCost'].toStringAsFixed(0)}', Colors.purple),
          _buildStatCard('Total plastic Rs', 'Spending:', 'Rs. ${stats['plasticCost'].toStringAsFixed(0)}', Colors.teal),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String qty, String cost, Color color) {
    return Container(
      width: 130, // Reduced fixed width slightly
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, 
            style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(qty, 
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(cost, 
              style: TextStyle(fontSize: 9, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String title, String qty, String cost, Color color) {
    if (qty == '0' && cost == 'Rs. 0') return const SizedBox.shrink();
    if (qty == '0' && cost == 'Rs. 0') return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(width: 4, height: 24, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500))),
          if (qty != '-') Text('$qty items', style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(width: 16),
          Text(cost, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildInlineStat(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(label, style: const TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.bold)),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(value, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Future<void> _showAddImportDialog(BuildContext context, WidgetRef ref, {BottleImport? imp}) async {
    final supplierController = TextEditingController(text: imp?.supplierName);
    final smallQtyController = TextEditingController(text: imp?.smallBottleQty.toString() ?? '0');
    final smallCostController = TextEditingController(text: imp?.smallBottleCost.toString() ?? '0');
    final largeQtyController = TextEditingController(text: imp?.largeBottleQty.toString() ?? '0');
    final largeCostController = TextEditingController(text: imp?.largeBottleCost.toString() ?? '0');
    final sealCostController = TextEditingController(text: imp?.sealCost.toString() ?? '0');
    final plasticCostController = TextEditingController(text: imp?.plasticCost.toString() ?? '0');
    final capCostController = TextEditingController(text: imp?.capCost.toString() ?? '0');
    final extraChargesController = TextEditingController(text: imp?.extraCharges.toString() ?? '0');
    final descriptionController = TextEditingController(text: imp?.description);
    DateTime selectedDate = imp?.date ?? DateTime.now();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          double calculateTotal() {
            // Helper to clean and parse doubles
            double parseValue(String val) => double.tryParse(val.replaceAll(',', '.')) ?? 0.0;
            int parseQty(String val) => int.tryParse(val) ?? 0;

            final sQty = parseQty(smallQtyController.text);
            final sCost = parseValue(smallCostController.text);
            final lQty = parseQty(largeQtyController.text);
            final lCost = parseValue(largeCostController.text);
            final seal = parseValue(sealCostController.text);
            final plastic = parseValue(plasticCostController.text);
            final cap = parseValue(capCostController.text);
            final extra = parseValue(extraChargesController.text);
            return (sQty * sCost) + (lQty * lCost) + seal + plastic + cap + extra;
          }

          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 20, right: 20, top: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(imp == null ? 'Add Import' : 'Edit Import', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  TextField(controller: supplierController, decoration: const InputDecoration(labelText: 'Supplier Name', border: OutlineInputBorder())),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: TextField(controller: smallQtyController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Small Qty', border: OutlineInputBorder()), onChanged: (_) => setModalState(() {}))),
                      const SizedBox(width: 8),
                      Expanded(child: TextField(controller: smallCostController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Cost/Small', border: OutlineInputBorder()), onChanged: (_) => setModalState(() {}))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: TextField(controller: largeQtyController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Large Bottles Qty', border: OutlineInputBorder()), onChanged: (_) => setModalState(() {}))),
                      const SizedBox(width: 8),
                      Expanded(child: TextField(controller: largeCostController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Cost/Large', border: OutlineInputBorder()), onChanged: (_) => setModalState(() {}))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Accessory Prices (Total Amount Spent)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                  const SizedBox(height: 8),
                  TextField(controller: sealCostController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Seals Price (Spent Rs)', border: OutlineInputBorder()), onChanged: (_) => setModalState(() {})),
                  const SizedBox(height: 8),
                  TextField(controller: plasticCostController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Plastic Price (Spent Rs)', border: OutlineInputBorder()), onChanged: (_) => setModalState(() {})),
                  const SizedBox(height: 8),
                  TextField(controller: capCostController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Caps Price (Spent Rs)', border: OutlineInputBorder()), onChanged: (_) => setModalState(() {})),
                  const SizedBox(height: 12),
                  TextField(controller: extraChargesController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Extra Charges', border: OutlineInputBorder()), onChanged: (_) => setModalState(() {})),
                  const SizedBox(height: 12),
                  TextField(controller: descriptionController, decoration: const InputDecoration(labelText: 'Description (Optional)', border: OutlineInputBorder())),
                  const SizedBox(height: 12),
                  ListTile(
                    title: Text('Date: ${DateFormat('dd MMM yyyy').format(selectedDate)}'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final date = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2020), lastDate: DateTime.now());
                      if (date != null) setModalState(() => selectedDate = date);
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Cost:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('Rs. ${calculateTotal().toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (supplierController.text.isEmpty) return;
                        final isar = ref.read(isarProvider);
                        final dbService = ref.read(databaseServiceProvider);
                        
                        final smallQty = int.tryParse(smallQtyController.text) ?? 0;
                        final largeQty = int.tryParse(largeQtyController.text) ?? 0;

                        // FIXED: Transaction only for database write
                        await isar.writeTxn(() async {
                          final currentImport = imp ?? BottleImport();
                          
                          // Helper to parse text safely
                          double parseV(String val) => double.tryParse(val.replaceAll(',', '.')) ?? 0.0;

                          currentImport
                            ..supplierName = supplierController.text
                            ..smallBottleQty = int.tryParse(smallQtyController.text) ?? 0
                            ..smallBottleCost = parseV(smallCostController.text)
                            ..largeBottleQty = int.tryParse(largeQtyController.text) ?? 0
                            ..largeBottleCost = parseV(largeCostController.text)
                            ..sealCost = parseV(sealCostController.text)
                            ..plasticCost = parseV(plasticCostController.text)
                            ..capCost = parseV(capCostController.text)
                            ..extraCharges = parseV(extraChargesController.text)
                            ..totalCost = calculateTotal()
                            ..description = descriptionController.text
                            ..date = selectedDate;
                          
                          await isar.collection<BottleImport>().put(currentImport);
                        });

                        // Inventory updates automatically via history!
                        
                        await dbService.logActivity('${imp == null ? "Added" : "Updated"} import from ${supplierController.text}');
                        
                        if (context.mounted) Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white, padding: const EdgeInsets.all(16)),
                      child: const Text('Save Import'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _deleteImport(BuildContext context, WidgetRef ref, int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Import?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete', style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true) {
      final isar = ref.read(isarProvider);
      final dbService = ref.read(databaseServiceProvider);
      
      // FIXED: Get import BEFORE transaction
      final imp = await isar.collection<BottleImport>().get(id);
      
      // FIXED: Transaction only for delete
      await isar.writeTxn(() async {
        if (imp != null) {
          await isar.collection<BottleImport>().delete(id);
        }
      });
      
      // FIXED: Activity log OUTSIDE the transaction
      if (imp != null) {
        await dbService.logActivity('Deleted import from ${imp.supplierName}');
      }
    }
  }
}
