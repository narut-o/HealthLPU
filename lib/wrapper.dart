import 'package:flutter/material.dart';
import 'package:healthy/authenticate/authenticate.dart';
import 'package:healthy/model/customuser.dart';
import 'package:healthy/screens/home.dart';
import 'package:healthy/screens/homepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Customuser?>(context);
    print("thisD${user}");

    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
