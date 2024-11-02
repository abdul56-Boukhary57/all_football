
import 'package:all_footbal/models/Team/team_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class TeamsListNotifier extends StateNotifier<List<TeamStat>> {

  TeamsListNotifier() : super([]);

  void addItem(TeamStat team) {
    state = [...state,  team];

  }


}

final teamsListProvider =
StateNotifierProvider<TeamsListNotifier, List<TeamStat>>((ref) {
  return TeamsListNotifier();
});
