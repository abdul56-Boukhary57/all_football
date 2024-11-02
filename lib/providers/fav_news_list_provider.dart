import 'package:all_footbal/providers/news_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/News/News_item.dart';

class FavNewsListNotifier extends StateNotifier<List<NewsItem>> {
  final Ref ref;

  FavNewsListNotifier(this.ref) : super([]);

  void addFavItem(NewsItem newItem) {
    state = [...state, newItem];
  }

  void deleteFavItem(NewsItem newItem) {
    state = state.where((e) => newItem.id != e.id).toList();
  }

  bool checkAndAddFavItem(NewsItem newItem) {
    final newsList = ref.read(newsListProvider);
    if (newsList.any((e) => e.id == newItem.id)) {
      addFavItem(newItem);
    } else {
      print('News item does not exist in the news list.');
    }
    return true;
  }
}

final favNewsListProvider =
    StateNotifierProvider<FavNewsListNotifier, List<NewsItem>>((ref) {
  return FavNewsListNotifier(ref);
});
