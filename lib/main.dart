import 'dart:async';
import 'package:alarms_app/alarms_page.dart';
import 'package:alarms_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = new GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Alarm',
      home: HomePage(),
     // navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: 'JosefinSans',
      ),
    );
  }
}
