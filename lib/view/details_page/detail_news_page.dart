import 'package:flutter/material.dart';

import '../../domain/news_data.dart';



class DetailsNewsPage extends StatelessWidget {
  final NewsData data;

  final Color _color = Colors.orangeAccent;

  const DetailsNewsPage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _color,
          title: Text(data.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(data.imageUrl ?? ''),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  data.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Text(
                data.description,
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
        ));
  }
}