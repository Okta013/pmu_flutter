class CardData {
  final String title;
  final String description;
  final String? imageUrl;

  CardData(
      this.title, {
        required this.description,
        this.imageUrl,
      });
}