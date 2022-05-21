import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:memory_game/src/core/rest_api_service.dart';
import 'package:memory_game/src/core/utils/common/ticker.dart';
import 'package:memory_game/src/features/dashboard/data/datasources/rick_morty_data_source.dart';
import 'package:memory_game/src/features/dashboard/data/repositories/rick_morty_repository_impl.dart';
import 'package:memory_game/src/features/dashboard/domain/repositories/rick_morty_repository.dart';
import 'package:memory_game/src/features/dashboard/domain/usecases/rick_morty_get_character_use_case.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/game/game_bloc.dart';
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
  getIt.registerLazySingleton<TimerBloc>(() => TimerBloc(ticker: Ticker()));
  getIt.registerLazySingleton<RickMortyDataSource>(
    () => RickMortyDataSourceImpl(restApiBaseHelper: getIt()),
  );
  getIt.registerLazySingleton(
    () => RickMortyGetCharacterUseCase(rickMortyRepository: getIt()),
  );
  getIt.registerLazySingleton<DashboardBloc>(() => DashboardBloc(
    getCharacterUseCase: getIt(),
  ));
   getIt.registerLazySingleton<RickMortyRepository>(
      () => RickMortyRepositoryImpl(rickMortyDataSource: getIt()));

  getIt.registerLazySingleton<GameBloc>(() => GameBloc());

getIt.registerLazySingleton(() => RestApiBaseHelper());
getIt.registerLazySingleton(() => const FlutterSecureStorage());
}
