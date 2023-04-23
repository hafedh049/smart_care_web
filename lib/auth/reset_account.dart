import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class RecoveryAccountScreen extends StatefulWidget {
  const RecoveryAccountScreen({super.key});

  @override
  State<RecoveryAccountScreen> createState() => _RecoveryAccountScreenState();
}

class _RecoveryAccountScreenState extends State<RecoveryAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Center(child: Lottie.asset('assets/lotties/recovery.json', fit: BoxFit.cover))),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(controller: _emailController, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(hintText: 'E-mail', border: OutlineInputBorder())),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), child: CustomText(text: 'Recover Account', fontSize: 20, fontWeight: FontWeight.bold, color: white)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
