import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../custom/customs.dart';
import '../../../custom/globals.dart';

class YourIncome extends StatelessWidget {
  const YourIncome({super.key});

  @override
  Widget build(BuildContext context) {
    bool income = false;
    bool expense = false;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              const CustomText(text: "Your Income", fontSize: 20, fontWeight: FontWeight.bold),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(border: Border.all(width: .3, color: grey), color: white, borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      CustomText(text: "Monthly"),
                      SizedBox(width: 5),
                      Icon(FontAwesomeIcons.chevronDown, size: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(children: <Widget>[Expanded(child: Container(height: .5, color: grey))]),
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              SizedBox(
                height: 300,
                child: StatefulBuilder(
                  builder: (BuildContext context, void Function(void Function()) _) {
                    return PieChart(
                      PieChartData(
                        centerSpaceRadius: 70,
                        sectionsSpace: 15,
                        startDegreeOffset: -pi,
                        pieTouchData: PieTouchData(
                          enabled: true,
                          mouseCursorResolver: null,
                          touchCallback: (FlTouchEvent flTouchEvent, PieTouchResponse? pieTouchResponse) {
                            if (flTouchEvent is! FlPointerHoverEvent) {
                              if (flTouchEvent.isInterestedForInteractions) {
                                if (pieTouchResponse!.touchedSection!.touchedSectionIndex == 0) {
                                  _(() => income = !income);
                                } else {
                                  _(() => expense = !expense);
                                }
                              }
                            }
                          },
                        ),
                        sections: <PieChartSectionData>[
                          PieChartSectionData(value: .7, showTitle: false, color: blue, radius: income ? 30 : 23),
                          PieChartSectionData(value: .3, showTitle: false, color: Colors.amber.shade900, radius: expense ? 30 : 23),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  CustomText(text: "Income", fontSize: 14, color: grey),
                  CustomText(text: "\$2000.00", fontSize: 16, fontWeight: FontWeight.normal),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const CircleAvatar(backgroundColor: blue, radius: 10),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      CustomText(text: "Income", fontSize: 14, color: grey),
                      CustomText(text: "\$2000.00", fontSize: 16, fontWeight: FontWeight.normal),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(backgroundColor: Colors.amber.shade900, radius: 10),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      CustomText(text: "Expenses", fontSize: 14, color: grey),
                      CustomText(text: "1000", fontSize: 16, fontWeight: FontWeight.normal),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
