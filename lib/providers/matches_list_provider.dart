
import 'package:all_footbal/models/Match/matches_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/News/News_item.dart';

class MatchesListNotifier extends StateNotifier<List<MatchData>> {

  MatchesListNotifier() : super([]);

  void addItem(MatchData matchItem) {
    state = [...state,  matchItem];

  }


}

final matchesListProvider =
StateNotifierProvider<MatchesListNotifier, List<MatchData>>((ref) {
  return MatchesListNotifier();
});
