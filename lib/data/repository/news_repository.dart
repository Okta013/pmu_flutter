import 'package:dio/dio.dart';

import '../../domain/news_data.dart';
import '../dto/news_dto.dart';
import '../mapper/news_mapper.dart';

class NewsRepository {
  final String _apiKey = 'fd34deb97bbf444796ea1ee0fb68dc01';
  final String _baseUrl = 'https://newsapi.org/v2';
  final Dio _dio = Dio();

  Future<List<NewsData>> fetchCatNews() async {
    final response = await _dio.get(
      '$_baseUrl/everything',
      queryParameters: {
        'q': 'кот OR кошка',
        'language': 'ru',
        'apiKey': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List<NewsDTO> articles = (response.data['articles'] as List)
          .map((article) => NewsDTO.fromJson(article))
          .toList();
      return articles.map((dto) => NewsMapper.fromDTO(dto)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}