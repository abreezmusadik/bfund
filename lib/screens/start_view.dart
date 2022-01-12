import 'package:bhive_fund/providers/route_generator.dart';
import 'package:bhive_fund/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  static const String routeName = '/start';

  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  void initState() {
    super.initState();
    _waitThenNavigateToRegistrationScreenOrHomeScreen();
  }

  _waitThenNavigateToRegistrationScreenOrHomeScreen() async {
    await Future.delayed(Duration(seconds: 3));
    GeneratedRoute.navigateTo(RegistrationScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Welcome', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
