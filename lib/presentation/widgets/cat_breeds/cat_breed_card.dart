import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:cats_app/presentation/routes/routes.dart';
import 'package:cats_app/presentation/utils/text_style_utils.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/breed_intelligence_info.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/breed_origin_info.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/cat_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatBreedCard extends StatelessWidget {
  const CatBreedCard({
    super.key,
    required this.catBreed,
  });

  final CatBreedEntity catBreed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.catBreedDetails, extra: catBreed);
      },
      child: Card(
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
                style: TextStyleUtils.headlineSmall(context),
              ),
              CatImage(image: catBreed.image, height: 280),
              Row(
                children: [
                  BreedOriginInfo(origin: catBreed.origin),
                  Spacer(),
                  BreedIntelligenceInfo(rating: catBreed.intelligence),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
