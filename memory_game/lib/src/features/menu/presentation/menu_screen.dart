import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memory_game/src/core/themes/colors.dart';
import 'package:memory_game/src/core/themes/text_styles.dart';
import 'package:memory_game/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:memory_game/src/features/menu/presentation/widgets/rick_morty_memory_icons.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = 'menu';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Object? groupValue = 0;

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.primary,
        appBar: NeumorphicAppBar(
          centerTitle: true,
          title: NeumorphicText(
            "Rick & Morty",
            style: const NeumorphicStyle(
                depth: 3, color: CustomColors.primary, shape: NeumorphicShape.flat),
            textStyle: NeumorphicTextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
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
        body: Center(
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: NeumorphicIcon(
                RickMortyMemory.rick_morty_portal,
                style: const NeumorphicStyle(
                  color: CustomColors.primary,
                  depth: 5,
                  shape: NeumorphicShape.convex,
                ),
                size: 200,
              ),
            ),
            const SizedBox(height: 20),
            Row(
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
                  groupValue: groupValue,
                  value: "A",
                  onChanged: (value) {
                    groupValue = value;
                  },
                  padding: const EdgeInsets.all(14.0),

                  child: Text("Easy" , style: TextStyles.textBtnStyle),
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
                  groupValue: groupValue,
                  onChanged: (value) {},
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
                  groupValue: groupValue,
                  value: "C",
                  onChanged: (value) {},
                  padding: const EdgeInsets.all(14.0),
                  child: Text("Hard", style: TextStyles.textBtnStyle),
                ),
              ],
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom:18.0),
              child: CustomButton(),
            ),
          ]),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return NeumorphicButton(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 10),
        onPressed: () {
          Navigator.pushNamed(context, DashboardScreen.routeName);
        
        },
        style: NeumorphicStyle(
          color: CustomColors.primary,
          shape: NeumorphicShape.flat,
          depth: 4,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        ),
        child: Text(
          'PLAY',
          style: TextStyles.textBtnStyle
        ));
  }
}
