part of 'card.dart';

class _CardImage extends StatelessWidget {
  final String imageUrl;

  const _CardImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 140,
        width: 140,
        child: Image.network(
          imageUrl ?? '',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Placeholder(),
        ),
      ),
    );
  }
}