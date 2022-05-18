import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:memory_game/src/core/themes/colors.dart';
import 'package:memory_game/src/features/menu/presentation/widgets/rick_morty_memory_icons.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = 'dashboard';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.primary,
        appBar: NeumorphicAppBar(
          centerTitle: true,
          title: NeumorphicText(
            "Rick & Morty",
            style: const NeumorphicStyle(
                depth: 3, 
                color: CustomColors.primary, 
                shape: NeumorphicShape.flat,
                intensity: 5),
            textStyle: NeumorphicTextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
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
              const SizedBox(height: 20),
              Expanded(
                child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16),
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory(),
                      _CardMemory()
                    ]),
              ),
                  const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardMemory extends StatelessWidget {
  const _CardMemory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: const NeumorphicStyle(
        depth: 4,
        color: CustomColors.primary,
                        intensity: 5,
      ),
      curve: Curves.easeInOut,
      child: const Icon(
        RickMortyMemory.rick_portal,
        color: Colors.green,
        size: 120,
      ),
    );
  }
}
