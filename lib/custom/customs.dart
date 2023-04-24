import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patterns_canvas/patterns_canvas.dart';
import 'package:smart_care_v2/custom/globals.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final bool isCentered;

  const CustomText({super.key, this.isCentered = true, required this.text, this.fontSize = 16, this.fontWeight = FontWeight.normal, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: isCentered ? TextAlign.center : TextAlign.start, style: GoogleFonts.roboto(fontSize: fontSize, fontWeight: fontWeight, color: color != Colors.black ? color : Theme.of(context).textTheme.titleMedium!.color!));
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.tab, required this.selected, this.bold = false});
  final String tab;
  final bool selected;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 500.ms,
      decoration: BoxDecoration(
        color: selected ? selectedTab : blueTabs,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(tab == "Sign In" ? 15 : 5),
          topRight: const Radius.circular(5),
          bottomLeft: const Radius.circular(5),
          bottomRight: const Radius.circular(5),
        ),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: CustomText(
          text: tab,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: selected ? 20 : 16,
          color: selected ? white : grey,
        ),
      ),
    );
  }
}

class SettingsStack extends StatelessWidget {
  const SettingsStack({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget widget = Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        AnimatedContainer(
          alignment: AlignmentDirectional.center,
          duration: 100.ms,
          margin: const EdgeInsets.only(top: 55),
          height: 150,
          decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 85),
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: CustomText(text: "Settings", fontSize: 16, fontWeight: FontWeight.bold, color: white)),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Positioned(top: -8, child: Image.asset("assets/pictures/doctress.png", width: 180)),
      ],
    );
    bool state = false;
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) _) {
        return InkWell(
          onTap: () {},
          onHover: (bool value) {
            _(() => state = value);
          },
          child: SizedBox(
            height: 200,
            child: state ? widget.animate(onComplete: (AnimationController controller) => controller.repeat(reverse: true)).shimmer(colors: <Color>[white.withOpacity(.3), grey.withOpacity(.3)], duration: 1.seconds, delay: 500.ms) : widget,
          ),
        );
      },
    );
  }
}

class HatchedContainer extends StatelessWidget {
  const HatchedContainer({super.key, required this.color, required this.widget});
  final Widget widget;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 80),
      painter: HachurePainter(color: color),
      child: widget,
    );
  }
}

class HachurePainter extends CustomPainter {
  final Color color;
  const HachurePainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect rrect = RRect.fromRectAndCorners(rect, topRight: const Radius.circular(15), bottomRight: const Radius.circular(15));

    final Pattern pattern = DiagonalStripesThick(bgColor: color.withOpacity(.1), fgColor: color.withOpacity(.2));

    pattern.paintOnRRect(canvas, size, rrect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
