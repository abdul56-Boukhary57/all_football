import 'dart:io';
import 'package:all_footbal/providers/fav_news_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FavoriteNews extends ConsumerWidget {
  const FavoriteNews({super.key});



  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final favNewsItems = ref.watch(favNewsListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Favorite News',
            style: TextStyle(
                fontSize: 22, fontStyle: FontStyle.italic, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: favNewsItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: ValueKey(favNewsItems[index].id),
              onDismissed: (direction){
                if(direction == DismissDirection.endToStart){
                  final removedItem = favNewsItems[index];
                  ref.read(favNewsListProvider.notifier).deleteFavItem(removedItem);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${removedItem.title} removed successfully!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              background: Container(color:  Colors.red) ,
              child: ListTile(
                title: Text(favNewsItems[index].title),
                subtitle: Text(favNewsItems[index].descr),
                leading: Image.file(
                  File(favNewsItems[index].imageUrl!),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
