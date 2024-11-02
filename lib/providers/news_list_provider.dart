import 'package:all_footbal/providers/fav_news_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/News/News_item.dart';

class NewsListNotifier extends StateNotifier<List<NewsItem>> {
  final Ref ref;
  NewsListNotifier(this.ref) : super([]);

  void addItem(NewsItem newItem) {
    state = [...state, newItem];

  }

  void deleteItem(NewsItem newItem){
    state = state.where((e) => newItem.id != e.id).toList();

    //remove the item from the favorite list if it exists there
    final favNewsList = ref.read(favNewsListProvider.notifier);
    favNewsList.deleteFavItem(newItem);
  }
}

final newsListProvider =
    StateNotifierProvider<NewsListNotifier, List<NewsItem>>((ref) {
  return NewsListNotifier(ref);
});
