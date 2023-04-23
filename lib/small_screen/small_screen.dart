import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_care_v2/custom/customs.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Lottie.asset('assets/lotties/small_screen.json', width: width * 0.5, height: height * 0.5),
                const CustomText(text: 'Window is too small!', fontWeight: FontWeight.bold, fontSize: 24),
                const SizedBox(height: 20),
                const CustomText(text: "You're in! But it seems the window is too small or too zoomed in.", fontSize: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
