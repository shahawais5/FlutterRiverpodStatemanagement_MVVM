import 'package:flutter/material.dart';
import 'package:statemanagement/views/bottom_navigation_view.dart';
import 'package:statemanagement/views/users_view.dart';
import '../views/counter_view.dart';
import '../views/login_view.dart';

class RouterHelper {
  static const String initial = '/';
  static const String loginScreen = '/login';
  static const String counterScreen = '/counter';
  static const String userScreen = '/userScreen';
  static const String bottomNavigation = '/bottomNavigation';

  static final Map<String, WidgetBuilder> routes = {
    initial: (context) => const LoginView(),
    loginScreen: (context) => const LoginView(),
    counterScreen: (context) => const CounterView(),
    userScreen: (context) => UsersView(),
    bottomNavigation: (context) => RootScreen(),
  };
}
