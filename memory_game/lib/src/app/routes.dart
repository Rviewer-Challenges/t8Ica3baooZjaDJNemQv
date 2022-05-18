import 'package:flutter/material.dart';
import 'package:memory_game/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:memory_game/src/features/menu/presentation/menu_screen.dart';


final Map<String, Widget Function(BuildContext)> routes = {
MenuScreen.routeName: (context) => const MenuScreen(),
DashboardScreen.routeName: (context) => const DashboardScreen(),
};
