import 'package:all_footbal/providers/news_list_provider.dart';

import 'package:all_footbal/screens/News%20List/add_news.dart';

import 'package:all_footbal/widgets/Main%20Drawer/Main_drawer.dart';
import 'package:all_footbal/widgets/News%20Screen/ListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/News/News_item.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void addItem() async {
      final newNewsItem = await Navigator.of(context).push<NewsItem>(
        MaterialPageRoute(builder: (BuildContext context) => const NewNews()),
      );

      if (newNewsItem != null) {
        ref
            .read(newsListProvider.notifier)
            .addItem(newNewsItem); // Add the new news item to the list
        // Show a SnackBar when a news item is added
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${newNewsItem.title} added successfully!'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: addItem,
            child: const Icon(
              Icons.add,
            )),
        drawer: const MainDrawer(),
        body: const NewsListView());
  }
}
