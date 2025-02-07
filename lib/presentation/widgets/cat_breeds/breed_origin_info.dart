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
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          origin,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
