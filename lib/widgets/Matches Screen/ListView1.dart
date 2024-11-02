import 'package:all_footbal/providers/matches_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ListTile1.dart';


class MatchesListView extends ConsumerWidget {
  const MatchesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final matchesList = ref.watch(matchesListProvider);

    return ListView.builder(
      itemCount: matchesList.length,
      itemBuilder: (context, index) {
        final match = matchesList[index];
        final previousMatch = index > 0 ? matchesList[index - 1] : null;
        final bool showDateHeader = previousMatch == null ||
            match.matchDate.day != previousMatch!.matchDate.day;
        return MatchListTile(match: match , showDateHeader:  showDateHeader,);
      },
    );
  }
}


