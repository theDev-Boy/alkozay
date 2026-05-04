import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:isar/isar.dart';
import '../../providers/providers.dart';
import '../../models/models.dart';

class ReportsPage extends ConsumerStatefulWidget {
  const ReportsPage({super.key});

  @override
  ConsumerState<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends ConsumerState<ReportsPage> {
  DateTime _selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final isar = ref.watch(isarProvider);

    final startOfMonth =
        DateTime(_selectedMonth.year, _selectedMonth.month, 1);
    final endOfMonth = DateTime(
        _selectedMonth.year, _selectedMonth.month + 1, 0, 23, 59, 59);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports & Analytics'),
        actions: [
          TextButton.icon(
            onPressed: () => _selectMonth(context),
            icon: const Icon(Icons.calendar_month),
            label: Text(DateFormat('MMM yyyy').format(_selectedMonth)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMonthlyStats(isar, startOfMonth, endOfMonth),
            const SizedBox(height: 25),
            _buildPerformanceChart(isar, startOfMonth, endOfMonth),
            const SizedBox(height: 25),
            _buildExpenseSection(isar, startOfMonth, endOfMonth),
            const SizedBox(height: 25),
            _buildActivitySection(isar, startOfMonth, endOfMonth),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthlyStats(Isar isar, DateTime start, DateTime end) {
    return FutureBuilder<Map<String, double>>(
      future: _calculateStats(isar, start, end),
      builder: (context, snapshot) {
        final stats =
            snapshot.data ?? {'sales': 0, 'payments': 0, 'expenses': 0};
        return Row(
          children: [
            Expanded(
              child: _buildStatCard('Monthly Sales',
                  'Rs. ${stats['sales']?.toStringAsFixed(0)}', Colors.blue),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                  'Monthly Expenses',
                  'Rs. ${stats['expenses']?.toStringAsFixed(0)}',
                  Colors.orange),
            ),
          ],
        );
      },
    );
  }

  Future<Map<String, double>> _calculateStats(
      Isar isar, DateTime start, DateTime end) async {
    final bills = await isar
        .collection<Bill>()
        .filter()
        .dateBetween(start, end)
        .findAll();
    final expenses = await isar
        .collection<Expense>()
        .filter()
        .dateBetween(start, end)
        .findAll();

    double totalSales = 0;
    for (var b in bills) {
      totalSales += b.totalPrice;
    }

    double totalExpenses = 0;
    for (var e in expenses) {
      totalExpenses += e.amount;
    }

    return {'sales': totalSales, 'expenses': totalExpenses};
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(value,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: color)),
        ],
      ),
    );
  }

  // FIXED: Real data bar chart — daily sales for selected month
  Widget _buildPerformanceChart(Isar isar, DateTime start, DateTime end) {
    return FutureBuilder<List<Bill>>(
      future: isar
          .collection<Bill>()
          .filter()
          .dateBetween(start, end)
          .findAll(),
      builder: (context, snapshot) {
        final bills = snapshot.data ?? [];

        // Group by week of month
        final Map<int, double> weekSales = {1: 0, 2: 0, 3: 0, 4: 0};
        for (var bill in bills) {
          final week = ((bill.date.day - 1) ~/ 7) + 1;
          final w = week > 4 ? 4 : week;
          weekSales[w] = (weekSales[w] ?? 0) + bill.totalPrice;
        }

        final maxY = weekSales.values.fold(0.0, (a, b) => b > a ? b : a);
        final hasData = maxY > 0;

        return AspectRatio(
          aspectRatio: 1.7,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sales by Week — ${DateFormat('MMMM yyyy').format(_selectedMonth)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: hasData
                        ? BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceAround,
                              maxY: maxY * 1.3,
                              barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                                  getTooltipItem:
                                      (group, groupIndex, rod, rodIndex) {
                                    return BarTooltipItem(
                                      'Rs. ${rod.toY.toStringAsFixed(0)}',
                                      const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11),
                                    );
                                  },
                                ),
                              ),
                              titlesData: FlTitlesData(
                                leftTitles: const AxisTitles(
                                    sideTitles:
                                        SideTitles(showTitles: false)),
                                rightTitles: const AxisTitles(
                                    sideTitles:
                                        SideTitles(showTitles: false)),
                                topTitles: const AxisTitles(
                                    sideTitles:
                                        SideTitles(showTitles: false)),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      final labels = [
                                        'W1', 'W2', 'W3', 'W4'
                                      ];
                                      final i = value.toInt() - 1;
                                      if (i < 0 || i >= labels.length) {
                                        return const SizedBox();
                                      }
                                      return Text(labels[i],
                                          style: const TextStyle(
                                              fontSize: 11));
                                    },
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                                getDrawingHorizontalLine: (v) => FlLine(
                                    color: Colors.grey.withOpacity(0.1),
                                    strokeWidth: 1),
                              ),
                              barGroups: [
                                for (int w = 1; w <= 4; w++)
                                  BarChartGroupData(
                                    x: w,
                                    barRods: [
                                      BarChartRodData(
                                        toY: weekSales[w] ?? 0,
                                        color: Theme.of(context).primaryColor,
                                        width: 22,
                                        borderRadius:
                                            BorderRadius.circular(6),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          )
                        : const Center(
                            child: Text(
                              'No sales this month',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 13),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExpenseSection(Isar isar, DateTime start, DateTime end) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Expense Log',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            IconButton(
              onPressed: () => _showAddExpenseDialog(context),
              icon: const Icon(Icons.add_circle, color: Colors.blue),
            ),
          ],
        ),
        StreamBuilder<List<Expense>>(
          stream: isar
              .collection<Expense>()
              .filter()
              .dateBetween(start, end)
              .sortByDateDesc()
              .watch(fireImmediately: true),
          builder: (context, snapshot) {
            final data = snapshot.data ?? [];
            if (data.isEmpty) {
              return const Text('No expenses recorded this month',
                  style: TextStyle(color: Colors.grey, fontSize: 12));
            }
            return Column(
              children: data
                  .map((e) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(e.reason),
                        subtitle:
                            Text(DateFormat('dd MMM').format(e.date)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Rs. ${e.amount.toStringAsFixed(0)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  size: 18, color: Colors.red),
                              onPressed: () =>
                                  _deleteExpense(context, isar, e),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ],
    );
  }

  Future<void> _deleteExpense(
      BuildContext context, Isar isar, Expense expense) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Expense?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Delete',
                  style: TextStyle(color: Colors.red))),
        ],
      ),
    );
    if (confirm == true) {
      await isar.writeTxn(() async {
        await isar.collection<Expense>().delete(expense.id);
      });
    }
  }

  Widget _buildActivitySection(Isar isar, DateTime start, DateTime end) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Activity Log',
            style:
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        StreamBuilder<List<ActivityLog>>(
          stream: isar
              .collection<ActivityLog>()
              .filter()
              .dateBetween(start, end)
              .sortByDateDesc()
              .watch(fireImmediately: true),
          builder: (context, snapshot) {
            final data = snapshot.data ?? [];
            if (data.isEmpty) {
              return const Text('No activity logs',
                  style: TextStyle(color: Colors.grey, fontSize: 12));
            }
            return Column(
              children: data
                  .take(20)
                  .map((a) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            const Icon(Icons.history,
                                size: 14, color: Colors.grey),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Text(a.action,
                                    style:
                                        const TextStyle(fontSize: 12))),
                            Text(
                                DateFormat('hh:mm a').format(a.date),
                                style: const TextStyle(
                                    fontSize: 10, color: Colors.grey)),
                          ],
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ],
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

  Future<void> _showAddExpenseDialog(BuildContext context) async {
    final reasonController = TextEditingController();
    final amountController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    if (!context.mounted) return;

    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
            title: const Text('Add Expense'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: reasonController,
                    decoration: const InputDecoration(
                      labelText: 'Reason',
                      border: OutlineInputBorder(),
                    ),
                    autofocus: true,
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount (Rs.)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Date: ${DateFormat('dd MMM yyyy').format(selectedDate)}'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setDialogState(() => selectedDate = date);
                      }
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                // FIXED: Save button now works properly
                onPressed: () => _saveExpense(
                  reasonController.text,
                  amountController.text,
                  selectedDate,
                ),
                child: const Text('Save'),
              ),
            ],
          );
        },
      ),
    );
  }

  // FIXED: Removed transaction nesting
  Future<void> _saveExpense(
    String reason,
    String amountStr,
    DateTime selectedDate,
  ) async {
    final amount = double.tryParse(amountStr) ?? 0.0;

    if (reason.isEmpty || amount <= 0) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter valid reason and amount')),
        );
      }
      return;
    }

    try {
      final isar = ref.read(isarProvider);
      final dbService = ref.read(databaseServiceProvider);

      // FIXED: Transaction only for database write
      await isar.writeTxn(() async {
        await isar.collection<Expense>().put(
          Expense()
            ..reason = reason
            ..amount = amount
            ..date = selectedDate,
        );
      });

      // FIXED: Activity log OUTSIDE the transaction
      await dbService.logActivity(
        'Added expense: $reason (Rs. ${amount.toStringAsFixed(0)})',
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Expense saved successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }
}
