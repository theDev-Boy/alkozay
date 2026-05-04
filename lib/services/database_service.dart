import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/models.dart';

class DatabaseService {
  late Isar isar;
  bool isInitialized = false;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      ShopSchema,
      BillSchema,
      PaymentSchema,
      BottleImportSchema,
      ExpenseSchema,
      ActivityLogSchema,
      AppSettingsSchema,
      BottleInventorySchema,
    ], directory: dir.path);
    isInitialized = true;

    // Initialize default settings if not exists
    final settingsCount = await isar.collection<AppSettings>().count();
    if (settingsCount == 0) {
      await isar.writeTxn(() async {
        await isar.collection<AppSettings>().put(AppSettings()..id = 1);
      });
    }
  }

  // Activity Log Helper
  Future<void> logActivity(String action) async {
    await isar.writeTxn(() async {
      await isar.activityLogs.put(
        ActivityLog()
          ..action = action
          ..date = DateTime.now(),
      );
    });
  }
}
