import 'package:flutter/material.dart';
import '../../domain/card_data.dart';

part 'card_image.dart';
part 'card_like.dart';
part 'card_text.dart';

typedef OnLikeCallback = void Function(String title, bool isLiked)?;

class MyCard extends StatelessWidget {
  final String text;
  final String descriptionText;
  final String? imageUrl;
  final OnLikeCallback onLike;
  final VoidCallback? onTap;

  const MyCard(
      this.text, {
        required this.descriptionText,
        this.imageUrl,
        this.onLike,
        this.onTap,
        super.key,
      });

  factory MyCard.fromData(
      CardData data, {
        OnLikeCallback? onLike,
        VoidCallback? onTap,
      }) =>
      MyCard(
        data.title,
        descriptionText: data.description,
        imageUrl: data.imageUrl,
        onLike: onLike,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        constraints: const BoxConstraints(minHeight: 140),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 4,
              offset: const Offset(0, 5),
              blurRadius: 8,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardImage(imageUrl ?? ''),
              _CardText(
                text,
                descriptionText: descriptionText,
              ),
              _CardLike(
                onLike,
                text: text,
              )
            ],
          ),
        ),
      ),
    );
  }
}