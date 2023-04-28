import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class Examination extends StatefulWidget {
  const Examination({super.key, required this.appointment});
  final Map<String, dynamic> appointment;

  @override
  State<Examination> createState() => _ExaminationState();
}

class _ExaminationState extends State<Examination> {
  final MapController _mapController = MapController();
  late final LatLng _randomLocation;

  @override
  void initState() {
    super.initState();
    _randomLocation = _getRandomLocation();
  }

  LatLng _getRandomLocation() {
    final random = Random();
    const minLat = -90.0;
    const maxLat = 90.0;
    const minLng = -180.0;
    const maxLng = 180.0;
    final lat = minLat + random.nextDouble() * (maxLat - minLat);
    final lng = minLng + random.nextDouble() * (maxLng - minLng);
    return LatLng(lat, lng);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(15)),
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CustomText(text: "Examination", fontSize: 20, fontWeight: FontWeight.bold),
                  const SizedBox(height: 10),
                  Row(
                    children: const <Widget>[
                      Icon(FontAwesomeIcons.userInjured, color: dark, size: 15),
                      SizedBox(width: 10),
                      CustomText(text: "with Hafedh Gunichi", fontSize: 14, color: grey),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(8),
                child: const Center(child: Icon(FontAwesomeIcons.ellipsis, color: blue, size: 15)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(thickness: .3, height: .3),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (final Map<String, dynamic> item in <Map<String, dynamic>>[
                    <String, dynamic>{'icon': FontAwesomeIcons.calendar, 'title': 'Date', 'subtitle': widget.appointment["date"]},
                    <String, dynamic>{'icon': FontAwesomeIcons.listCheck, 'title': 'Service', 'subtitle': widget.appointment["service"]},
                  ])
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(item['icon'], color: blue, size: 15),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CustomText(text: item['title'], fontSize: 14, color: grey),
                            const SizedBox(height: 5),
                            CustomText(text: item['subtitle'], fontSize: 14, fontWeight: FontWeight.bold),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (final Map<String, dynamic> item in <Map<String, dynamic>>[
                    <String, dynamic>{'icon': FontAwesomeIcons.clock, 'title': 'Time', 'subtitle': widget.appointment["time"]},
                    <String, dynamic>{'icon': FontAwesomeIcons.hourglass, 'title': 'Duration', 'subtitle': widget.appointment["duration"]},
                  ])
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(item['icon'], color: blue, size: 15),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CustomText(text: item['title'], fontSize: 14, color: grey),
                            const SizedBox(height: 5),
                            CustomText(text: item['subtitle'], fontSize: 14, fontWeight: FontWeight.bold),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(thickness: .3, height: .3),
          const SizedBox(height: 20),
          Container(
            height: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(center: _randomLocation, zoom: 10.0),
                children: <Widget>[
                  TileLayer(urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', subdomains: const <String>['a', 'b', 'c']),
                  MarkerLayer(
                    markers: <Marker>[
                      Marker(
                        width: 10,
                        height: 10,
                        point: _randomLocation,
                        builder: (BuildContext ctx) => const Icon(Icons.location_pin, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(15)),
              child: const Center(child: CustomText(text: "Cancel", color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
