import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game/src/app/routes.dart';
import 'package:memory_game/src/features/menu/presentation/menu_screen.dart';


class RickMortyApp extends StatefulWidget {
  const RickMortyApp({Key? key}) : super(key: key);

  @override
  State<RickMortyApp> createState() => _RickMortyAppState();
}

class _RickMortyAppState extends State<RickMortyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: const NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      routes: routes,
      initialRoute: MenuScreen.routeName,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('es')],
    );
  }

}

void requestFocus(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
}
