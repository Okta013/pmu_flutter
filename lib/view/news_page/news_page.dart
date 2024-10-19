import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key}); // Создаем пустой класс

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
      ),
      body: const Center(
        child: Text('Здесь будут новости!'),
      ),
    );
  }
}