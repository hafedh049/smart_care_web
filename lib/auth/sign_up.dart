import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:password_strength/password_strength.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    _usernameController.dispose();
    _idController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  bool _hidePassword = true;

  List<dynamic> _evaluatePassword(double estimation) {
    if (estimation == 0) {
      return const <dynamic>[0, ""];
    } else if (estimation < .4) {
      return const <dynamic>[0, "Weak"];
    } else if (estimation < .6) {
      return const <dynamic>[1, "Medium"];
    } else {
      return const <dynamic>[2, "Strong"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                for (final Map<String, dynamic> page in <Map<String, dynamic>>[
                  <String, dynamic>{"text": 'Username', "controller": _usernameController},
                  <String, dynamic>{"text": 'ID', "controller": _idController},
                  <String, dynamic>{"text": 'E-mail', "controller": _usernameController},
                  <String, dynamic>{"text": 'Password', "controller": _passwordController},
                  <String, dynamic>{"text": 'Phone number', "controller": _phoneNumberController}
                ])
                  if (page["text"] != "Password")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CustomText(text: page["text"], fontWeight: FontWeight.bold),
                        const SizedBox(height: 10),
                        TextFormField(controller: page["controller"], decoration: InputDecoration(hintText: 'Enter your ${page["text"].toLowerCase()}', border: const OutlineInputBorder())),
                      ],
                    )
                  else
                    StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) _) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CustomText(text: page["text"], fontWeight: FontWeight.bold),
                            const SizedBox(height: 10),
                            TextFormField(
                              onChanged: (String value) => _(() {}),
                              controller: page["controller"],
                              obscureText: _hidePassword,
                              decoration: InputDecoration(
                                hintText: 'Enter your ${page["text"].toLowerCase()}',
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(onPressed: () => _(() => _hidePassword = !_hidePassword), icon: Icon(!_hidePassword ? Icons.visibility : Icons.visibility_off, color: blue, size: 25)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            AnimatedContainer(
                              duration: 300.ms,
                              height: 3,
                              width: estimatePasswordStrength(_passwordController.text.trim()) * 300,
                              color: const <Color>[Colors.redAccent, blue, Colors.greenAccent][_evaluatePassword(estimatePasswordStrength(_passwordController.text.trim()))[0]],
                            ),
                            const SizedBox(height: 10),
                            CustomText(text: _evaluatePassword(estimatePasswordStrength(_passwordController.text.trim()))[1], fontSize: 18, fontWeight: FontWeight.bold),
                          ],
                        );
                      },
                    ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const CustomText(text: 'Phone number', fontWeight: FontWeight.bold),
                    const SizedBox(height: 5),
                    IntlPhoneField(
                      initialCountryCode: "TN",
                      controller: _phoneNumberController,
                      cursorColor: blue,
                      decoration: const InputDecoration(hintText: 'Enter your phone number', border: OutlineInputBorder()),
                      initialValue: "eg: +216 23 566 502",
                      dropdownTextStyle: GoogleFonts.roboto(fontSize: 16),
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[\d \+]'))],
                      invalidNumberMessage: "Invalid mobile number",
                      dropdownDecoration: const BoxDecoration(),
                      textInputAction: TextInputAction.done,
                      pickerDialogStyle: PickerDialogStyle(),
                      onChanged: (PhoneNumber value) {},
                      onCountryChanged: (Country value) {},
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _pageController.nextPage(duration: 300.ms, curve: Curves.linear);

                if (_formKey.currentState!.validate()) {
                  // Process data
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                child: CustomText(text: 'Sign Up', fontSize: 20, color: white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
