import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svik2/data/data_sources/auth/auth_api_client.dart';
import 'package:svik2/data/data_sources/auth/auth_datasource.dart';
import 'package:svik2/data/repositories/auth/auth_repository_impl.dart';
import 'package:svik2/domain/repositories/auth/auth_repository.dart';
import 'package:svik2/domain/usecases/auth/verify_session.dart';
import 'package:svik2/presentation/bloc/auth/auth_bloc.dart';

import 'data/local/cache_helper.dart';

final gt = GetIt.instance;

Future<void> init() async {
  // Initializing a new instance of Dio client and setting the base url to the API endpoint.
  final dioClient = Dio();
  dioClient.options.baseUrl = "htttp://localhost:3000";
  // Blocs
  gt.registerLazySingleton<AuthBloc>(() => AuthBloc(verifySession: gt<VerifySession>()));
  // Usecases
  gt.registerLazySingleton<VerifySession>(() => VerifySession(authRepository: gt<AuthRepository>()));
  // Repositories
  gt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: gt()));
  
  // Datasources and Helpers
  gt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      authApiClient: gt<AuthApiClient>(),
      cacheHelper: gt<CacheHelper>(),
    ),
  );
  gt.registerLazySingleton(() => CacheHelper(gt<SharedPreferences>()));

  // Api Clients for different features
  gt.registerLazySingleton(() => AuthApiClient(dioClient: gt<Dio>()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  gt.registerLazySingleton(() => sharedPreferences);

  gt.registerLazySingleton(() => dioClient);
}
