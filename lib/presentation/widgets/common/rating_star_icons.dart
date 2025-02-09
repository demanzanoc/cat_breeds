import 'package:flutter/material.dart';

class RatingStarIcons extends StatelessWidget {
  const RatingStarIcons({
    super.key,
    required this.rating,
    this.color = Colors.amber,
  });

  final int rating;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        rating,
        (index) {
          return Icon(
            Icons.stars,
            color: color,
            size: 20,
          );
        },
      ),
    );
  }
}
