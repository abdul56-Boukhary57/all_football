import 'package:all_footbal/providers/teamStat_list_provider.dart';
import 'package:all_footbal/screens/Statistics%20Screen/add_team_stats_screen.dart';
import 'package:all_footbal/widgets/Tabs/Tables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/Team/team_item.dart';

class StatsScreen extends ConsumerStatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends ConsumerState<StatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // TabBar positioned at the top
          Container(
            color: const Color.fromRGBO(51, 61, 70, 1),
            child: TabBar(
              controller: _tabController,
              labelStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              labelColor: const Color.fromRGBO(245, 245, 245, 1),
              unselectedLabelColor: Colors.white.withOpacity(0.6),
              indicatorWeight: 4.0,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              unselectedLabelStyle: const TextStyle(fontSize: 16),
              tabs: const [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
          ),
          // TabBarView below the TabBar
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TablesScreen(),
                Center(child: Text('Content for Tab 2')),
                Center(child: Text('Content for Tab 3')),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final TeamStat? teamDataItem = await Navigator.push<TeamStat>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTeamScreen(),
            ),
          );
          if(teamDataItem != null){
            ref.read(teamsListProvider.notifier).addItem(teamDataItem);
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
