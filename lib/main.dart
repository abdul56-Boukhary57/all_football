import 'package:all_footbal/providers/theme_provider.dart';
import 'package:all_footbal/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io'; // To check platform


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    return MaterialApp(
      theme: themeNotifier.buildLightTheme(),
      darkTheme: themeNotifier.buildDarkTheme(),
      themeMode: themeMode,
      // Automatically switch theme
      title: 'All Football',
      debugShowCheckedModeBanner: false,
      home: const TabsScreen(),
    );
  }
}
