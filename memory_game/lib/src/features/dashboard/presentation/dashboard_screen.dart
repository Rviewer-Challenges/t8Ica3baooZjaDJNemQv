import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:memory_game/src/core/themes/colors.dart';
import 'package:memory_game/src/features/dashboard/data/models/card.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:memory_game/src/features/dashboard/presentation/blocs/timer/timer_bloc.dart';
import 'package:memory_game/src/features/menu/presentation/widgets/rick_morty_memory_icons.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = 'dashboard';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    int columns = 0;
    switch (arguments['level']) {
      case 'C':
        columns = 5;
        break;
      default:
        columns = 4;
        break;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.primary,
        appBar: NeumorphicAppBar(
          centerTitle: true,
          leading: GestureDetector(
            child: NeumorphicIcon(
              Icons.arrow_back_sharp,
              style: const NeumorphicStyle(
                color: CustomColors.primary,
                intensity: 5,
                depth: 4,
                shape: NeumorphicShape.flat,
              ),
              size: 40,
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const _dataWidget(),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<DashboardBloc, DashboardState>(
                    builder: (context, state) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: columns,
                                  crossAxisSpacing: 14,
                                  mainAxisSpacing: 14),
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.cards.length,
                          itemBuilder: (BuildContext context, int index) =>
                              _CardMemory(card: state.cards.elementAt(index)));
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _dataWidget extends StatelessWidget {
  const _dataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NeumorphicIcon(
              Icons.move_up_rounded,
              size: 30,
              style: const NeumorphicStyle(
                color: CustomColors.secondary,
                depth: 2,
                shape: NeumorphicShape.flat,
                intensity: 1,
              ),
            ),
            Neumorphic(
                style: const NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    border:
                        NeumorphicBorder(width: 2, color: CustomColors.primary),
                    depth: 3,
                    lightSource: LightSource.topLeft,
                    color: CustomColors.primary),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeumorphicText(
                    '01',
                    style: const NeumorphicStyle(
                      color: CustomColors.secondary,
                      depth: 2,
                      shape: NeumorphicShape.flat,
                      intensity: 1,
                    ),
                    textStyle: NeumorphicTextStyle(fontSize: 30),
                  ),
                ))
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NeumorphicIcon(
              Icons.timer_sharp,
              size: 30,
              style: const NeumorphicStyle(
                color: CustomColors.secondary,
                depth: 2,
                shape: NeumorphicShape.flat,
                intensity: 1,
              ),
            ),
            const _TimerWidget(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NeumorphicIcon(
              Icons.memory_rounded,
              size: 30,
              style: const NeumorphicStyle(
                color: CustomColors.secondary,
                depth: 2,
                shape: NeumorphicShape.flat,
                intensity: 1,
              ),
            ),
            Neumorphic(
                style: const NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    border:
                        NeumorphicBorder(width: 2, color: CustomColors.primary),
                    depth: 3,
                    lightSource: LightSource.topLeft,
                    color: CustomColors.primary),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeumorphicText(
                    '01',
                    style: const NeumorphicStyle(
                      color: CustomColors.secondary,
                      depth: 2,
                      intensity: 1,
                      shape: NeumorphicShape.flat,
                    ),
                    textStyle: NeumorphicTextStyle(fontSize: 30),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

class _TimerWidget extends StatefulWidget {
  const _TimerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<_TimerWidget> {
  @override
  initState() {
    super.initState();
    startTimer(context);
  }

  startTimer(BuildContext context) {
    BlocProvider.of<TimerBloc>(context).add(const TimerStarted(60));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Neumorphic(
            style: const NeumorphicStyle(
                shape: NeumorphicShape.concave,
                border: NeumorphicBorder(width: 2, color: CustomColors.primary),
                depth: 3,
                lightSource: LightSource.topLeft,
                color: CustomColors.primary),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: NeumorphicText(
                '${state.duration}',
                style: const NeumorphicStyle(
                  color: CustomColors.secondary,
                  depth: 2,
                  intensity: 1,
                  shape: NeumorphicShape.flat,
                ),
                textStyle: NeumorphicTextStyle(fontSize: 30),
              ),
            ));
      },
    );
  }
}

class _CardMemory extends StatelessWidget {
  const _CardMemory({Key? key, required this.card}) : super(key: key);

  final RickMortyCard card;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state.cards.elementAt(card.position).visible) {
          return Pulse(
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
              child: Neumorphic(
                style: const NeumorphicStyle(
                  depth: 2,
                  color: CustomColors.primary,
                  intensity: 0.8,
                  shape: NeumorphicShape.convex,
                ),
                curve: Curves.easeInOut,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return NeumorphicText(
                      card.character.toString(),
                      style: const NeumorphicStyle(
                        color: CustomColors.secondary,
                        depth: 2,
                        intensity: 1,
                        shape: NeumorphicShape.flat,
                      ),
                      textStyle: NeumorphicTextStyle(
                          fontSize: constraints.maxHeight * 0.5),
                    );
                  },
                ),
              ),
              onTap: () {
                BlocProvider.of<DashboardBloc>(context).add(OnCardTapped(
                    position: card.position,
                    visible: !state.cards.elementAt(card.position).visible));
              },
            ),
          );
        } else {
          return GestureDetector(
            child: Neumorphic(
              style: const NeumorphicStyle(
                depth: 2,
                color: CustomColors.primary,
                intensity: 0.8,
                shape: NeumorphicShape.convex,
              ),
              curve: Curves.easeInOut,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return NeumorphicIcon(
                    RickMortyMemory.rick_portal,
                    style: const NeumorphicStyle(
                      color: CustomColors.tertiary,
                      depth: 3,
                      intensity: 5,
                      shape: NeumorphicShape.flat,
                    ),
                    size: constraints.biggest.height + 10,
                  );
                },
              ),
            ),
            onTap: () {
              BlocProvider.of<DashboardBloc>(context).add(OnCardTapped(
                  position: card.position,
                  visible: !state.cards.elementAt(card.position).visible));
            },
          );
        }
      },
    );
  }
}
