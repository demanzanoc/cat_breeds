import 'package:cats_app/config/di/service_locator.dart';
import 'package:cats_app/config/providers/provider_manager.dart';
import 'package:cats_app/config/theme/app_theme.dart';
import 'package:cats_app/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setUpDependencies();
  runApp(const CatBreedsApp());
}

class CatBreedsApp extends StatelessWidget {
  const CatBreedsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderManager.buildProviders(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}
