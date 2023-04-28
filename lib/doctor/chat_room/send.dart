import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../custom/globals.dart';

class Send extends StatelessWidget {
  const Send({super.key, required this.callback, required this.icon});
  final void Function() callback;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    bool state = false;
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) _) {
        return InkWell(
          onTap: callback,
          onHover: (bool value) => _(() => state = value),
          splashColor: blue.withOpacity(.3),
          hoverColor: blue.withOpacity(.2),
          child: AnimatedContainer(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            duration: 300.ms,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: state ? blue.withOpacity(.3) : white),
            width: state ? 43 : 40,
            height: state ? 43 : 40,
            child: Icon(icon, size: 20, color: state ? blue : grey),
          ),
        );
      },
    );
  }
}
