import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/Match/matches_item.dart';
import '../Date Header/DateHeader.dart';

class MatchListTile extends StatelessWidget {
  final MatchData match;
  final bool showDateHeader;

  const MatchListTile(
      {Key? key, required this.match, required this.showDateHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDateHeader)
          DateHeader(
            dateText: DateFormat('EEEE, dd MMM yyyy').format(match.matchDate),
          ),
        ListTile(
          title: Row(
            children: [
              // Home team logo

              Expanded(
                child: Text(
                  '${match.homeTeam} vs ${match.awayTeam}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis, // Prevent overflow if text is too long
                ),
              ),
              // Away team logo
              
            ],
          ),
          subtitle: Text(
            '${match.league}, Round ${match.round}, Time: ${match.matchTime.format(context)}',
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Home team logo above score
              Column(
                children: [
                  Image.file(
                    match.homeTeamLogo,
                    width: 30, // Adjust width as needed
                    height: 30, // Adjust height as needed
                  ),
                  Text(
                    match.homeScore.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(width: 16), // Space between home and away logos
              // Away team logo above score
              Column(
                children: [
                  Image.file(
                    match.awayTeamLogo,
                    width: 30, // Adjust width as needed
                    height: 30, // Adjust height as needed
                  ),
                  Text(
                    match.awayScore.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
