import 'package:flutter/material.dart';
import 'package:healthy/authenticate/register.dart';
import 'package:healthy/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSignin = true;

  void toggleView() {
    setState(() {
      isSignin = !isSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignin == true) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
