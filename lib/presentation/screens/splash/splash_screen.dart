import 'package:cats_app/presentation/constants/assets_constants.dart';
import 'package:cats_app/presentation/routes/routes.dart';
import 'package:cats_app/presentation/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      if (context.mounted) context.go(Routes.home);
    });

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 40,
            children: [
              Text(
                'Catbreeds',
                style: TextStyleUtils.headlineLarge(context),
              ),
              Image.asset(
                splashImage,
                width: screenWidth * 0.5,
                height: screenHeight * 0.3,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
