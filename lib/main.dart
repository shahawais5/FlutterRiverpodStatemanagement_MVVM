import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/app_keys.dart';
import 'helpers/router_helper.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Riverpod Statemanagement',
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: AppKeys.mainNavigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: RouterHelper.initial,
      routes: RouterHelper.routes,
    );
  }
}
