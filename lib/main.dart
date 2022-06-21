import 'package:flutter/material.dart';
import 'package:smartcard_saga/locator.dart';
import 'package:smartcard_saga/services/navigation_service.dart';
import 'package:smartcard_saga/ui/router.dart';
import 'package:smartcard_saga/ui/views/home_view.dart';
import 'package:smartcard_saga/ui/views/login_view.dart';
import 'package:smartcard_saga/ui/views/startup_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)),
      title: 'SMART CARD SAGA',
      home: StartUpView(),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}