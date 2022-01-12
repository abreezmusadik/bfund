import 'package:bhive_fund/providers/get_it_setup.dart';
import 'package:bhive_fund/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'providers/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // setUpGetIt();
  //
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GeneratedRoute.navigatorKey,
      initialRoute: LoginScreen.routeName,
      onGenerateRoute: GeneratedRoute.onGenerate,
      title: 'Email And Password Login',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
