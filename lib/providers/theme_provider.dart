import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/News/News_item.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);  // 3atool fakir bil initial value hoon hiyi light

  void toggleTheme(bool isDarkMode){
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }


  ThemeData buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color.fromRGBO(22, 177, 59, 1),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(22, 177, 59, 1),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(22, 177, 59, 1),
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.black),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromRGBO(240, 245, 241, 1),
      ),
      iconTheme: const IconThemeData(color: Colors.green),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(22, 177, 59, 1),
          // Set your custom color here
          textStyle: const TextStyle(fontSize: 17, color: Colors.white),
          // Customize the text style
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor:  Color.fromRGBO(22, 177, 59, 1),
        selectedLabelStyle: TextStyle(fontSize: 17, color: Colors.white),
        selectedItemColor: Colors.white,
      )
    );
  }
  ThemeData buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.grey[900],
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.grey,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[800], // Set your dark mode button color
          textStyle: const TextStyle(fontSize: 17, color: Colors.white),
        ),
      ),
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[800],
          selectedLabelStyle: const TextStyle(fontSize: 17, color: Colors.white),
          selectedItemColor: Colors.white,
        )
    );
  }

}

final themeProvider =
StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {     //to make the themeNotifier available through the app
  return ThemeNotifier();
});
