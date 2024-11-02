import 'dart:io';
import 'package:flutter/material.dart';
import '../../models/News/News_item.dart';
import '../../screens/News List/news_details.dart';

class NewsListTile extends StatelessWidget {
  final NewsItem newsItem;

  const NewsListTile({
    Key? key,
    required this.newsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetails(
              leadingImage: newsItem.imageUrl!,
              title: newsItem.title,
              subtitle: newsItem.descr,
            ),
          ),
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          File(newsItem.imageUrl!),
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        newsItem.title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          newsItem.descr,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
