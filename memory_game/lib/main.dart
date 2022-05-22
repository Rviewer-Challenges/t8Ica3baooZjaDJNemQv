import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:memory_game/src/app/app.dart';
import 'package:memory_game/src/app/app_bloc_observer.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/timer/timer_bloc.dart';
import 'package:memory_game/src/features/menu/presentation/blocs/navigation/navigation_bloc.dart';
import 'src/app/injection_container.dart' as di;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await di.init();
  BlocOverrides.runZoned(
    () => runApp(MultiBlocProvider(providers: [
      BlocProvider<NavigationBloc>(
        create: (context) => di.getIt()),
      BlocProvider<TimerBloc>(
        create: (context) => di.getIt()),
      BlocProvider<DashboardBloc>(
        create: (context) => di.getIt()),
      
    ], child: const RickMortyApp())),
    blocObserver: AppBlocObserver(),
  );
}
