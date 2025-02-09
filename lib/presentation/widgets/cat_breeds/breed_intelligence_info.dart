import 'package:cats_app/presentation/utils/text_style_utils.dart';
import 'package:cats_app/presentation/widgets/common/rating_star_icons.dart';
import 'package:flutter/material.dart';

class BreedIntelligenceInfo extends StatelessWidget {
  const BreedIntelligenceInfo({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4,
      children: [
        Text(
          'Intelligence:',
          style: TextStyleUtils.boldBodyLarge(context),
        ),
        RatingStarIcons(rating: rating)
      ],
    );
  }
}
