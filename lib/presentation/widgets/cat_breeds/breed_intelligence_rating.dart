import 'package:flutter/material.dart';

class BreedIntelligenceRating extends StatelessWidget {
  const BreedIntelligenceRating({
    super.key,
    required this.intelligence,
  });

  final int intelligence;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Intelligence:',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            intelligence,
            (index) {
              return Icon(
                Icons.stars,
                color: Colors.amber,
                size: 20,
              );
            },
          ),
        ),
      ],
    );
  }
}
