import 'package:flutter/material.dart';

import '../../data/repository/news_repository.dart';
import '../../domain/news_data.dart';
import '../details_page/detail_news_page.dart';
import 'news_card.dart';

class NewsPage extends StatelessWidget {
  final NewsRepository newsRepository = NewsRepository();

  NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
      ),
      body: FutureBuilder<List<NewsData>>(
        future: newsRepository.fetchCatNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Нет новостей.'));
          }

          List<NewsData> articles = snapshot.data!;

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return NewsCard(article: article);
            },
          );
        },
      ),
    );
  }
  void _navigateToDetails(BuildContext context, NewsData data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsNewsPage(data)),
    );
  }
}