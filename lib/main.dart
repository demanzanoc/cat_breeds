import 'package:cats_app/config/theme/app_theme.dart';
import 'package:cats_app/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CatBreedsApp());
}

class CatBreedsApp extends StatelessWidget {
  const CatBreedsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
