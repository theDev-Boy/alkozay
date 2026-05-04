import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/providers.dart';
import 'theme/app_theme.dart';
import 'ui/main_navigation.dart';
import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FIXED: Force fullscreen mode to hide home/back buttons
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  final container = ProviderContainer();
  final dbService = container.read(databaseServiceProvider);
  await dbService.init();

  runApp(
    UncontrolledProviderScope(container: container, child: const AlkozayApp()),
  );
}

class AlkozayApp extends ConsumerWidget {
  const AlkozayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);

    return settingsAsync.when(
      data: (settings) {
        final isDarkMode = settings?.isDarkMode ?? false;
        final accentColor = Color(settings?.accentColorValue ?? 0xFF1162D4);

        return MaterialApp(
          title: 'Alkozay Water',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(accentColor),
          darkTheme: AppTheme.darkTheme(accentColor),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const SplashPage(),
        );
      },
      loading: () => const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      error: (err, stack) => MaterialApp(
        home: Scaffold(body: Center(child: Text('Error: $err'))),
      ),
    );
  }
}
