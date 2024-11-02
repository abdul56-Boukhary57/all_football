import 'dart:io';

import 'package:all_footbal/widgets/News%20Screen/ListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/fav_news_list_provider.dart';
import '../../providers/news_list_provider.dart';
import '../../screens/News List/news_details.dart';

class NewsListView extends ConsumerWidget {
  const NewsListView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final newsItems = ref.watch(newsListProvider);
    return ListView.builder(
      itemCount: newsItems.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(newsItems[index].id),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            return true; // Item will be dismissed (removed)
          } else if (direction == DismissDirection.startToEnd) {
            ref
                .read(favNewsListProvider.notifier)
                .checkAndAddFavItem(newsItems[index]);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    '${newsItems[index].title} added successfully to Fav!'),
                duration: const Duration(seconds: 2),
              ),
            );
          }
          // return false;
        },
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            final removedItem = newsItems[index];

            ref.read(newsListProvider.notifier).deleteItem(removedItem);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${removedItem.title} removed successfully!'),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        background: Container(
          color:
          Colors.teal, // Color for start to end swipe (add to favorites)
        ),
        secondaryBackground: Container(
          color: Colors.red, // Color for end to start swipe (delete)
        ),
        child: NewsListTile( newsItem: newsItems[index],)
      ),
    );
  }
}
