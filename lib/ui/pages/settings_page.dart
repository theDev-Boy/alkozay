import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:isar/isar.dart';
import '../../providers/providers.dart';
import '../../models/models.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: settingsAsync.when(
        data: (settings) {
          if (settings == null) {
            return const Center(child: Text('Error loading settings'));
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildSectionHeader('Appearance'),
              _buildSettingCard(
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      controlAffinity: ListTileControlAffinity.trailing,
                      secondary: const Icon(Icons.dark_mode),
                      value: settings.isDarkMode,
                      onChanged: (val) =>
                          _updateSettings(ref, settings..isDarkMode = val),
                    ),
                    ListTile(
                      title: const Text('Accent Color'),
                      leading: const Icon(Icons.palette),
                      trailing: CircleAvatar(
                          backgroundColor:
                              Color(settings.accentColorValue),
                          radius: 12),
                      onTap: () =>
                          _showColorPicker(context, ref, settings),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              _buildSectionHeader('Pricing (Standard)'),
              _buildSettingCard(
                child: Column(
                  children: [
                    _buildPriceTile(context, ref, settings,
                        'Small Pack (500ml)', settings.smallPackPrice, true),
                    const Divider(height: 1),
                    _buildPriceTile(context, ref, settings,
                        'Large Pack (1.5L)', settings.largePackPrice, false),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              _buildSectionHeader('Data Management'),
              _buildSettingCard(
                child: Column(
                  children: [
                    ListTile(
                      leading:
                          const Icon(Icons.backup, color: Colors.blue),
                      title: const Text('Export Backup'),
                      subtitle: const Text(
                          'Save all data as JSON file',
                          style: TextStyle(fontSize: 11)),
                      onTap: () => _exportData(context, ref),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(
                          Icons.settings_backup_restore,
                          color: Colors.green),
                      title: const Text('Import Backup'),
                      subtitle: const Text('Restore from JSON backup file',
                          style: TextStyle(fontSize: 11)),
                      onTap: () => _importData(context, ref),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.delete_forever,
                          color: Colors.red),
                      title: const Text('Clear All Data',
                          style: TextStyle(color: Colors.red)),
                      subtitle: const Text('Wipe everything permanently',
                          style:
                              TextStyle(fontSize: 11, color: Colors.red)),
                      onTap: () => _deleteAllData(context, ref),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Error')),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Text(title,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey)),
    );
  }

  Widget _buildSettingCard({required Widget child}) {
    return Card(child: child);
  }

  Widget _buildPriceTile(BuildContext context, WidgetRef ref,
      AppSettings settings, String label, double price, bool isSmall) {
    return ListTile(
      title: Text(label),
      trailing: Text('Rs. ${price.toStringAsFixed(0)}',
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue)),
      onTap: () => _showPriceEditDialog(
          context, ref, settings, label, price, isSmall),
    );
  }

  Future<void> _updateSettings(
      WidgetRef ref, AppSettings settings) async {
    final isar = ref.read(isarProvider);
    await isar.writeTxn(() async {
      await isar.collection<AppSettings>().put(settings);
    });
  }

  Future<void> _showPriceEditDialog(
      BuildContext context,
      WidgetRef ref,
      AppSettings settings,
      String label,
      double currentPrice,
      bool isSmall) async {
    final controller =
        TextEditingController(text: currentPrice.toStringAsFixed(0));
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $label Price'),
        content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(labelText: 'Price (Rs.)')),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              final newPrice =
                  double.tryParse(controller.text) ?? currentPrice;
              if (isSmall) {
                settings.smallPackPrice = newPrice;
              } else {
                settings.largePackPrice = newPrice;
              }
              _updateSettings(ref, settings);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showColorPicker(
      BuildContext context, WidgetRef ref, AppSettings settings) {
    final colors = [
      0xFF1162D4,
      0xFFE91E63,
      0xFF9C27B0,
      0xFF4CAF50,
      0xFFFF9800,
      0xFF795548,
      0xFF009688,
      0xFFF44336,
    ];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Accent Color'),
        content: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: colors
              .map((c) => GestureDetector(
                    onTap: () {
                      settings.accentColorValue = c;
                      _updateSettings(ref, settings);
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                        backgroundColor: Color(c),
                        child: settings.accentColorValue == c
                            ? const Icon(Icons.check,
                                color: Colors.white, size: 18)
                            : null),
                  ))
              .toList(),
        ),
      ),
    );
  }

  // ── REAL EXPORT ──────────────────────────────────────────────────────────────
  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    try {
      final isar = ref.read(isarProvider);
      final shops =
          await isar.collection<Shop>().where().findAll();
      final bills =
          await isar.collection<Bill>().where().findAll();
      final payments =
          await isar.collection<Payment>().where().findAll();
      final imports =
          await isar.collection<BottleImport>().where().findAll();
      final expenses =
          await isar.collection<Expense>().where().findAll();

      final data = {
        'version': 1,
        'exportedAt': DateTime.now().toIso8601String(),
        'shops': shops
            .map((e) => {
                  'id': e.id,
                  'name': e.name,
                  'totalDue': e.totalDue,
                })
            .toList(),
        'bills': bills
            .map((e) => {
                  'id': e.id,
                  'shopId': e.shopId,
                  'smallPackQty': e.smallPackQty,
                  'largePackQty': e.largePackQty,
                  'totalPrice': e.totalPrice,
                  'description': e.description,
                  'date': e.date.toIso8601String(),
                })
            .toList(),
        'payments': payments
            .map((e) => {
                  'id': e.id,
                  'shopId': e.shopId,
                  'amount': e.amount,
                  'description': e.description,
                  'date': e.date.toIso8601String(),
                  'prevDue': e.prevDue,
                  'newDue': e.newDue,
                })
            .toList(),
        'imports': imports
            .map((e) => {
                  'id': e.id,
                  'supplierName': e.supplierName,
                  'smallBottleQty': e.smallBottleQty,
                  'smallBottleCost': e.smallBottleCost,
                  'largeBottleQty': e.largeBottleQty,
                  'largeBottleCost': e.largeBottleCost,
                  'extraCharges': e.extraCharges,
                  'totalCost': e.totalCost,
                  'sealCost': e.sealCost,
                  'capCost': e.capCost,
                  'plasticCost': e.plasticCost,
                  'description': e.description,
                  'date': e.date.toIso8601String(),
                })
            .toList(),
        'expenses': expenses
            .map((e) => {
                  'id': e.id,
                  'reason': e.reason,
                  'amount': e.amount,
                  'date': e.date.toIso8601String(),
                })
            .toList(),
      };

      final dir = await getTemporaryDirectory();
      final fileName =
          'alkozay_backup_${DateTime.now().millisecondsSinceEpoch}.json';
      final file = File('${dir.path}/$fileName');
      await file.writeAsString(jsonEncode(data));

      // Share the file so user can save/send it
      await Share.shareXFiles(
        [XFile(file.path)],
        subject: 'Alkozay Backup - $fileName',
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Export failed: $e'),
              backgroundColor: Colors.red),
        );
      }
    }
  }

  // ── REAL IMPORT ──────────────────────────────────────────────────────────────
  Future<void> _importData(BuildContext context, WidgetRef ref) async {
    // Confirm before wiping
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Import Backup?'),
        content: const Text(
            'This will REPLACE all current data with the backup file. Are you sure?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('Pick File & Import',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      // Pick JSON file
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result == null || result.files.single.path == null) return;

      final file = File(result.files.single.path!);
      final content = await file.readAsString();
      final data = jsonDecode(content) as Map<String, dynamic>;

      final isar = ref.read(isarProvider);

      await isar.writeTxn(() async {
        // Clear existing data
        await isar.collection<Shop>().clear();
        await isar.collection<Bill>().clear();
        await isar.collection<Payment>().clear();
        await isar.collection<BottleImport>().clear();
        await isar.collection<Expense>().clear();
        await isar.collection<ActivityLog>().clear();

        // Restore shops
        for (final s in (data['shops'] as List)) {
          await isar.collection<Shop>().put(Shop()
            ..id = s['id']
            ..name = s['name']
            ..totalDue = (s['totalDue'] as num).toDouble());
        }

        // Restore bills
        for (final b in (data['bills'] as List)) {
          await isar.collection<Bill>().put(Bill()
            ..id = b['id']
            ..shopId = b['shopId']
            ..smallPackQty = b['smallPackQty']
            ..largePackQty = b['largePackQty']
            ..totalPrice = (b['totalPrice'] as num).toDouble()
            ..description = b['description']
            ..date = DateTime.parse(b['date']));
        }

        // Restore payments
        for (final p in (data['payments'] as List)) {
          await isar.collection<Payment>().put(Payment()
            ..id = p['id']
            ..shopId = p['shopId']
            ..amount = (p['amount'] as num).toDouble()
            ..description = p['description']
            ..date = DateTime.parse(p['date'])
            ..prevDue = (p['prevDue'] as num).toDouble()
            ..newDue = (p['newDue'] as num).toDouble());
        }

        // Restore imports
        for (final i in (data['imports'] as List)) {
          await isar.collection<BottleImport>().put(BottleImport()
            ..id = i['id']
            ..supplierName = i['supplierName']
            ..smallBottleQty = i['smallBottleQty']
            ..smallBottleCost = (i['smallBottleCost'] as num).toDouble()
            ..largeBottleQty = i['largeBottleQty']
            ..largeBottleCost = (i['largeBottleCost'] as num).toDouble()
            ..extraCharges = (i['extraCharges'] as num).toDouble()
            ..totalCost = (i['totalCost'] as num).toDouble()
            ..sealCost = (i['sealCost'] as num? ?? 0.0).toDouble()
            ..capCost = (i['capCost'] as num? ?? 0.0).toDouble()
            ..plasticCost = (i['plasticCost'] as num? ?? 0.0).toDouble()
            ..description = i['description']
            ..date = DateTime.parse(i['date']));
        }

        // Restore expenses
        for (final e in (data['expenses'] as List)) {
          await isar.collection<Expense>().put(Expense()
            ..id = e['id']
            ..reason = e['reason']
            ..amount = (e['amount'] as num).toDouble()
            ..date = DateTime.parse(e['date']));
        }

        // Log the restore action
        await isar.collection<ActivityLog>().put(ActivityLog()
          ..action = 'Data restored from backup'
          ..date = DateTime.now());
      });

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Backup restored successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Import failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _deleteAllData(BuildContext context, WidgetRef ref) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete All Data?'),
        content: const Text(
            'This action cannot be undone. All shops, bills, and payments will be wiped.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('WIPE ALL',
                  style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true) {
      final isar = ref.read(isarProvider);
      await isar.writeTxn(() async {
        await isar.collection<Shop>().clear();
        await isar.collection<Bill>().clear();
        await isar.collection<Payment>().clear();
        await isar.collection<BottleImport>().clear();
        await isar.collection<Expense>().clear();
        await isar.collection<ActivityLog>().clear();
      });
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('All data wiped')));
      }
    }
  }
}
