import 'dart:io';

import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:chat_test/features/auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import 'package:chat_test/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chat_test/features/auth/domain/repository/auth_repository.dart';
import 'package:chat_test/features/auth/domain/usecacse/create_user_auth_use_case.dart';
import 'package:chat_test/features/auth/domain/usecacse/login_auth_use_case.dart';
import 'package:chat_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_test/features/chat/data/data_source/remote_data_source/chat_remote_data_source.dart';
import 'package:chat_test/features/chat/data/data_source/remote_data_source/chat_remote_data_source_impl.dart';
import 'package:chat_test/features/chat/data/repository/chat_repository_impl.dart';
import 'package:chat_test/features/chat/domain/repository/chat_repository.dart';
import 'package:chat_test/features/chat/domain/usecase/create_chat_id_use_case.dart';
import 'package:chat_test/features/chat/domain/usecase/get_chat_id_use_case.dart';
import 'package:chat_test/features/chat/domain/usecase/get_conversation_use_case.dart';
import 'package:chat_test/features/chat/domain/usecase/send_massage_use_case.dart';
import 'package:chat_test/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chat_test/features/main/data/data_source/data_source/remote_data_source/main_remote_data_source.dart';
import 'package:chat_test/features/main/data/data_source/data_source/remote_data_source/main_remote_data_source_impl.dart';
import 'package:chat_test/features/main/data/repository/main_repository_impl.dart';
import 'package:chat_test/features/main/domain/repository/main_repository.dart';
import 'package:chat_test/features/main/domain/usecase/get_chats_use_case.dart';
import 'package:chat_test/features/main/presentation/bloc/main_bloc.dart';
import 'package:chat_test/features/search/data/data_source/remote_data_source/search_remote_data_source.dart';
import 'package:chat_test/features/search/data/data_source/remote_data_source/search_remote_data_source_impl.dart';
import 'package:chat_test/features/search/data/repository/search_repository_impl.dart';
import 'package:chat_test/features/search/domain/repository/search_repository.dart';
import 'package:chat_test/features/search/domain/usecase/search_user_use_case.dart';
import 'package:chat_test/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> init() async {
  await initHive();
  sl.registerSingleton<LocalSource>(LocalSource(_box));
  _authFeature();
  _mainFeatures();
  _searchFeatures();
  _chatFeatures();
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

void _mainFeatures() {
  /// Presentation
  sl.registerFactory(() => MainBloc(sl()));

  /// UseCases
  sl.registerLazySingleton<GetChatsUseCase>(() => GetChatsUseCase(sl()));

  ///Repositories
  sl.registerLazySingleton<MainRepository>(
    () => MainRepositoryImpl(
      sl(),
    ),
  );

  /// Data and Network
  sl.registerLazySingleton<MainRemoteDataSource>(
    () => MainRemoteDataSourceImpl(),
  );
}

void _searchFeatures() {
  /// Presentation
  sl.registerFactory(() => SearchBloc(sl()));

  /// UseCases
  sl.registerLazySingleton<SearchUserUseCase>(() => SearchUserUseCase(sl()));

  ///Repositories
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(
      sl(),
    ),
  );

  /// Data and Network
  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(),
  );
}

void _chatFeatures() {
  /// Presentation
  sl.registerFactory(() => ChatBloc(sl(), sl(), sl(), sl()));

  /// UseCases
  sl.registerLazySingleton<GetChatIdUseCase>(() => GetChatIdUseCase(sl()));
  sl.registerLazySingleton<SendMassageUseCase>(() => SendMassageUseCase(sl()));
  sl.registerLazySingleton<CreateChatIdUseCase>(
      () => CreateChatIdUseCase(sl()));
  sl.registerLazySingleton<GetConversationUseCase>(
      () => GetConversationUseCase(sl()));

  ///Repositories
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(
      sl(),
    ),
  );

  /// Data and Network
  sl.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(),
  );
}

Future<void> initHive() async {
  const boxName = "chat";
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}
