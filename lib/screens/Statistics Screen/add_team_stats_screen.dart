import 'package:all_footbal/models/Team/team_item.dart';
import 'package:flutter/material.dart';

class AddTeamScreen extends StatefulWidget {
  const AddTeamScreen({Key? key}) : super(key: key);

  @override
  State<AddTeamScreen> createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final playsController = TextEditingController();
  final winController = TextEditingController();
  final drawController = TextEditingController();
  final lossController = TextEditingController();
  final faController = TextEditingController();
  final pointsController = TextEditingController();

  void addTeam() {
    if (_formKey.currentState!.validate()) {
      final team = TeamStat(
        name: nameController.text,
        plays: int.parse(playsController.text),
        win: int.parse(winController.text),
        draw: int.parse(drawController.text),
        loss: int.parse(lossController.text),
        FA: faController.text,
        points: int.parse(pointsController.text),
      );
      Navigator.pop(context, team);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Team')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Team'),
                  keyboardType: TextInputType.text,
                  validator: (value) => value!.isEmpty ? 'Enter plays' : null,
                ),
                TextFormField(
                  controller: playsController,
                  decoration: InputDecoration(labelText: 'Plays'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Enter plays' : null,
                ),
                TextFormField(
                  controller: winController,
                  decoration: InputDecoration(labelText: 'Win'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Enter win' : null,
                ),
                TextFormField(
                  controller: drawController,
                  decoration: InputDecoration(labelText: 'Draw'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Enter draw' : null,
                ),
                TextFormField(
                  controller: lossController,
                  decoration: InputDecoration(labelText: 'Loss'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Enter loss' : null,
                ),
                TextFormField(
                  controller: faController,
                  decoration: InputDecoration(labelText: 'FA'),
                  validator: (value) => value!.isEmpty ? 'Enter FA' : null,
                ),
                TextFormField(
                  controller: pointsController,
                  decoration: InputDecoration(labelText: 'Points'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Enter points' : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: addTeam,
                  child: Text('Add Team'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
