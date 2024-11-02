import 'package:all_footbal/providers/matches_list_provider.dart';
import 'package:all_footbal/screens/Matches%20List/add_matchListItem.dart';
import 'package:all_footbal/widgets/Date%20Header/DateHeader.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/Match/matches_item.dart';
import 'package:intl/intl.dart';

import '../../widgets/Matches Screen/ListView1.dart';

class MatchListScreen extends ConsumerWidget {
  const MatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchesList = ref.watch(matchesListProvider);
    // Sort matchesList by matchDate (nearest date first)
    matchesList.sort((a, b) => a.matchDate.compareTo(b.matchDate));

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final MatchData? matchDataItem = await Navigator.push<MatchData>(
              context,
              MaterialPageRoute(
                builder: (context) => const AddMatchScreen(),
              ),
            );
            if (matchDataItem != null) {
              ref.read(matchesListProvider.notifier).addItem(matchDataItem);
            }
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: const MatchesListView());
  }
}
