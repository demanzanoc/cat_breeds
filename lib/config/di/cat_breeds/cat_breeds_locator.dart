import 'package:cats_app/config/constants/environment.dart';
import 'package:cats_app/data/api/dio/dio_client.dart';
import 'package:cats_app/data/api/http_client.dart';
import 'package:cats_app/data/datasources/cat_breeds/cat_breeds_remote_datasource.dart';
import 'package:cats_app/data/repositories/cat_breeds/cat_breeds_remote_repository.dart';
import 'package:cats_app/domain/datasources/cat_breeds/cat_breeds_datasource.dart';
import 'package:cats_app/domain/repositories/cat_breeds/cat_breeds_repository.dart';
import 'package:cats_app/domain/use_cases/cat_breeds/get_cat_breeds_use_case.dart';
import 'package:cats_app/presentation/providers/cat_breeds/home_screen_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract class CatBreedsLocator {
  static void setUpCatBreedsDependencies(GetIt serviceLocator) {
    final dioConfig = Dio(
      BaseOptions(
        baseUrl: 'https://api.thecatapi.com/v1',
        headers: {
          'x-api-key': Environment.theCatApiKey,
        },
      ),
    );

    // Dio
    serviceLocator.registerLazySingleton<Dio>(() => dioConfig);

    // Api Client
    serviceLocator.registerLazySingleton<HttpClient>(
      () => DioClient(dio: serviceLocator()),
    );

    // Datasources
    serviceLocator.registerLazySingleton<CatBreedsDatasource>(
      () => CatBreedsRemoteDatasource(httpClient: serviceLocator()),
    );

    // Repositories
    serviceLocator.registerLazySingleton<CatBreedsRepository>(
      () => CatBreedsRemoteRepository(catBreedsDatasource: serviceLocator()),
    );

    // Use Cases
    serviceLocator.registerLazySingleton<GetCatBreedsUseCase>(
      () => GetCatBreedsUseCase(catBreedsRepository: serviceLocator()),
    );

    // Providers
    serviceLocator.registerFactory<HomeScreenProvider>(
      () => HomeScreenProvider(getCatBreedsUseCase: serviceLocator()),
    );
  }
}
