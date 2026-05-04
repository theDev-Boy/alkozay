import 'package:isar/isar.dart';

part 'models.g.dart';

@collection
class Shop {
  Id id = Isar.autoIncrement;
  late String name;
  double totalDue = 0.0;
}

@collection
class Bill {
  Id id = Isar.autoIncrement;
  late int shopId;
  late int smallPackQty; // Packs of 12
  late int largePackQty; // Packs of 6
  late double totalPrice;
  String? description;
  late DateTime date;
}

@collection
class Payment {
  Id id = Isar.autoIncrement;
  late int shopId;
  late double amount;
  String? description;
  late DateTime date;
  late double prevDue;
  late double newDue;
}

@collection
class BottleImport {
  Id id = Isar.autoIncrement;
  late String supplierName;
  late int smallBottleQty;
  late double smallBottleCost;
  late int largeBottleQty;
  late double largeBottleCost;
  late double extraCharges;
  late double totalCost = 0;
  double sealCost = 0;
  double plasticCost = 0;
  double capCost = 0;
  String? description;
  late DateTime date;
}

@collection
class Expense {
  Id id = Isar.autoIncrement;
  late String reason;
  late double amount;
  late DateTime date;
}

@collection
class ActivityLog {
  Id id = Isar.autoIncrement;
  late String action;
  late DateTime date;
}

@collection
class AppSettings {
  Id id = Isar.autoIncrement;
  double smallPackPrice = 320.0;
  double largePackPrice = 320.0;
  bool isDarkMode = false;
  int accentColorValue = 0xFF1162D4; // Default primary color
}

@collection
class BottleInventory {
  Id id = 1; // Single inventory record
  int totalSmallBottles = 0;
  int totalLargeBottles = 0;
  late DateTime lastUpdated;
}
