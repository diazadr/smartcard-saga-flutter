import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcard_saga/constants/route_name.dart';
import 'package:smartcard_saga/ui/views/home_view.dart';
import 'package:smartcard_saga/ui/views/login_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name) {
    case loginViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: LoginView()
      );
    case homeViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: HomeView()
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        )
      );
  }
}

PageRoute _pageRoute({String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
    builder: (_) => viewToShow,
    settings: RouteSettings(
      name: routeName
    )
  );
}