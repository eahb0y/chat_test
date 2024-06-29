import 'dart:io';

import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:chat_test/features/auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import 'package:chat_test/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chat_test/features/auth/domain/repository/auth_repository.dart';
import 'package:chat_test/features/auth/domain/usecacse/create_user_auth_use_case.dart';
import 'package:chat_test/features/auth/domain/usecacse/login_auth_use_case.dart';
import 'package:chat_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> init() async {
  await initHive();
  sl.registerSingleton<LocalSource>(LocalSource(_box));
  _authFeature();
}

void _authFeature() {
  /// Presentation
  sl.registerFactory(() => AuthBloc(sl(), sl()));

  /// UseCases
  sl.registerLazySingleton<CreateUserAuthUseCase>(
      () => CreateUserAuthUseCase(sl()));
  sl.registerLazySingleton<LoginAuthUseCase>(() => LoginAuthUseCase(sl()));

  ///Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      sl(),
    ),
  );

  /// Data and Network
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
}

Future<void> initHive() async {
  const boxName = "chat";
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
