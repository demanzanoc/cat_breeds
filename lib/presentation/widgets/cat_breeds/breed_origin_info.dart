import 'package:cats_app/presentation/utils/text_style_utils.dart';
import 'package:flutter/material.dart';

class BreedOriginInfo extends StatelessWidget {
  const BreedOriginInfo({
    super.key,
    required this.origin,
  });

  final String origin;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Origin:',
          style: TextStyleUtils.boldBodyLarge(context),
        ),
        Text(
          origin,
          style: TextStyleUtils.bodyLarge(context),
        ),
      ],
    );
  }
}
