// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDTO _$NewsDTOFromJson(Map<String, dynamic> json) => NewsDTO(
      title: json['title'] as String,
      description: json['description'] as String,
      urlToImage: json['urlToImage'] as String?,
      url: json['url'] as String,
      author: json['author'] as String?,
      publishedAt: json['publishedAt'] as String,
    );

Map<String, dynamic> _$NewsDTOToJson(NewsDTO instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'url': instance.url,
      'author': instance.author,
      'publishedAt': instance.publishedAt,
    };
