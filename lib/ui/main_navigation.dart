import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/shops_page.dart';
import 'pages/imports_page.dart';
import 'pages/inventory_page.dart';
import 'pages/reports_page.dart';
import 'pages/settings_page.dart';
import 'pages/history_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;

  final List<Widget> _pages = [
    const HomePage(),
    const ShopsPage(),
    const HistoryPage(),
    const ImportsPage(),
    const InventoryPage(),
    const ReportsPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.95),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              final isSelected = states.contains(WidgetState.selected);
              return TextStyle(
                fontSize: 9.5,
                letterSpacing: -0.4,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? const Color(0xFF1162D4) : Colors.grey[600],
              );
            }),
          ),
          child: NavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
                _animationController.forward(from: 0.0);
              });
            },
            animationDuration: const Duration(milliseconds: 400),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            indicatorColor: Theme.of(context).primaryColor.withOpacity(0.1),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard, color: Color(0xFF1162D4)),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.storefront_outlined),
                selectedIcon: Icon(Icons.storefront, color: Color(0xFF1162D4)),
                label: 'Shops',
              ),
              NavigationDestination(
                icon: Icon(Icons.history_outlined),
                selectedIcon: Icon(Icons.history, color: Color(0xFF1162D4)),
                label: 'History',
              ),
              NavigationDestination(
                icon: Icon(Icons.local_shipping_outlined),
                selectedIcon: Icon(Icons.local_shipping, color: Color(0xFF1162D4)),
                label: 'Imports',
              ),
              NavigationDestination(
                icon: Icon(Icons.inventory_2_outlined),
                selectedIcon: Icon(Icons.inventory_2, color: Color(0xFF1162D4)),
                label: 'Inventory',
              ),
              NavigationDestination(
                icon: Icon(Icons.bar_chart_outlined),
                selectedIcon: Icon(Icons.bar_chart, color: Color(0xFF1162D4)),
                label: 'Reports',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings, color: Color(0xFF1162D4)),
                label: 'Settings',
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
