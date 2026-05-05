import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/providers.dart';
import '../../models/models.dart';

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  DateTime _selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final bills = ref.watch(billsProvider).value ?? [];
    final shops = ref.watch(shopsProvider).value ?? [];
    final theme = Theme.of(context);
    
    // Lifetime totals
    int totalSmallPacks = 0;
    int totalLargePacks = 0;
    for (var bill in bills) {
      totalSmallPacks += bill.smallPackQty;
      totalLargePacks += bill.largePackQty;
    }

    // Selected month totals
    final startOfMonth = DateTime(_selectedMonth.year, _selectedMonth.month, 1);
    final endOfMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0, 23, 59, 59);
    
    int monthSmallPacks = 0;
    int monthLargePacks = 0;
    final monthlyBills = bills.where((b) => 
      b.date.isAfter(startOfMonth.subtract(const Duration(seconds: 1))) && 
      b.date.isBefore(endOfMonth)
    ).toList();
    
    for (var bill in monthlyBills) {
      monthSmallPacks += bill.smallPackQty;
      monthLargePacks += bill.largePackQty;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales History'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: TextButton.icon(
              onPressed: () => _selectMonth(context),
              style: TextButton.styleFrom(
                backgroundColor: theme.primaryColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: Icon(Icons.calendar_month, size: 18, color: theme.primaryColor),
              label: Text(
                DateFormat('MMM yyyy').format(_selectedMonth),
                style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lifetime Stats
            const Text('Lifetime Sales', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildPackStatCard('Total Small Packs', totalSmallPacks, Colors.blue, Icons.inventory_2)),
                const SizedBox(width: 12),
                Expanded(child: _buildPackStatCard('Total Large Packs', totalLargePacks, Colors.indigo, Icons.inventory)),
              ],
            ),
            
            const SizedBox(height: 25),
            
            // Monthly Summary Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.primaryColor, theme.primaryColor.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('MMMM yyyy').format(_selectedMonth),
                        style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const Icon(Icons.analytics_outlined, color: Colors.white70, size: 20),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Monthly Performance',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMonthlyStatInfo('Small Packs', monthSmallPacks),
                      Container(width: 1, height: 40, color: Colors.white24),
                      _buildMonthlyStatInfo('Large Packs', monthLargePacks),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            
            // Monthly Transactions List
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Monthly Transactions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('${monthlyBills.length} Bills', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
            const SizedBox(height: 12),
            if (monthlyBills.isEmpty)
              _buildEmptyState()
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: monthlyBills.length,
                itemBuilder: (context, index) {
                  final bill = monthlyBills[index];
                  final shop = shops.firstWhere(
                    (s) => s.id == bill.shopId, 
                    orElse: () => Shop()..name = 'Deleted Shop'
                  );
                  return _buildBillItem(context, bill, shop);
                },
              ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildPackStatCard(String label, int qty, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 12),
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('$qty', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: color)),
        ],
      ),
    );
  }

  Widget _buildMonthlyStatInfo(String label, int qty) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          '$qty',
          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildBillItem(BuildContext context, Bill bill, Shop shop) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.receipt_long, color: theme.primaryColor, size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shop.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(
                  DateFormat('dd MMM | hh:mm a').format(bill.date),
                  style: TextStyle(color: Colors.grey[500], fontSize: 11),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  _buildMiniBadge('${bill.smallPackQty}S', Colors.blue),
                  const SizedBox(width: 4),
                  _buildMiniBadge('${bill.largePackQty}L', Colors.teal),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Rs. ${bill.totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Icon(Icons.history_toggle_off, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No sales records found for this month',
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Future<void> _selectMonth(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedMonth,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (date != null) {
      setState(() => _selectedMonth = date);
    }
  }
}
