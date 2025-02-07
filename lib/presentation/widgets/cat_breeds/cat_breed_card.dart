import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/breed_intelligence_rating.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/breed_origin_info.dart';
import 'package:flutter/material.dart';

class CatBreedCard extends StatelessWidget {
  const CatBreedCard({
    super.key,
    required this.catBreed,
  });

  final CatBreedEntity catBreed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              catBreed.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            catBreed.image.isNotEmpty
                ? Image.network(
                    catBreed.image,
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  )
                : Image.asset(
                    'assets/images/cat_splash.png',
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
            Row(
              children: [
                BreedOriginInfo(origin: catBreed.origin),
                Spacer(),
                BreedIntelligenceRating(intelligence: catBreed.intelligence),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
