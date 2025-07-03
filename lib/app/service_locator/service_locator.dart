import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:veda_learn/core/network/api_service.dart';
import 'package:veda_learn/core/network/hive_service.dart';
import 'package:veda_learn/features/auth/data/data_source/remote_datasource/user_remote_datasource.dart';
import 'package:veda_learn/features/auth/data/repository/remote_repository/user_remote_repository.dart';
import 'package:veda_learn/features/auth/domain/usecase/auth_login_use_case.dart';
import 'package:veda_learn/features/auth/domain/usecase/auth_register_usecase.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_viewmodel.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_viewmodel.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initApiService();
  _initAuthModule();
  _initHiveService();
}

Future<void> _initHiveService() async {
  serviceLocator.registerLazySingleton<HiveService>(() => HiveService());
}

Future<void> _initApiService() async {
  serviceLocator.registerLazySingleton(() => ApiService(Dio()));
}

Future<void> _initAuthModule() async {
  // ✅ Register remote data source using API service
  serviceLocator.registerFactory<UserRemoteDataSource>(
    () => UserRemoteDataSource(apiService: serviceLocator<ApiService>()),
  );

  // ✅ Register remote repository
  serviceLocator.registerFactory<UserRemoteRepository>(
    () => UserRemoteRepository(userRemoteDataSource: serviceLocator<UserRemoteDataSource>()),
  );

 
  serviceLocator.registerFactory(
    () => AuthRegisterUsecase(authRepository: serviceLocator<UserRemoteRepository>()),
  );

  serviceLocator.registerFactory(
    () => AuthLoginUsecase(authRepository: serviceLocator<UserRemoteRepository>()),
  );

  // ✅ Register viewmodels
  serviceLocator.registerLazySingleton<RegisterViewmodel>(
    () => RegisterViewmodel(serviceLocator<AuthRegisterUsecase>()),
  );

  serviceLocator.registerFactory<LoginViewModel>(
    () => LoginViewModel(serviceLocator<AuthLoginUsecase>()),
  );
}
