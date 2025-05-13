import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/app_keys.dart';
import 'helpers/router_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final user = FirebaseAuth.instance.currentUser;
  print('Current user: $user');
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
