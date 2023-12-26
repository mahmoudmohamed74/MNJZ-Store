import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mnjz_store/Features/home/data/repos/home_repo_impl.dart';
import 'package:mnjz_store/core/network/api/api_service.dart';
import 'package:mnjz_store/core/database/database_helper.dart';
import 'package:mnjz_store/core/network/connectivity_service.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerLazySingleton<ApiService>(() => ApiService(Dio()));
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  sl.registerFactory<ConnectivityService>(() => ConnectivityService());

  sl.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(
        sl.get<ApiService>(),
        sl.get<DatabaseHelper>(),
      ));
  // sl.registerSingleton<SearchRepoImpl>(SearchRepoImpl(sl.get<ApiService>()));
}
