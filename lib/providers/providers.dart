import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../models/models.dart';
import '../services/database_service.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});

final isarProvider = Provider<Isar>((ref) {
  final db = ref.watch(databaseServiceProvider);
  if (!db.isInitialized) throw Exception('Database not initialized');
  return db.isar;
});

// Bills Provider
final billsProvider = StreamProvider<List<Bill>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.collection<Bill>().where().anyId().sortByDateDesc().watch(
    fireImmediately: true,
  );
});

// Payments Provider
final paymentsProvider = StreamProvider<List<Payment>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.collection<Payment>().where().anyId().sortByDateDesc().watch(
    fireImmediately: true,
  );
});

// Settings Provider - FIXED: was using watchLazy() which never fires on startup
final settingsProvider = StreamProvider<AppSettings?>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.collection<AppSettings>().watchObject(1, fireImmediately: true);
});

// Shops Provider
final shopsProvider = StreamProvider<List<Shop>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.collection<Shop>().where().anyId().watch(fireImmediately: true);
});

// Imports Provider
final importsProvider = StreamProvider<List<BottleImport>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.collection<BottleImport>().where().anyId().sortByDateDesc().watch(
    fireImmediately: true,
  );
});

// NEW: Auto-Calculating Bottle Inventory Provider (100% Correct & Real-time)
final bottleInventoryProvider = Provider<BottleInventory>((ref) {
  final imports = ref.watch(importsProvider).value ?? [];
  final bills = ref.watch(billsProvider).value ?? [];

  int totalSmallBottles = 0;
  int totalLargeBottles = 0;

  for (var imp in imports) {
    totalSmallBottles += imp.smallBottleQty;
    totalLargeBottles += imp.largeBottleQty;
  }

  for (var bill in bills) {
    totalSmallBottles -= (bill.smallPackQty * 12);
    totalLargeBottles -= (bill.largePackQty * 6);
  }

  return BottleInventory()
    ..id = 1
    ..totalSmallBottles = totalSmallBottles < 0 ? 0 : totalSmallBottles
    ..totalLargeBottles = totalLargeBottles < 0 ? 0 : totalLargeBottles
    ..lastUpdated = DateTime.now();
});

// Expenses Provider
final expensesProvider = StreamProvider<List<Expense>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar.collection<Expense>().where().anyId().sortByDateDesc().watch(
    fireImmediately: true,
  );
});

// Activity Logs Provider
final activityLogsProvider = StreamProvider<List<ActivityLog>>((ref) {
  final isar = ref.watch(isarProvider);
  return isar
      .collection<ActivityLog>()
      .where()
      .anyId()
      .sortByDateDesc()
      .limit(50)
      .watch(fireImmediately: true);
});

// Dashboard Stats Provider
final dashboardStatsProvider = Provider<Map<String, dynamic>>((ref) {
  final shops = ref.watch(shopsProvider).value ?? [];
  final imports = ref.watch(importsProvider).value ?? [];
  final bills = ref.watch(billsProvider).value ?? [];
  final payments = ref.watch(paymentsProvider).value ?? [];

  final now = DateTime.now();
  final startOfMonth = DateTime(now.year, now.month, 1);

  double totalDue = 0;
  for (var shop in shops) {
    totalDue += shop.totalDue;
  }

  double monthlySales = 0;
  for (var bill in bills) {
    if (bill.date.isAfter(startOfMonth)) {
      monthlySales += bill.totalPrice;
    }
  }

  double monthlyReceivables = 0;
  for (var payment in payments) {
    if (payment.date.isAfter(startOfMonth)) {
      monthlyReceivables += payment.amount;
    }
  }

  double totalImportCost = 0;
  int totalSmallBottles = 0;
  int totalLargeBottles = 0;
  double totalSealCost = 0;
  double totalCapCost = 0;
  double totalPlasticCost = 0;

  for (var imp in imports) {
    totalImportCost += imp.totalCost;
    totalSmallBottles += imp.smallBottleQty;
    totalLargeBottles += imp.largeBottleQty;
    totalSealCost += imp.sealCost;
    totalCapCost += imp.capCost;
    totalPlasticCost += imp.plasticCost;
  }

  // Build last 6 months real sales data for chart
  List<Map<String, dynamic>> last6MonthsSales = [];
  for (int i = 5; i >= 0; i--) {
    final monthDate = DateTime(now.year, now.month - i, 1);
    final nextMonth = DateTime(now.year, now.month - i + 1, 1);
    double monthSales = 0;
    for (var bill in bills) {
      if (bill.date.isAfter(monthDate.subtract(const Duration(seconds: 1))) &&
          bill.date.isBefore(nextMonth)) {
        monthSales += bill.totalPrice;
      }
    }
    last6MonthsSales.add({'month': monthDate, 'sales': monthSales});
  }

  return {
    'totalDue': totalDue,
    'monthlySales': monthlySales,
    'monthlyReceivables': monthlyReceivables,
    'activeShops': shops.length,
    'smallBottles': totalSmallBottles,
    'largeBottles': totalLargeBottles,
    'importCost': totalImportCost,
    'sealCost': totalSealCost,
    'capCost': totalCapCost,
    'plasticCost': totalPlasticCost,
    'recentShops': shops.take(5).toList(),
    'last6MonthsSales': last6MonthsSales,
  };
});

// Detailed Imports Stats Provider
final importsStatsProvider = Provider<Map<String, dynamic>>((ref) {
  final imports = ref.watch(importsProvider).value ?? [];

  int totalSmallQty = 0;
  int totalLargeQty = 0;
  double totalSmallCost = 0;
  double totalLargeCost = 0;
  double totalSealCost = 0;
  double totalCapCost = 0;
  double totalPlasticCost = 0;

  for (var imp in imports) {
    totalSmallQty += imp.smallBottleQty;
    totalLargeQty += imp.largeBottleQty;
    totalSmallCost += (imp.smallBottleQty * imp.smallBottleCost);
    totalLargeCost += (imp.largeBottleQty * imp.largeBottleCost);
    totalSealCost += imp.sealCost;
    totalCapCost += imp.capCost;
    totalPlasticCost += imp.plasticCost;
  }

  return {
    'smallQty': totalSmallQty,
    'smallCost': totalSmallCost,
    'largeQty': totalLargeQty,
    'largeCost': totalLargeCost,
    'sealCost': totalSealCost,
    'capCost': totalCapCost,
    'plasticCost': totalPlasticCost,
  };
});
