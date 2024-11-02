import 'dart:io';

import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final String leadingImage;
  final String title;
  final String subtitle;

  // Constructor to receive the specific item data
  const NewsDetails(
      {Key? key,
      required this.leadingImage,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white , Colors.grey[200]!] ,begin: Alignment.topCenter , end: Alignment.bottomCenter )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(leadingImage),
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold , color: Colors.black87),
              ),
              Divider(color: Colors.grey[400]), // Separator line
              const SizedBox(height: 16),
              Text(
                subtitle,
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
