import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smart_care_v2/small_screen/small_screen.dart';
import 'package:smart_care_v2/welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxHeight > 800 && constraints.maxWidth > 1100) {
            return const Welcome();
          } else {
            return const SmallScreen();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
