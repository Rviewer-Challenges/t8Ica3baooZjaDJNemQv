import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game/src/core/themes/colors.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/timer/timer_bloc.dart';
import 'package:memory_game/src/features/menu/presentation/menu_screen.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.title, required this.description, required this.icon}) : super(key: key);
  final String title, description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
          title: Text(title, style: GoogleFonts.roboto()),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(description, style: GoogleFonts.roboto()),
                const SizedBox(height: 10),
              Container(
                height: 200,
                width: 60,
                child: NeumorphicIcon(
                    icon,
                    style: const NeumorphicStyle(
                      color: CustomColors.secondary,
                      depth: 5,
                      shape: NeumorphicShape.convex,
                      intensity: 1,
                    ),
                    size: 200,
                  ),
              ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () async {
                await BlocProvider.of<DashboardBloc>(context).cleanBloc();
                    BlocProvider.of<TimerBloc>(context).cleanBloc();
                Navigator.of(context).popUntil(ModalRoute.withName(MenuScreen.routeName));
              },
            ),
          ],
        ),
    );
  }
}