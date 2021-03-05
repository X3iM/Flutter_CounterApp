import 'package:flutter/material.dart';
import 'package:flutter_counter/core/constants/strings.dart';
import 'package:flutter_counter/core/exceptions/route_exception.dart';
import 'package:flutter_counter/presentation/screens/counter_screen/counter_screen.dart';

class AppRouter {
  static const String counter = 'counter';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case counter:
        return MaterialPageRoute(
            builder: (_) => CounterScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
