import 'dart:io';

import 'package:flutter/material.dart';

class MatchData {
  String league;
  int round;
  DateTime matchDate;
  TimeOfDay matchTime;
  String homeTeam;
  int homeScore;
  String awayTeam;
  int awayScore;
  File homeTeamLogo ;
  File awayTeamLogo;

  MatchData({
    required this.league,
    required this.round,
    required this.matchDate,
    required this.matchTime,
    required this.homeTeam,
    required this.homeScore,
    required this.awayTeam,
    required this.awayScore,
    required this.homeTeamLogo,
    required this.awayTeamLogo,
  });
}
