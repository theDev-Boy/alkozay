import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';
import 'receipt_preview_screen.dart';

class ShopDetailPage extends ConsumerStatefulWidget {
  final int shopId;
  const ShopDetailPage({super.key, required this.shopId});

  @override
  ConsumerState<ShopDetailPage> createState() => _ShopDetailPageState();
}

class _ShopDetailPageState extends ConsumerState<ShopDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isar = ref.watch(isarProvider);
    final theme = Theme.of(context);

    return StreamBuilder<Shop?>(
      stream: isar.collection<Shop>().watchObject(widget.shopId, fireImmediately: true),
      builder: (context, snapshot) {
        final shop = snapshot.data;
        if (shop == null) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(shop.name),
          ),
          body: Column(
            children: [
              _buildHeader(context, shop),
              TabBar(
                controller: _tabController,
                indicatorColor: theme.primaryColor,
                labelColor: theme.primaryColor,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'Bills / History'),
                  Tab(text: 'Payment History'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _BillsTab(shopId: shop.id),
                    _PaymentsTab(shopId: shop.id),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showAddBillDialog(context, shop),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, Shop shop) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: theme.primaryColor,
            child: Text(
              shop.name[0].toUpperCase(),
              style: const TextStyle(
                  fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            shop.name,
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('Current Balance Due',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          Text(
            'Rs. ${shop.totalDue.toStringAsFixed(0)}',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w900, color: theme.primaryColor),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showAddPaymentDialog(context, shop),
              icon: const Icon(Icons.payments),
              label: const Text('Add Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── ADD / EDIT BILL ──────────────────────────────────────────────────────────
  Future<void> _showAddBillDialog(BuildContext context, Shop shop,
      {Bill? existingBill}) async {
    int smallQty = existingBill?.smallPackQty ?? 0;
    int largeQty = existingBill?.largePackQty ?? 0;
    final descriptionController =
        TextEditingController(text: existingBill?.description ?? '');
    DateTime selectedDate = existingBill?.date ?? DateTime.now();

    final settings =
        await ref.read(isarProvider).collection<AppSettings>().get(1);
    final smallPrice = settings?.smallPackPrice ?? 320.0;
    final largePrice = settings?.largePackPrice ?? 320.0;

    if (!context.mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          double totalPrice =
              (smallQty * smallPrice) + (largeQty * largePrice);

          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20,
                right: 20,
                top: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    existingBill == null ? 'New Bill' : 'Edit Bill',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildQtyRow('Small Packs (Rs.$smallPrice each)', smallQty,
                      (val) => setModalState(() => smallQty = val)),
                  const SizedBox(height: 12),
                  _buildQtyRow('Large Packs (Rs.$largePrice each)', largeQty,
                      (val) => setModalState(() => largeQty = val)),
                  const SizedBox(height: 20),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        labelText: 'Description (Optional)',
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    title: Text(
                        'Date: ${DateFormat('dd MMM yyyy').format(selectedDate)}'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setModalState(() => selectedDate = date);
                      }
                    },
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Price:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          'Rs. ${totalPrice.toStringAsFixed(0)}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (smallQty == 0 && largeQty == 0) return;
                        final isar = ref.read(isarProvider);
                        final dbService = ref.read(databaseServiceProvider);

                        final inventory = ref.read(bottleInventoryProvider);
                        final neededSmall = smallQty * 12;
                        final neededLarge = largeQty * 6;

                        if (existingBill == null) {
                          if (inventory.totalSmallBottles < neededSmall ||
                              inventory.totalLargeBottles < neededLarge) {
                            if (context.mounted) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Insufficient Stock!',
                                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (inventory.totalSmallBottles < neededSmall)
                                        Text('Small: need $neededSmall but have ${inventory.totalSmallBottles}'),
                                      if (inventory.totalLargeBottles < neededLarge)
                                        Text('Large: need $neededLarge but have ${inventory.totalLargeBottles}'),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
                                  ],
                                ),
                              );
                            }
                            return;
                          }
                        }

                        try {
                          await isar.writeTxn(() async {
                            if (existingBill == null) {
                              final bill = Bill()
                                ..shopId = shop.id
                                ..smallPackQty = smallQty
                                ..largePackQty = largeQty
                                ..totalPrice = totalPrice
                                ..description = descriptionController.text
                                ..date = selectedDate;
                              await isar.collection<Bill>().put(bill);
                              shop.totalDue += totalPrice;
                              await isar.collection<Shop>().put(shop);
                            } else {
                              final oldTotal = existingBill.totalPrice;
                              existingBill
                                ..smallPackQty = smallQty
                                ..largePackQty = largeQty
                                ..totalPrice = totalPrice
                                ..description = descriptionController.text
                                ..date = selectedDate;
                              await isar.collection<Bill>().put(existingBill);
                              shop.totalDue = shop.totalDue - oldTotal + totalPrice;
                              await isar.collection<Shop>().put(shop);
                            }
                          });
                          
                          await dbService.logActivity('${existingBill == null ? "Added" : "Updated"} bill of Rs. ${totalPrice.toStringAsFixed(0)} for ${shop.name}');
                          if (context.mounted) Navigator.pop(context);
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(16)),
                      child: Text(existingBill == null ? 'Save Bill' : 'Update Bill'),
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

  Widget _buildQtyRow(String label, int qty, Function(int) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(label,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () => qty > 0 ? onChanged(qty - 1) : null,
                icon: const Icon(Icons.remove_circle_outline)),
            SizedBox(
                width: 40,
                child: Center(
                    child: Text('$qty',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)))),
            IconButton(
                onPressed: () => onChanged(qty + 1),
                icon: const Icon(Icons.add_circle_outline)),
          ],
        ),
      ],
    );
  }

  // ── ADD PAYMENT ──────────────────────────────────────────────────────────────
  Future<void> _showAddPaymentDialog(BuildContext context, Shop shop) async {
    final amountController = TextEditingController();
    final descriptionController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
              top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Add Payment',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Amount (Rs.)',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Description (Optional)',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              ListTile(
                title: Text(
                    'Date: ${DateFormat('dd MMM yyyy').format(selectedDate)}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    setModalState(() => selectedDate = date);
                  }
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final amount =
                        double.tryParse(amountController.text) ?? 0.0;
                    if (amount <= 0) return;

                    final isar = ref.read(isarProvider);
                    final dbService = ref.read(databaseServiceProvider);

                    // FIXED: Transaction only for database operations
                    await isar.writeTxn(() async {
                      final prevDue = shop.totalDue;
                      final newDue = prevDue - amount;

                      final payment = Payment()
                        ..shopId = shop.id
                        ..amount = amount
                        ..description = descriptionController.text
                        ..date = selectedDate
                        ..prevDue = prevDue
                        ..newDue = newDue;

                      await isar.collection<Payment>().put(payment);
                      shop.totalDue = newDue;
                      await isar.collection<Shop>().put(shop);
                    });
                    
                    // FIXED: Activity log OUTSIDE the transaction
                    await dbService.logActivity(
                        'Received payment of Rs. ${amount.toStringAsFixed(0)} from ${shop.name}');
                    
                    if (context.mounted) Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16)),
                  child: const Text('Save Payment'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ── BILLS TAB ────────────────────────────────────────────────────────────────
class _BillsTab extends ConsumerWidget {
  final int shopId;
  const _BillsTab({required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.watch(isarProvider);

    return StreamBuilder<List<Bill>>(
      stream: isar
          .collection<Bill>()
          .filter()
          .shopIdEqualTo(shopId)
          .sortByDateDesc()
          .watch(fireImmediately: true),
      builder: (context, snapshot) {
        final bills = snapshot.data ?? [];
        if (bills.isEmpty) {
          return const Center(
              child: Text('No bills yet',
                  style: TextStyle(color: Colors.grey)));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: bills.length,
          itemBuilder: (context, index) {
            final bill = bills[index];
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
                            Text(
                                DateFormat('dd MMM yyyy').format(bill.date),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(
                                bill.description?.isNotEmpty == true
                                    ? bill.description!
                                    : 'Standard Delivery',
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        Text(
                          'Rs. ${bill.totalPrice.toStringAsFixed(0)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _buildBadge('Small: ${bill.smallPackQty} Packs', color: Colors.blue[50]),
                        _buildBadge('Large: ${bill.largePackQty} Packs', color: Colors.orange[50]),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextButton.icon(
                              onPressed: () async {
                                final isar = ref.read(isarProvider);
                                final shop = await isar.collection<Shop>().get(shopId);
                                if (shop != null && context.mounted) {
                                  final state = context.findAncestorStateOfType<_ShopDetailPageState>();
                                  state?._showAddBillDialog(context, shop, existingBill: bill);
                                }
                              },
                              icon: const Icon(Icons.edit, size: 16),
                              label: const Text('EDIT'),
                            ),
                            TextButton.icon(
                              onPressed: () => _deleteBill(context, ref, bill),
                              icon: const Icon(Icons.delete, size: 16, color: Colors.red),
                              label: const Text('DELETE', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                        OutlinedButton.icon(
                          onPressed: () async {
                            final isar = ref.read(isarProvider);
                            final shop = await isar.collection<Shop>().get(shopId);
                            if (shop != null && context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ReceiptPreviewScreen(
                                    shop: shop,
                                    bill: bill,
                                    prevBalance: shop.totalDue - bill.totalPrice,
                                  ),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.picture_as_pdf, size: 16),
                          label: const Text('RECEIPT'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBadge(String text, {Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: color ?? Colors.grey[200], borderRadius: BorderRadius.circular(6)),
      child: Text(text,
          style:
              const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Future<void> _deleteBill(
      BuildContext context, WidgetRef ref, Bill bill) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Bill?'),
        content:
            const Text('This will reduce the shop\'s due balance and return bottles to inventory.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete',
                  style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true) {
      final isar = ref.read(isarProvider);
      final dbService = ref.read(databaseServiceProvider);
      
      // Delete bill & update shop due
      await isar.writeTxn(() async {
        final shop = await isar.collection<Shop>().get(bill.shopId);
        if (shop != null) {
          shop.totalDue -= bill.totalPrice;
          await isar.collection<Shop>().put(shop);
          await isar.collection<Bill>().delete(bill.id);
        }
      });

      // Inventory updates automatically via history!
      
      // Log activity
      await dbService.logActivity(
          'Deleted bill of Rs. ${bill.totalPrice.toStringAsFixed(0)}');
    }
  }
}

// ── PAYMENTS TAB ─────────────────────────────────────────────────────────────
class _PaymentsTab extends ConsumerWidget {
  final int shopId;
  const _PaymentsTab({required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.watch(isarProvider);

    return StreamBuilder<List<Payment>>(
      stream: isar
          .collection<Payment>()
          .filter()
          .shopIdEqualTo(shopId)
          .sortByDateDesc()
          .watch(fireImmediately: true),
      builder: (context, snapshot) {
        final payments = snapshot.data ?? [];
        if (payments.isEmpty) {
          return const Center(
              child: Text('No payments yet',
                  style: TextStyle(color: Colors.grey)));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: payments.length,
          itemBuilder: (context, index) {
            final payment = payments[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DateFormat('dd MMM yyyy').format(payment.date),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            'Rs. ${payment.amount.toStringAsFixed(0)}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 18)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (payment.description != null &&
                        payment.description!.isNotEmpty)
                      Text(payment.description!, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Prev: Rs. ${payment.prevDue.toStringAsFixed(0)}',
                            style: const TextStyle(fontSize: 10)),
                        Text(
                            'After: Rs. ${payment.newDue.toStringAsFixed(0)}',
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () => _showEditPaymentDialog(context, ref, payment),
                          icon: const Icon(Icons.edit, size: 14),
                          label: const Text('EDIT', style: TextStyle(fontSize: 11)),
                        ),
                        TextButton.icon(
                          onPressed: () => _deletePayment(context, ref, payment),
                          icon: const Icon(Icons.delete, size: 14, color: Colors.red),
                          label: const Text('DELETE', style: TextStyle(color: Colors.red, fontSize: 11)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _deletePayment(BuildContext context, WidgetRef ref, Payment payment) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Payment?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Delete', style: TextStyle(color: Colors.red))),
        ],
      ),
    );

    if (confirm == true) {
      final isar = ref.read(isarProvider);
      final dbService = ref.read(databaseServiceProvider);
      await isar.writeTxn(() async {
        final shop = await isar.collection<Shop>().get(payment.shopId);
        if (shop != null) {
          shop.totalDue += payment.amount; // Give amount back to shop due!
          await isar.collection<Shop>().put(shop);
          await isar.collection<Payment>().delete(payment.id);
        }
      });
      await dbService.logActivity('Deleted payment of Rs. ${payment.amount}');
    }
  }

  Future<void> _showEditPaymentDialog(BuildContext context, WidgetRef ref, Payment payment) async {
    final controller = TextEditingController(text: payment.amount.toStringAsFixed(0));
    final descController = TextEditingController(text: payment.description);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit Payment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: controller, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Amount (Rs.)')),
            TextField(controller: descController, decoration: const InputDecoration(labelText: 'Note (Optional)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              final newAmount = double.tryParse(controller.text) ?? payment.amount;
              final isar = ref.read(isarProvider);
              final dbService = ref.read(databaseServiceProvider);

              await isar.writeTxn(() async {
                final shop = await isar.collection<Shop>().get(payment.shopId);
                if (shop != null) {
                  // Formula: reverse old payment, apply new payment
                  shop.totalDue = (shop.totalDue + payment.amount) - newAmount;
                  await isar.collection<Shop>().put(shop);
                  
                  payment.amount = newAmount;
                  payment.description = descController.text;
                  payment.newDue = payment.prevDue - newAmount; // Update the record history
                  await isar.collection<Payment>().put(payment);
                }
              });
              await dbService.logActivity('Updated payment to Rs. $newAmount');
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}
