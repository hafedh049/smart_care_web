import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../custom/customs.dart';
import '../../custom/globals.dart';

class AddressInk extends StatelessWidget {
  const AddressInk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomText(text: "Address", fontWeight: FontWeight.bold, fontSize: 20),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: white, border: Border.all(width: .3, color: grey)),
                  child: Row(
                    children: const <Widget>[
                      CustomText(text: "Edit", color: grey, fontSize: 14),
                      SizedBox(width: 5),
                      Icon(FontAwesomeIcons.pencil, size: 15, color: grey),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  CustomText(text: "Country", color: grey, fontSize: 14),
                  SizedBox(height: 10),
                  CustomText(text: "United Kingdom", fontSize: 16, fontWeight: FontWeight.bold),
                  SizedBox(height: 20),
                  CustomText(text: "Postal Code", color: grey, fontSize: 14),
                  SizedBox(height: 10),
                  CustomText(text: "ERT 2354", fontSize: 16, fontWeight: FontWeight.bold),
                ],
              ),
              const SizedBox(width: 200),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  CustomText(text: "City / State", color: grey, fontSize: 14),
                  SizedBox(height: 10),
                  CustomText(text: "Leeds, East London", fontSize: 16, fontWeight: FontWeight.bold),
                  SizedBox(height: 20),
                  CustomText(text: "ID", color: grey, fontSize: 14),
                  SizedBox(height: 10),
                  CustomText(text: "A545645756", fontSize: 16, fontWeight: FontWeight.bold),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
