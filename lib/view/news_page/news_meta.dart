import 'package:flutter/material.dart';

class NewsMeta extends StatelessWidget {
  final String? author;
  final String? publishedAt;

  const NewsMeta({super.key, this.author, this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Автор: ${author ?? "Неизвестно"}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        Text(
          'Опубликовано: ${publishedAt}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}