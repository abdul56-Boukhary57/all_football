import 'package:all_footbal/screens/FAQ/FAQ.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/News/News_item.dart';
import '../../providers/theme_provider.dart';
import '../../screens/News List/favorite_news.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;
    final themeNotifier = ref.read(themeProvider.notifier);
    return Drawer(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            padding: EdgeInsets.zero,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/football_field.jpg',
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        // Button background color (white)
                        foregroundColor: Colors.green,
                        // Text color (dark green to match the container)
                        elevation: 5,
                        // Adds a shadow for a neat effect
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        // Button padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                        ),
                      ),
                      child: const Text(
                        'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SwitchListTile(
            title: Text(
              'Dark Mode',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            value: isDarkMode,
            onChanged: (value) => themeNotifier.toggleTheme(value),
            secondary: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Theme.of(context).iconTheme.color,
            ),
            title: const Text(
              'Favorites',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Pass the updated favoriteList dynamically
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext ctx) => FavoriteNews()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.question_mark_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
            title: const Text(
              'FAQ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Pass the updated favoriteList dynamically
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext ctx) => const FAQScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}
