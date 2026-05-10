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

class _HistoryPageState extends ConsumerState<HistoryPage> with SingleTickerProviderStateMixin {
  DateTime _selectedMonth = DateTime.now();
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
    final bills = ref.watch(billsProvider).value ?? [];
    final imports = ref.watch(importsProvider).value ?? [];
    final shops = ref.watch(shopsProvider).value ?? [];
    final theme = Theme.of(context);
    
    // Lifetime Sales Stats
    int totalSmallPacks = 0;
    int totalLargePacks = 0;
    for (var bill in bills) {
      totalSmallPacks += bill.smallPackQty;
      totalLargePacks += bill.largePackQty;
    }

    // Lifetime Import Stats
    int totalSmallBottles = 0;
    int totalLargeBottles = 0;
    for (var imp in imports) {
      totalSmallBottles += imp.smallBottleQty;
      totalLargeBottles += imp.largeBottleQty;
    }

    // Selected month filters
    final startOfMonth = DateTime(_selectedMonth.year, _selectedMonth.month, 1);
    final endOfMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0, 23, 59, 59);
    
    // Monthly Sales Stats
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

    // Monthly Import Stats
    int monthSmallBottles = 0;
    int monthLargeBottles = 0;
    final monthlyImports = imports.where((i) => 
      i.date.isAfter(startOfMonth.subtract(const Duration(seconds: 1))) && 
      i.date.isBefore(endOfMonth)
    ).toList();

    for (var imp in monthlyImports) {
      monthSmallBottles += imp.smallBottleQty;
      monthLargeBottles += imp.largeBottleQty;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Full History'),
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Sales Section ---
                  _buildSectionHeader('Sales Overview', Icons.trending_up, Colors.green),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildSummaryCard('Lifetime Sales', totalSmallPacks, totalLargePacks, 'Packs', Colors.green)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildSummaryCard(DateFormat('MMM yyyy').format(_selectedMonth), monthSmallPacks, monthLargePacks, 'Packs', Colors.blue)),
                    ],
                  ),
                  
                  const SizedBox(height: 25),
                  
                  // --- Imports Section ---
                  _buildSectionHeader('Bottle Imports', Icons.local_shipping, Colors.orange),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildSummaryCard('Lifetime Imports', totalSmallBottles, totalLargeBottles, 'Bottles', Colors.orange)),
                      const SizedBox(width: 12),
                      Expanded(child: _buildSummaryCard(DateFormat('MMM yyyy').format(_selectedMonth), monthSmallBottles, monthLargeBottles, 'Bottles', Colors.deepPurple)),
                    ],
                  ),

                  const SizedBox(height: 30),
                  
                  // --- Detailed Logs Tab Bar ---
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: theme.primaryColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: theme.primaryColor,
                      indicatorWeight: 3,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: const [
                        Tab(text: 'Sales Bills'),
                        Tab(text: 'Bottle Imports'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  
                  // Tab Content (Manual height because inside SingleChildScrollView)
                  SizedBox(
                    height: 500, // Sufficient space for lists
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Sales Bills List
                        monthlyBills.isEmpty 
                          ? _buildEmptyState('No sales bills for this month')
                          : ListView.builder(
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
                        
                        // Bottle Imports List
                        monthlyImports.isEmpty
                          ? _buildEmptyState('No imports for this month')
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: monthlyImports.length,
                              itemBuilder: (context, index) {
                                final imp = monthlyImports[index];
                                return _buildImportItem(context, imp);
                              },
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget _buildSummaryCard(String title, int small, int large, String unit, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildStatRow('Small:', small, unit, color),
          const SizedBox(height: 4),
          _buildStatRow('Large:', large, unit, color),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, int val, String unit, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        Text('$val $unit', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color)),
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
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8)],
      ),
      child: Row(
        children: [
          const Icon(Icons.receipt_long, color: Colors.green, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shop.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(DateFormat('dd MMM | hh:mm a').format(bill.date), style: const TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${bill.smallPackQty}S | ${bill.largePackQty}L', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Text('Rs. ${bill.totalPrice.toStringAsFixed(0)}', style: const TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImportItem(BuildContext context, BottleImport imp) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8)],
      ),
      child: Row(
        children: [
          const Icon(Icons.local_shipping, color: Colors.orange, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(imp.supplierName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text(DateFormat('dd MMM | hh:mm a').format(imp.date), style: const TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${imp.smallBottleQty}S | ${imp.largeBottleQty}L', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              Text('Rs. ${imp.totalCost.toStringAsFixed(0)}', style: const TextStyle(fontSize: 10, color: Colors.orange, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String msg) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_toggle_off, size: 48, color: Colors.grey[300]),
          const SizedBox(height: 8),
          Text(msg, style: TextStyle(color: Colors.grey[500], fontSize: 12)),
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
    if (date != null) setState(() => _selectedMonth = date);
  }
}
