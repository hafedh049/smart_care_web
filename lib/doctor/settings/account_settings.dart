import 'package:flutter/material.dart';
import 'package:smart_care_v2/custom/globals.dart';
import 'package:smart_care_v2/doctor/settings/address.dart';
import 'package:smart_care_v2/doctor/settings/my_profile.dart';
import 'package:smart_care_v2/doctor/settings/personal_info.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: welcomeWhite, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: const <Widget>[
          MyProfile(),
          SizedBox(height: 20),
          PersonalInformation(),
          SizedBox(height: 20),
          AddressInk(),
        ],
      ),
    );
  }
}
