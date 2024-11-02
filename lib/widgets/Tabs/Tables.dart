import 'package:all_footbal/providers/teamStat_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TablesScreen extends ConsumerWidget {
  const TablesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teams = ref.watch(teamsListProvider);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(37, 46, 53, 1), // Background color
            borderRadius: BorderRadius.circular(2.0), // Rounded corners
          ),
          child: const Text(
            'League',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Table(
          border: const TableBorder(
              top: BorderSide(width: 1.0),
              bottom: BorderSide(width: 1.0),
              left: BorderSide(width: 1.0),
              right: BorderSide(width: 1.0),
              horizontalInside: BorderSide(width: 1)),
          children: [
            const TableRow(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(51, 61, 100, 1),
                ),
                children: [
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'T',
                            style: const TextStyle(
                              color: Colors.white54, // Text color
                              fontSize: 14.0, // Text size
                              fontWeight: FontWeight.w500, // Font weight
                            ),
                          ))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'P',
                            style: const TextStyle(
                              color: Colors.white54, // Text color
                              fontSize: 14.0, // Text size
                              fontWeight: FontWeight.w500, // Font weight
                            ),
                          ))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'W',
                            style: const TextStyle(
                              color: Colors.white54, // Text color
                              fontSize: 14.0, // Text size
                              fontWeight: FontWeight.w500, // Font weight
                            ),
                          ))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'D',
                            style: const TextStyle(
                              color: Colors.white54, // Text color
                              fontSize: 14.0, // Text size
                              fontWeight: FontWeight.w500, // Font weight
                            ),
                          ))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('L',
                              style: const TextStyle(
                                color: Colors.white54, // Text color
                                fontSize: 14.0, // Text size
                                fontWeight: FontWeight.w500, // Font weight
                              )))),
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'FA',
                            style: const TextStyle(
                              color: Colors.white54, // Text color
                              fontSize: 14.0, // Text size
                              fontWeight: FontWeight.w500, // Font weight
                            ),
                          ))),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Pts',
                        style: const TextStyle(
                          color: Colors.white54, // Text color
                          fontSize: 14.0, // Text size
                          fontWeight: FontWeight.w500, // Font weight
                        ),
                      ),
                    ),
                  ),
                ]),
            for (var i = 0; i < teams.length; i++)
              TableRow(
                  decoration: BoxDecoration(
                    color: i % 2 == 0
                        ? Color.fromRGBO(
                            45, 55, 65, 1) // Darker shade for even rows
                        : Color.fromRGBO(
                            37, 46, 53, 1), // Lighter shade for odd rows
                  ),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          teams[i].name,
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 14.0, // Text size
                            fontWeight: FontWeight.w500, // Font weight
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${teams[i].plays}',
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 14.0, // Text size
                            fontWeight: FontWeight.w500, // Font weight
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${teams[i].win}',
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 14.0, // Text size
                            fontWeight: FontWeight.w500, // Font weight
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${teams[i].draw}',
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 14.0, // Text size
                            fontWeight: FontWeight.w500, // Font weight
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${teams[i].loss}',
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 14.0, // Text size
                            fontWeight: FontWeight.w500, // Font weight
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          teams[i].FA,
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 14.0, // Text size
                            fontWeight: FontWeight.w500, // Font weight
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${teams[i].points}',
                          style: const TextStyle(
                            color: Colors.white, // Text color
                            fontSize: 14.0, // Text size
                            fontWeight: FontWeight.w500, // Font weight
                          ),
                        ),
                      ),
                    ),
                  ])
          ],
        ),
      ],
    );
  }
}
