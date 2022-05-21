import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:memory_game/src/core/themes/colors.dart';
import 'package:memory_game/src/core/themes/text_styles.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/game/game_bloc.dart';
import 'package:memory_game/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:memory_game/src/features/menu/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:memory_game/src/features/menu/presentation/widgets/rick_morty_memory_icons.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = 'menu';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.primary,
        appBar: NeumorphicAppBar(
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              child: NeumorphicIcon(
                Icons.info,
                style: const NeumorphicStyle(
                  color: CustomColors.primary,
                  depth: 4,
                  shape: NeumorphicShape.concave,
                ),
                size: 40,
              ),
            ),
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NeumorphicIcon(
                RickMortyMemory.rick_morty_portal,
                style: const NeumorphicStyle(
                  color: CustomColors.secondary,
                  depth: 5,
                  shape: NeumorphicShape.convex,
                  intensity: 1,
                ),
                size: 200,
              ),
              const SizedBox(height: 80),
              const _RadioButtonRow(),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(bottom: 18.0),
                child: CustomButton(),
              ),
            ]),
      ),
    );
  }
}

class _RadioButtonRow extends StatelessWidget {
  const _RadioButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NeumorphicRadio(
              style: NeumorphicRadioStyle(
                shape: NeumorphicShape.concave,
                unselectedColor: CustomColors.primary,
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(10),
                ),
              ),
              groupValue: state.levelSelected,
              value: "A",
              onChanged: (value) {
                if (value != null) {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(OnSetLevelSelected(value));
                }
              },
              padding: const EdgeInsets.all(14.0),
              child: Text("Easy", style: TextStyles.textBtnStyle),
            ),
            const SizedBox(width: 12),
            NeumorphicRadio(
              value: "B",
              style: NeumorphicRadioStyle(
                  shape: NeumorphicShape.concave,
                  unselectedColor: CustomColors.primary,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(10),
                  )),
              groupValue: state.levelSelected,
              onChanged: (value) {
                if (value != null) {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(OnSetLevelSelected(value));
                }
              },
              padding: const EdgeInsets.all(14.0),
              child: Text("Medium", style: TextStyles.textBtnStyle),
            ),
            const SizedBox(width: 12),
            NeumorphicRadio(
              style: NeumorphicRadioStyle(
                  shape: NeumorphicShape.concave,
                  unselectedColor: CustomColors.primary,
                  boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(10),
                  )),
              groupValue: state.levelSelected,
              value: "C",
              onChanged: (value) {
                if (value != null) {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(OnSetLevelSelected(value));
                }
              },
              padding: const EdgeInsets.all(14.0),
              child: Text("Hard", style: TextStyles.textBtnStyle),
            ),
          ],
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: NeumorphicButton(
          padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 10),
          onPressed: () {
            var level =
                BlocProvider.of<NavigationBloc>(context).state.levelSelected;

            switch (level) {
              case "A":
                BlocProvider.of<DashboardBloc>(context).createDashboard(16);
                BlocProvider.of<GameBloc>(context).setRemaining(8);
                break;
              case "B":
                BlocProvider.of<DashboardBloc>(context).createDashboard(24);
                BlocProvider.of<GameBloc>(context).setRemaining(12);
                break;
              case "C":
                BlocProvider.of<DashboardBloc>(context).createDashboard(30);
                BlocProvider.of<GameBloc>(context).setRemaining(15);
                break;
            }
            Navigator.pushNamed(context, DashboardScreen.routeName, arguments: {
              "level": level,
            });
          },
          style: NeumorphicStyle(
            color: CustomColors.primary,
            shape: NeumorphicShape.flat,
            depth: 4,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          ),
          child: Center(child: Text('PLAY', style: TextStyles.textBtnStyle))),
    );
  }
}
