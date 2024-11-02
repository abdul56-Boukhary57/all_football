import 'package:all_footbal/data/FAQData.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'FAQ',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        children: faqList.map((faq) {
          return ExpansionTile(
            textColor: const Color.fromRGBO(22, 177, 59, 1),
            collapsedTextColor: Colors.black87,
            title: Text(
              faq.title, style: const TextStyle(fontWeight: FontWeight.bold
            ),),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faq.description),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
