import 'package:flutter/material.dart';

class NewsImage extends StatelessWidget {
  final String? imageUrl;

  const NewsImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return imageUrl != null ? Image.network(imageUrl!) : const SizedBox.shrink();
  }
}