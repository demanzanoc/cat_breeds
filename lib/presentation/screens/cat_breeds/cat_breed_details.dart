import 'package:cats_app/domain/entities/cat_breeds/cat_breed_entity.dart';
import 'package:cats_app/presentation/utils/text_style_utils.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/breed_origin_info.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/breed_intelligence_info.dart';
import 'package:cats_app/presentation/widgets/cat_breeds/cat_image.dart';
import 'package:cats_app/presentation/widgets/common/rating_star_icons.dart';
import 'package:flutter/material.dart';

class CatBreedDetails extends StatelessWidget {
  const CatBreedDetails({
    super.key,
    required this.catBreed,
  });

  final CatBreedEntity catBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catBreed.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BreedOriginInfo(origin: catBreed.origin),
                Spacer(),
                BreedIntelligenceInfo(
                  rating: catBreed.intelligence,
                ),
              ],
            ),
            CatImage(image: catBreed.image),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      'Description:',
                      style: TextStyleUtils.boldBodyLarge(context),
                    ),
                    Text(
                      catBreed.description,
                      style: TextStyleUtils.bodyLarge(context),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Adaptability:',
                      style: TextStyleUtils.boldBodyLarge(context),
                    ),
                    RatingStarIcons(
                      rating: catBreed.adaptability,
                      color: Colors.lightGreen,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Life expectancy :',
                      style: TextStyleUtils.boldBodyLarge(context),
                    ),
                    Text(
                      '${catBreed.lifeSpan} years',
                      style: TextStyleUtils.bodyLarge(context),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
