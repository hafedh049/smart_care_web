import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class BookingRate extends StatelessWidget {
  const BookingRate({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> heights = <double>[2, 3.8, 0.5, 3.6, 2.2, 5.8, 3.7];
    const List<FlSpot> data = <FlSpot>[
      FlSpot(0, 0),
      FlSpot(0.5, 2),
      FlSpot(1, 3),
      FlSpot(1.5, 2),
      FlSpot(1.7, 1.8),
      FlSpot(2, 0),
      FlSpot(2.3, 1),
      FlSpot(2.5, 2),
      FlSpot(2.7, 2.5),
      FlSpot(3, 3),
      FlSpot(3.5, 2),
      FlSpot(3.7, 2.5),
      FlSpot(4, 3),
      FlSpot(4.5, 2),
      FlSpot(5, 1),
      FlSpot(6, 2),
      FlSpot(7, 2.5),
      FlSpot(8, 3),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            const CustomText(text: "Booking Rate", fontSize: 20, fontWeight: FontWeight.bold),
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
        Row(
          children: <Widget>[
            SizedBox(
              width: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomText(text: "58%", fontSize: 35, fontWeight: FontWeight.bold),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(5)),
                        child: const Center(child: Icon(FontAwesomeIcons.userCheck, size: 15, color: white)),
                      ),
                      const SizedBox(width: 5),
                      const Expanded(child: CustomText(text: "Your total patients on friday", isCentered: false, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(children: <Widget>[Expanded(child: Container(height: .5, color: grey, width: 200))]),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const CircleAvatar(radius: 15, backgroundColor: blue, child: Center(child: Icon(FontAwesomeIcons.chartLine, size: 15, color: white))),
                      const SizedBox(width: 5),
                      const CustomText(text: "6%", fontSize: 16),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 60,
                        height: 20,
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
                                spots: data,
                                isStrokeCapRound: true,
                                gradient: LinearGradient(colors: <Color>[blue, blue.withOpacity(0.4)]),
                                barWidth: 2,
                                isCurved: true,
                                curveSmoothness: 0.2,
                                dotData: FlDotData(show: false),
                              ),
                            ],
                            titlesData: FlTitlesData(
                              show: false, // hide axis labels
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomText(text: "Your booking rate is 6% increase than previous day.", isCentered: false, fontSize: 16, color: grey),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 300,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: white.withOpacity(.8), borderRadius: BorderRadius.circular(15)),
                child: BarChart(
                  BarChartData(
                    borderData: FlBorderData(show: false),
                    maxY: 9,
                    minY: -1,
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 2,
                          getTitlesWidget: (double value, TitleMeta meta) => const <int>[-1, 9].contains(value.toInt()) ? const SizedBox() : CustomText(text: value.toInt().toString(), fontSize: 14, color: grey),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) => Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            child: CustomText(text: weekDays[value.toInt()]!, fontWeight: FontWeight.bold, fontSize: 14, color: grey),
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: white.withOpacity(.8),
                    gridData: FlGridData(show: true, drawHorizontalLine: true, drawVerticalLine: false, horizontalInterval: 2, checkToShowHorizontalLine: (double value) => const <int>[0, 2, 4, 6, 8].contains(value.toInt())),
                    barGroups: heights
                        .asMap()
                        .map(
                          (int index, double value) => MapEntry(
                            index,
                            BarChartGroupData(
                              x: index,
                              barRods: <BarChartRodData>[
                                BarChartRodData(
                                  toY: value,
                                  color: index <= 3
                                      ? Colors.blue
                                      : index == 4
                                          ? Colors.amber.shade900
                                          : grey,
                                  width: 25,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                                ),
                              ],
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
