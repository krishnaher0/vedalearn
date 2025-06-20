import 'package:get_it/get_it.dart';
import 'package:veda_learn/core/network/hive_service.dart';
import 'package:veda_learn/features/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:veda_learn/features/auth/data/repository/auth_local_repository.dart';
import 'package:veda_learn/features/auth/domain/usecase/auth_login_use_case.dart';
import 'package:veda_learn/features/auth/domain/usecase/auth_register_usecase.dart';
import 'package:veda_learn/features/auth/presentation/view_model/login_view_model/login_viewmodel.dart';
import 'package:veda_learn/features/auth/presentation/view_model/register_view_model/register_viewmodel.dart';

final serviceLocator = GetIt.instance;
 
Future<void> initDependencies() async {
  _initAuthModule();
  _initHiveService();
}
 
Future<void> _initHiveService() async {
  serviceLocator.registerLazySingleton<HiveService>(() => HiveService());
}
 
Future<void> _initAuthModule() async {
  serviceLocator.registerFactory(
    () => AuthLocalDataSource(hiveService: serviceLocator<HiveService>()),
  );
 
  serviceLocator.registerFactory(
    () => AuthLocalRepository(
      authLocalDataSource: serviceLocator<AuthLocalDataSource>(),
    ),
  );
 
  serviceLocator.registerFactory(
    () => AuthRegisterUsecase(authRepository: serviceLocator<AuthLocalRepository>())
  );

  serviceLocator.registerFactory(
    () => AuthLoginUsecase(authRepository: serviceLocator<AuthLocalRepository>())
  );
 
  serviceLocator.registerLazySingleton<RegisterViewmodel>(() => RegisterViewmodel(
    serviceLocator<AuthRegisterUsecase>()
  ));

  serviceLocator.registerFactory<LoginViewModel>(() => LoginViewModel(
    serviceLocator<AuthLoginUsecase>()
  ));
}