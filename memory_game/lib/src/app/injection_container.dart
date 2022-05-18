import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:memory_game/src/core/rest_api_service.dart';
import 'package:memory_game/src/features/menu/presentation/blocs/bloc/navigation_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {

  //**
  // Menu
  // */

 getIt.registerLazySingleton<NavigationBloc>(() => NavigationBloc());



getIt.registerLazySingleton(() => RestApiBaseHelper());
getIt.registerLazySingleton(() => const FlutterSecureStorage());
}
