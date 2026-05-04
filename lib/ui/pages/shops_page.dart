import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../providers/providers.dart';
import '../../models/models.dart';
import 'shop_detail_page.dart';

class ShopsPage extends ConsumerStatefulWidget {
  const ShopsPage({super.key});

  @override
  ConsumerState<ShopsPage> createState() => _ShopsPageState();
}

class _ShopsPageState extends ConsumerState<ShopsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shopsAsync = ref.watch(shopsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shops'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => _showAddShopDialog(context),
              tooltip: 'Add new shop',
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Search shops by name...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: theme.cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          Expanded(
            child: shopsAsync.when(
              data: (shops) {
                final filteredShops = shops
                    .where((s) => s.name.toLowerCase().contains(_searchQuery.toLowerCase()))
                    .toList();

                if (filteredShops.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.store_outlined, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty
                              ? 'No shops yet. Tap + to add one!'
                              : 'No shops found matching "$_searchQuery"',
                          style: const TextStyle(color: Colors.grey, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredShops.length,
                  itemBuilder: (context, index) {
                    final shop = filteredShops[index];
                    return _buildShopCard(context, shop);
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
    );
  }

  Widget _buildShopCard(BuildContext context, Shop shop) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ShopDetailPage(shopId: shop.id)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: theme.primaryColor.withOpacity(0.1),
                child: Text(
                  shop.name[0].toUpperCase(),
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shop.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Due: Rs. ${shop.totalDue.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: shop.totalDue > 0 ? Colors.orange : Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    _showAddShopDialog(context, shop: shop);
                  } else if (value == 'delete') {
                    _deleteShop(context, shop.id);
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit_outlined, size: 18),
                        SizedBox(width: 8),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, size: 18, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Delete', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FIXED: Proper ConsumerStatefulWidget pattern - save button now works!
  Future<void> _showAddShopDialog(BuildContext context, {Shop? shop}) async {
    final controller = TextEditingController(text: shop?.name);

    if (!context.mounted) return;

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(shop == null ? 'Add New Shop' : 'Edit Shop'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter shop name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
          onSubmitted: (_) => _saveShop(controller.text, shop),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            // FIXED: Save button is now properly clickable and functional
            onPressed: () => _saveShop(controller.text, shop),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  // FIXED: Removed transaction nesting - no ref.read inside writeTxn
  Future<void> _saveShop(String shopName, Shop? existingShop) async {
    if (shopName.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Shop name cannot be empty')),
        );
      }
      return;
    }

    try {
      final isar = ref.read(isarProvider);
      final dbService = ref.read(databaseServiceProvider);

      // Perform the transaction
      await isar.writeTxn(() async {
        if (existingShop == null) {
          // Add new shop
          final newShop = Shop()..name = shopName;
          await isar.collection<Shop>().put(newShop);
        } else {
          // Edit existing shop
          existingShop.name = shopName;
          await isar.collection<Shop>().put(existingShop);
        }
      });

      // FIXED: Activity log OUTSIDE the transaction
      await dbService.logActivity(
        existingShop == null ? 'Added shop: $shopName' : 'Renamed shop to: $shopName',
      );

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              existingShop == null ? 'Shop added successfully' : 'Shop updated successfully',
            ),
            duration: const Duration(seconds: 2),
          ),
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

  Future<void> _deleteShop(BuildContext context, int id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Shop?'),
        content: const Text(
          'This will also delete all bills and payments for this shop. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final isar = ref.read(isarProvider);
      final dbService = ref.read(databaseServiceProvider);

      try {
        final shop = await isar.collection<Shop>().get(id);
        
        // FIXED: Transaction only for database operations
        await isar.writeTxn(() async {
          if (shop != null) {
            await isar.collection<Shop>().delete(id);
            await isar.collection<Bill>().filter().shopIdEqualTo(id).deleteAll();
            await isar.collection<Payment>().filter().shopIdEqualTo(id).deleteAll();
          }
        });

        // FIXED: Activity log OUTSIDE the transaction
        if (shop != null) {
          await dbService.logActivity('Deleted shop: ${shop.name}');
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Shop deleted successfully')),
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
}
