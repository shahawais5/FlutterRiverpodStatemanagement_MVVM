import 'package:flutter/material.dart';
import '../views/counter_view.dart';
import '../views/login_view.dart';

class RouterHelper {
  static const String initial = '/';
  static const String loginScreen = '/login';
  static const String counterScreen = '/counter';

  static final Map<String, WidgetBuilder> routes = {
    initial: (context) => const LoginView(),
    loginScreen: (context) => const LoginView(),
    counterScreen: (context) => const CounterView(),
  };
}
