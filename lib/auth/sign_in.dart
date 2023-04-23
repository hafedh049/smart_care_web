import 'package:flutter/material.dart';
import 'package:smart_care_v2/custom/customs.dart';
import 'package:smart_care_v2/custom/globals.dart';
import 'package:smart_care_v2/custom/methods.dart';
import 'package:smart_care_v2/sidebar/sidebar_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 20.0),
        const CustomText(text: 'E-mail', fontSize: 18, fontWeight: FontWeight.bold),
        const SizedBox(height: 10),
        TextFormField(decoration: const InputDecoration(hintText: 'eg: example@domain.com', border: OutlineInputBorder())),
        const SizedBox(height: 20),
        const CustomText(text: 'Password', fontSize: 18, fontWeight: FontWeight.bold),
        const SizedBox(height: 10),
        StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) _) {
            return TextFormField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => _(() => _isPasswordVisible = !_isPasswordVisible),
                  icon: Icon(!_isPasswordVisible ? Icons.visibility_off : Icons.visibility, color: blue),
                ),
                hintText: 'eg: Password1234',
                border: const OutlineInputBorder(),
              ),
            );
          },
        ),
        const SizedBox(height: 30.0),
        Center(
          child: ElevatedButton(
            onPressed: () {
              goToPage(const SideBarScreen());
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 89.0, vertical: 10.0),
              child: CustomText(text: 'Sign In', fontSize: 20.0, color: white),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset("assets/pictures/google.png", width: 20, height: 20),
                  const SizedBox(width: 10),
                  const CustomText(text: 'Continue With Google', fontSize: 20.0, color: white),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        TextButton(
          onPressed: () {},
          child: const CustomText(text: 'Forgot password?', fontSize: 16.0, color: blue),
        ),
      ],
    );
  }
}
