import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../providers/providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(dashboardStatsProvider);
    final theme = Theme.of(context);
    final last6 = stats['last6MonthsSales'] as List<Map<String, dynamic>>;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dashboard',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome back, Admin',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.water_drop, color: theme.primaryColor, size: 32),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Summary Stats
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.0, // Reduced from 1.1 to give more height to cards
                children: [
                  _buildStatCard(
                    context,
                    'Total Due',
                    'Rs. ${(stats['totalDue'] as double).toStringAsFixed(0)}',
                    Icons.account_balance_wallet,
                    Colors.orange,
                  ),
                  _buildStatCard(
                    context,
                    'Monthly Sales',
                    'Rs. ${(stats['monthlySales'] as double).toStringAsFixed(0)}',
                    Icons.trending_up,
                    Colors.green,
                  ),
                  _buildStatCard(
                    context,
                    'Receivables',
                    'Rs. ${(stats['monthlyReceivables'] as double).toStringAsFixed(0)}',
                    Icons.payments,
                    Colors.blue,
                  ),
                  _buildStatCard(
                    context,
                    'Active Shops',
                    '${stats['activeShops']}',
                    Icons.storefront,
                    Colors.purple,
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Inventory Quick View
              const Text('Bottle Inventory',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Builder(builder: (context) {
                final inv = ref.watch(bottleInventoryProvider);
                final smallPacks = inv.totalSmallBottles ~/ 12;
                final smallRem = inv.totalSmallBottles % 12;
                final largePacks = inv.totalLargeBottles ~/ 6;
                final largeRem = inv.totalLargeBottles % 6;

                return Column(
                  children: [
                    _buildInventoryItem(
                      'Small Bottles',
                      '${inv.totalSmallBottles} bottles = $smallPacks packs + $smallRem remaining',
                      Colors.cyan,
                    ),
                    const SizedBox(height: 12),
                    _buildInventoryItem(
                      'Large Bottles',
                      '${inv.totalLargeBottles} bottles = $largePacks packs + $largeRem remaining',
                      Colors.indigo,
                    ),
                  ],
                );
              }),

              const SizedBox(height: 25),
              _buildChartCard(context, theme, last6),

              const SizedBox(height: 25),
              _buildCurrentInventoryValueCard(context, ref),
              const SizedBox(height: 20),
              
              const Text('Accessory Total Costs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildSmallCostCard('Seals', stats['sealCost'] as double, Colors.green)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildSmallCostCard('Caps', stats['capCost'] as double, Colors.purple)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildSmallCostCard('Plastic', stats['plasticCost'] as double, Colors.teal)),
                ],
              ),
              
              const SizedBox(height: 20),
              _buildImportCostCard(context, stats['importCost'] as double),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon, Color color) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? theme.cardColor : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryItem(String label, String qty, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Icon(Icons.water_drop, color: color, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(fontSize: 10, color: Colors.grey)),
                Text(qty,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: color,
                        fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallCostCard(String label, double cost, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Rs. ${cost.toStringAsFixed(0)}',
              style: TextStyle(fontWeight: FontWeight.w900, color: color, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImportCostCard(BuildContext context, double cost) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.red.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_shipping, color: Colors.red, size: 20),
          const SizedBox(width: 15),
          const Expanded(
            child: Text(
              'Total Lifetime Import Costs',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          Text(
            'Rs. ${cost.toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentInventoryValueCard(BuildContext context, WidgetRef ref) {
    final inv = ref.watch(bottleInventoryProvider);
    final settings = ref.watch(settingsProvider).value;
    final smallPrice = settings?.smallPackPrice ?? 320.0;
    final largePrice = settings?.largePackPrice ?? 320.0;
    
    final smallValue = (inv.totalSmallBottles / 12) * smallPrice;
    final largeValue = (inv.totalLargeBottles / 6) * largePrice;
    final totalValue = smallValue + largeValue;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.inventory_2, color: Colors.green, size: 20),
              const SizedBox(width: 15),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Stock Status',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(
                      'Ready to sell in store',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Text(
                'Rs. ${totalValue.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.green),
              ),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSmallStockInfo('Small', inv.totalSmallBottles),
              _buildSmallStockInfo('Large', inv.totalLargeBottles),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallStockInfo(String label, int qty) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        Text('$qty btls', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.green)),
      ],
    );
  }

  Widget _buildChartCard(BuildContext context, ThemeData theme, List<Map<String, dynamic>> last6) {
    // Build real chart spots from last 6 months data
    final spots = <FlSpot>[];
    double maxY = 100;
    for (int i = 0; i < last6.length; i++) {
      final sales = (last6[i]['sales'] as double);
      spots.add(FlSpot(i.toDouble(), sales));
      if (sales > maxY) maxY = sales;
    }

    final hasData = spots.any((s) => s.y > 0);

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sales Performance',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Last 6 Months',
                style: TextStyle(fontSize: 11, color: Colors.grey[500]),
              ),
            ],
          ),
          const SizedBox(height: 25),
          if (!hasData)
            const SizedBox(
              height: 180,
              child: Center(
                child: Text(
                  'No sales data yet.\nAdd bills to see the chart.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
            )
          else
            SizedBox(
              height: 180,
              child: LineChart(
                LineChartData(
                  minY: 0,
                  maxY: maxY * 1.2,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.grey.withOpacity(0.1),
                      strokeWidth: 1,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          final idx = value.toInt();
                          if (idx < 0 || idx >= last6.length) return const SizedBox();
                          final month = last6[idx]['month'] as DateTime;
                          return Text(
                            DateFormat('MMM').format(month),
                            style: const TextStyle(fontSize: 10, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: theme.primaryColor,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                          radius: 4,
                          color: theme.primaryColor,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        ),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: theme.primaryColor.withOpacity(0.08),
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
}
