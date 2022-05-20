import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:memory_game/src/core/rest_api_service.dart';
import 'package:memory_game/src/core/utils/common/ticker.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/timer/timer_bloc.dart';
import 'package:memory_game/src/features/menu/presentation/blocs/navigation/navigation_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {

  //**
  // Menu
  // */

  getIt.registerLazySingleton<NavigationBloc>(() => NavigationBloc());

//**
  // Dashboard
  // */
  getIt.registerLazySingleton<TimerBloc>(() => TimerBloc(
    ticker: Ticker()
  ));

  getIt.registerLazySingleton<DashboardBloc>(() => DashboardBloc());

getIt.registerLazySingleton(() => RestApiBaseHelper());
getIt.registerLazySingleton(() => const FlutterSecureStorage());
}
