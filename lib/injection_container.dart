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

final sl = GetIt.instance;

Future<void> init() async {
  // Initializing a new instance of Dio client and setting the base url to the API endpoint.
  final dioClient = Dio();
  dioClient.options.baseUrl = "htttp://localhost:3000";
  // Blocs
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(verifySession: sl<VerifySession>()));
  // Usecases
  sl.registerLazySingleton<VerifySession>(() => VerifySession(authRepository: sl<AuthRepository>()));
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: sl()));
  
  // Datasources and Helpers
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      authApiClient: sl<AuthApiClient>(),
      cacheHelper: sl<CacheHelper>(),
    ),
  );
  sl.registerLazySingleton(() => CacheHelper(sl<SharedPreferences>()));

  // Api Clients for different features
  sl.registerLazySingleton(() => AuthApiClient(dioClient: sl<Dio>()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => dioClient);
}
