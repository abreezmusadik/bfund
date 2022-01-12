import 'package:flutter/material.dart';
import 'package:bhive_fund/screens/login_screen.dart';
import 'package:bhive_fund/screens/registration_screen.dart';
import 'package:bhive_fund/screens/home_screen.dart';

class GeneratedRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  //
  static Future<dynamic> navigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static goBack() {
    return navigatorKey.currentState!.pop();
  }

  static Route<dynamic> onGenerate(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      // case login_screen.routeName:
      //   return MaterialPageRoute(builder: (_) => login_screen());
      //   break;
      case RegistrationScreen.routeName:
        if (arg is String) {
          return MaterialPageRoute(
                  builder: (_) => RegistrationScreen()) //referrarCode: arg))
              ;
        }
        return MaterialPageRoute(builder: (_) => RegistrationScreen());

      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
    }
  }

  static Route<dynamic> _onPageNotFound() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Page Not Found'),
        ),
      ),
    );
  }
}
