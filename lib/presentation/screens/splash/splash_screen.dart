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
                height: 220,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
