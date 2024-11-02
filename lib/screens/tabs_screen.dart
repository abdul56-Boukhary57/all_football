import 'package:all_footbal/providers/bottom_nav_bar_provider.dart';

import 'package:all_footbal/screens/Matches%20List/matches_screen.dart';
import 'package:all_footbal/screens/Statistics%20Screen/stats_screen.dart';

import 'package:all_footbal/widgets/Main%20Drawer/Main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'News List/news_screen.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndexPage = ref.watch(btmNavBarProvider);

    Widget activePage() {
      switch (selectedIndexPage){
        case 0 : return const NewsScreen();
        case  1 : return const MatchListScreen();
        case 2 : return const StatsScreen() ;
        default: return const Placeholder();
      }

    }

    String getPageTitle() {
      switch (selectedIndexPage){
        case 0 : return 'News';
        case  1 : return 'Matches';
        case 2 : return 'Statistics' ;
        default: return '';
      }
    }

    return Scaffold(
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_volleyball_sharp), label: 'Matches'),
          BottomNavigationBarItem(
              icon: Icon(Icons.query_stats_sharp), label: 'Statistics'),
        ],
        onTap: ref.read(btmNavBarProvider.notifier).selectPage,
        currentIndex: selectedIndexPage,
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            getPageTitle(),
            style: const TextStyle(
                fontSize: 22, fontStyle: FontStyle.italic, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.article_sharp)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: activePage(),
    );
  }
}
