import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class IncomingPatientHistory extends StatefulWidget {
  const IncomingPatientHistory({super.key});

  @override
  State<IncomingPatientHistory> createState() => _IncomingPatientHistoryState();
}

class _IncomingPatientHistoryState extends State<IncomingPatientHistory> {
  final List<List<FlSpot>> _data = <List<FlSpot>>[
    <FlSpot>[const FlSpot(0, 5.8), const FlSpot(.8, 5.8), const FlSpot(1.5, 4), const FlSpot(2.5, 4), const FlSpot(3.5, 8.4), const FlSpot(4, 8.6), const FlSpot(4.5, 7), const FlSpot(5, 7)],
    <FlSpot>[const FlSpot(0, 0), const FlSpot(0.5, 1), const FlSpot(1, 1.5), const FlSpot(1.5, 1), const FlSpot(2, 1.8), const FlSpot(2.3, 2), const FlSpot(2.5, 1.5), const FlSpot(2.7, 1.2), const FlSpot(3, 0.8), const FlSpot(3.5, 0.5), const FlSpot(4, 0.7), const FlSpot(4.5, 0.9), const FlSpot(5, 0.6)],
    <FlSpot>[const FlSpot(0, 0), const FlSpot(0.5, 1.2), const FlSpot(1, 1), const FlSpot(1.5, 1.5), const FlSpot(2, 1.8), const FlSpot(2.3, 2), const FlSpot(2.5, 1.5), const FlSpot(2.7, 1.2), const FlSpot(3, 0.8), const FlSpot(3.5, 0.5), const FlSpot(4, 0.7), const FlSpot(4.5, 0.9), const FlSpot(5, 1.1)],
  ];
  int _chartIndex = 0;
  final List<Map<String, dynamic>> _tilesList = <Map<String, dynamic>>[
    <String, dynamic>{
      'index': 0,
      'visited': true,
      'color': blue,
      'icon': FontAwesomeIcons.user,
      'title': "New Patients",
      'number': 560,
      'curve': const <FlSpot>[FlSpot(0, 0), FlSpot(0.5, 1.5), FlSpot(1, 2), FlSpot(1.5, 2.25), FlSpot(2, 2), FlSpot(2.5, 1.5), FlSpot(3, 0), FlSpot(3.5, 0.25), FlSpot(4, 1), FlSpot(4.5, 1.75), FlSpot(5, 2), FlSpot(6, 1.5), FlSpot(7, 0.75), FlSpot(8, 0)]
    },
    <String, dynamic>{
      'index': 1,
      'visited': false,
      'color': Colors.orange,
      'icon': FontAwesomeIcons.suitcaseMedical,
      'title': "Injections",
      'number': 300,
      'curve': const <FlSpot>[FlSpot(0, 0), FlSpot(0.25, 0.5), FlSpot(0.5, 1), FlSpot(0.75, 0.5), FlSpot(1, 0), FlSpot(1.25, -0.5), FlSpot(1.5, -1), FlSpot(1.75, -0.5), FlSpot(2, 0), FlSpot(2.25, 0.5), FlSpot(2.5, 1), FlSpot(2.75, 0.5), FlSpot(3, 0), FlSpot(3.25, -0.5), FlSpot(3.5, -1), FlSpot(3.75, -0.5), FlSpot(4, 0), FlSpot(4.25, 0.5), FlSpot(4.5, 1), FlSpot(4.75, 0.5), FlSpot(5, 0), FlSpot(6, 0), FlSpot(7, 0), FlSpot(8, 0)]
    },
    <String, dynamic>{
      'index': 2,
      'visited': false,
      'color': Colors.redAccent,
      'icon': FontAwesomeIcons.heartPulse,
      'title': "Surgery",
      'number': 200,
      'curve': const <FlSpot>[FlSpot(0, 0), FlSpot(0.5, 0.25), FlSpot(1, 1), FlSpot(1.5, 2.25), FlSpot(1.8, 2.25), FlSpot(2, 2), FlSpot(2.3, 1.44), FlSpot(2.5, 1), FlSpot(2.7, 0.729), FlSpot(3, 0.243), FlSpot(3.5, 0.041), FlSpot(3.7, 0.029), FlSpot(4, 0.064), FlSpot(4.5, 0.455), FlSpot(4.7, 0.607), FlSpot(5, 0.111), FlSpot(6, 0.013), FlSpot(7, 0.002), FlSpot(8, 0.0)],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            const CustomText(text: "Incoming Patient History", fontSize: 20, fontWeight: FontWeight.bold),
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
        const SizedBox(height: 20),
        StatefulBuilder(builder: (BuildContext context, void Function(void Function()) _) {
          return Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  for (final Map<String, dynamic> item in _tilesList)
                    GestureDetector(
                      onTap: () {
                        _(() {
                          for (final Map<String, dynamic> element in _tilesList) {
                            element["visited"] = false;
                          }
                          item["visited"] = true;
                          _chartIndex = item["index"];
                        });
                      },
                      child: AnimatedContainer(
                        duration: 100.ms,
                        width: item["visited"] ? 210 : 200,
                        height: item["visited"] ? 85 : 80,
                        margin: const EdgeInsets.only(bottom: 8.0),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(border: Border.all(color: grey, width: .5), color: item["visited"] ? white : white.withOpacity(.3), borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CircleAvatar(backgroundColor: item["color"], radius: 20, child: Icon(item["icon"], color: white, size: 15)),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomText(text: item["title"], fontSize: 16, fontWeight: FontWeight.bold),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    CustomText(text: item["number"].toString(), fontSize: 14, color: item["color"]),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 60,
                                      height: 10,
                                      child: LineChart(
                                        LineChartData(
                                          minX: 0,
                                          maxX: 8,
                                          minY: 0,
                                          maxY: 3,
                                          borderData: FlBorderData(show: false),
                                          gridData: FlGridData(show: false),
                                          lineBarsData: <LineChartBarData>[
                                            LineChartBarData(
                                              spots: item["curve"],
                                              isStrokeCapRound: true,
                                              gradient: LinearGradient(colors: <Color>[item["color"], item["color"].withOpacity(0.4)]),
                                              barWidth: 2,
                                              isCurved: true,
                                              curveSmoothness: 0.2,
                                              dotData: FlDotData(show: false),
                                            ),
                                          ],
                                          titlesData: FlTitlesData(show: false),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 320,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(10.0)),
                  child: LineChart(
                    LineChartData(
                      lineTouchData: LineTouchData(enabled: true),
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(
                        drawVerticalLine: false,
                        show: true,
                        horizontalInterval: 2,
                        getDrawingHorizontalLine: (double value) {
                          if (value == 0 || value == 10) {
                            return FlLine(color: grey.withOpacity(0.8), strokeWidth: 1);
                          } else {
                            return FlLine(color: grey.withOpacity(0.4), strokeWidth: 1);
                          }
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          axisNameSize: 8,
                          sideTitles: SideTitles(
                            interval: 1,
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta _) {
                              return Container(margin: EdgeInsets.only(top: 6.0, right: value.toInt() == 5 ? 8 : 0), child: CustomText(text: monthNames[value.toInt() % 12]!, color: grey, fontSize: 14));
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            interval: 2,
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta _) {
                              return const <int>[-1, 11].contains(value.toInt()) ? const SizedBox() : CustomText(text: value.toInt().toString(), color: grey, fontSize: 14);
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      minX: 0,
                      maxX: 5,
                      minY: -1,
                      maxY: 11,
                      lineBarsData: <LineChartBarData>[
                        LineChartBarData(
                          spots: _data[_chartIndex],
                          isCurved: true,
                          belowBarData: BarAreaData(show: true, gradient: LinearGradient(colors: <Color>[_tilesList[_chartIndex]["color"].withOpacity(.6), _tilesList[_chartIndex]["color"].withOpacity(.2)])),
                          gradient: LinearGradient(colors: <Color>[_tilesList[_chartIndex]["color"].withOpacity(.7), _tilesList[_chartIndex]["color"].withOpacity(.2)]),
                          barWidth: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            for (final Map<String, dynamic> item in const <Map<String, dynamic>>[
              <String, dynamic>{'color': blue, 'icon': FontAwesomeIcons.handHoldingHeart, 'title': "Consultations", 'number': 1032},
              <String, dynamic>{'color': Colors.redAccent, 'icon': FontAwesomeIcons.heartCircleCheck, 'title': "In Progress", 'number': 132},
              <String, dynamic>{'color': Colors.orange, 'icon': FontAwesomeIcons.pills, 'title': "In Review", 'number': 128},
            ])
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8.0),
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: item["color"],
                    image: DecorationImage(image: const AssetImage("assets/pictures/ripples.png"), fit: const <BoxFit>[BoxFit.contain, BoxFit.cover][Random().nextInt(2)]),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: <BoxShadow>[BoxShadow(color: item["color"], blurRadius: 5, offset: const Offset(0, 1))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(5)),
                        child: Center(child: Icon(item["icon"], color: item["color"], size: 25)),
                      ),
                      const Spacer(),
                      CustomText(text: item["number"].toString(), fontSize: 16, color: white, fontWeight: FontWeight.bold),
                      const SizedBox(height: 5),
                      CustomText(text: item["title"], fontSize: 15, color: white),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
