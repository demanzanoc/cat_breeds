import 'package:cats_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';

class CatImage extends StatelessWidget {
  const CatImage({
    super.key,
    required this.image, 
    this.height,
  });

  final String image;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return image.isNotEmpty
        ? SizedBox(
          height: height,
          child: Image.network(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
        )
        : Image.asset(
            splashImage,
            height: 280,
            width: double.infinity,
          );
  }
}
