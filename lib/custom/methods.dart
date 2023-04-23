import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void showToast({required String text}) {
  Fluttertoast.showToast(msg: text, fontSize: 20, webPosition: "right", webBgColor: "rgb(109, 169, 228)", webShowClose: true, timeInSecForIosWeb: 3);
}

void goToPage(Widget page) {
  Get.to(page, duration: 200.ms, transition: Transition.values[Random().nextInt(Transition.values.length)]);
}
