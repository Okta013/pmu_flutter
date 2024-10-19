class NewsData {
  final String title;
  final String description;
  final String? imageUrl;
  final String url;
  final String? author;
  final String publishedAt;

  NewsData({
    required this.title,
    required this.description,
    this.imageUrl,
    required this.url,
    this.author,
    required this.publishedAt,
  });
}