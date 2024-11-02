import 'package:flutter/material.dart';

class DateHeader extends StatelessWidget {
  final String dateText;

  const DateHeader({Key? key, required this.dateText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        color: Colors.grey[300],
        height: 28,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dateText,
              style: const TextStyle(
                  color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
