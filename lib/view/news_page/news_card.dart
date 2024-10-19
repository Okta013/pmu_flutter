import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/news_data.dart';
import '../details_page/detail_news_page.dart';
import 'news_image.dart';
import 'news_meta.dart';
import 'news_text.dart';

class NewsCard extends StatelessWidget {
  final NewsData article;
  final VoidCallback? onTap;

  const NewsCard({super.key, required this.article, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Переход на страницу деталей
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsNewsPage(article)),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsImage(imageUrl: article.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NewsText(title: article.title, description: article.description),
                  NewsMeta(author: article.author, publishedAt: article.publishedAt),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}