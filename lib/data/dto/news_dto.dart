import 'package:json_annotation/json_annotation.dart';

part 'news_dto.g.dart';

@JsonSerializable()
class NewsDTO {
  final String title;
  final String description;
  final String? urlToImage;
  final String url;
  final String? author;
  final String publishedAt;

  NewsDTO({
    required this.title,
    required this.description,
    this.urlToImage,
    required this.url,
    this.author,
    required this.publishedAt,
  });

  factory NewsDTO.fromJson(Map<String, dynamic> json) => _$NewsDTOFromJson(json);
  Map<String, dynamic> toJson() => _$NewsDTOToJson(this);
}