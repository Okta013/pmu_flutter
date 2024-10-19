import 'package:test_app/domain/news_data.dart';

import '../dto/news_dto.dart';

class NewsMapper {
  static NewsData fromDTO(NewsDTO dto) {
    return NewsData(
      title: dto.title,
      description: dto.description,
      imageUrl: dto.urlToImage,
      url: dto.url,
      author: dto.author,
      publishedAt: dto.publishedAt,
    );
  }
}