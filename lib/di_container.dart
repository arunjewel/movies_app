import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'controller/movies_home_provider.dart';
import 'core/config/api_config.dart';
import 'core/config/network_config.dart';




final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Dio());
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => DioClient(Urls.baseUrl, sl(),
  //     loggingInterceptor: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton<InternetConnectionChecker>(
          () => InternetConnectionChecker());

  sl.registerLazySingleton<NetworkConfig>(
        () => NetworkConfigImpl(
      dataConnectionChecker: sl(),
    ),
  );
  sl.registerLazySingleton(
        () => ApiConfig(
      client: sl(),
      networkConfig: sl(),
    ),
  );




  ///                      providers                                ///
  sl.registerLazySingleton(
          () => MoviesHomeProvider( apiConfig: sl()));


}




