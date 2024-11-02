import 'dart:io';
import 'dart:math';

import 'package:all_footbal/models/Match/matches_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddMatchScreen extends StatefulWidget {
  const AddMatchScreen({Key? key}) : super(key: key);

  @override
  State<AddMatchScreen> createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedLeague;
  int _homeScore = 0;
  int _awayScore = 0;
  int _round = 0;

  final _roundController = TextEditingController(text: '0');
  final _timeController = TextEditingController(text: '');
  final _homeTeamController = TextEditingController(text: '');
  final _homeScoreController = TextEditingController(text: '0');
  final _awayTeamController = TextEditingController(text: '');
  final _awayScoreController = TextEditingController(text: '0');
  final _homeTeamLogoController = TextEditingController(text: '');
  final _awayTeamLogoController = TextEditingController(text: '');

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  File? _homeTeamLogo;
  File? _awayTeamLogo;

  Future<void> _pickImage(bool isHomeTeam) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isHomeTeam) {
          _homeTeamLogo = File(pickedFile.path);
        } else {
          _awayTeamLogo = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Match'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ]),
          child: Form(
            key: _formKey,
            child: Column(

              children: [
                DropdownButtonFormField<String>(
                  value: _selectedLeague,
                  decoration:  InputDecoration(
                    labelText: 'League',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                  items: ['Premier League', 'La Liga', 'Bundesliga', 'Serie A']
                      .map((String league) {
                    return DropdownMenuItem<String>(
                      value: league,
                      child: Text(league),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _selectedLeague = newValue; // Update the selected league
                  },
                  validator: (value) =>
                      value == null ? 'Please select a league' : null,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Round:'),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (_round > 0) _round--;
                                });
                              },
                            ),
                            Text(_round.toString()),
                            // Display current score
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _round++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // TextFormField(
                //   controller: _roundController,
                //   decoration: const InputDecoration(labelText: 'Round'),
                //   validator: (value) =>
                //       value!.isEmpty ? 'Please enter the Round' : null,
                //   keyboardType: TextInputType.number,
                // ),
                TextFormField(
                  controller: _homeTeamController,
                  decoration: const InputDecoration(labelText: 'Home Team'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter the home team' : null,
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  controller: _awayTeamController,
                  decoration: const InputDecoration(labelText: 'Away Team'),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter the Away Team' : null,
                  keyboardType: TextInputType.text,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Home Score:'),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (_homeScore > 0) _homeScore--;
                                });
                              },
                            ),
                            Text(_homeScore.toString()),
                            // Display current score
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _homeScore++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Away Score:'),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (_awayScore > 0) _awayScore--;
                                });
                              },
                            ),
                            Text(_awayScore.toString()),
                            // Display current score
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _awayScore++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // TextFormField(
                //   controller: _homeScoreController,
                //   decoration: const InputDecoration(labelText: 'Home Score'),
                //   validator: (value) =>
                //       value!.isEmpty ? 'Please enter the home score' : null,
                //   keyboardType: TextInputType.number,
                // ),
                // TextFormField(
                //   controller: _awayScoreController,
                //   decoration: const InputDecoration(labelText: 'Away Score'),
                //   validator: (value) =>
                //       value!.isEmpty ? 'Please enter the away score' : null,
                //   keyboardType: TextInputType.number,
                // ),

                const SizedBox(height: 15),
                SizedBox(
                  child: Row(
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'Select Date'
                            : DateFormat('EEEE , dd MMM yyyy')
                                .format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _selectedDate = pickedDate;
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_today),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Text(_selectedTime == null
                          ? 'Select Time'
                          : _selectedTime!.format(context)),
                      IconButton(
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              _selectedTime = pickedTime;
                            });
                          }
                        },
                        icon: const Icon(Icons.access_time),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                // Home Team Logo Button
                ElevatedButton(
                  onPressed: () => _pickImage(true),
                  child: const Text('Select Home Team Logo'),
                ),
                // Show selected Home Team Logo
                if (_homeTeamLogo != null)
                  Image.file(
                    _homeTeamLogo!,
                    width: 100, // Adjust width as needed
                    height: 100, // Adjust height as needed
                  ),
                const SizedBox(height: 10),
                // Away Team Logo Button
                ElevatedButton(
                  onPressed: () => _pickImage(false),
                  child: const Text('Select Away Team Logo'),
                ),
                // Show selected Away Team Logo
                if (_awayTeamLogo != null)
                  Image.file(
                    _awayTeamLogo!,
                    width: 100, // Adjust width as needed
                    height: 100, // Adjust height as needed
                  ),

                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _selectedDate != null &&
                        _selectedTime != null) {
                      final newMatch = MatchData(
                        league: _selectedLeague.toString(),
                        round: int.parse(_round.toString()),
                        matchDate: _selectedDate!,
                        matchTime: _selectedTime!,
                        homeTeam: _homeTeamController.text,
                        homeScore: int.parse(_homeScore.toString()),
                        awayTeam: _awayTeamController.text,
                        awayScore: int.parse(_awayScore.toString()),
                        homeTeamLogo: _homeTeamLogo!,
                        awayTeamLogo: _awayTeamLogo!,
                      );
                      Navigator.of(context).pop(newMatch);
                    }
                  },
                  child: const Text('Add Match'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
