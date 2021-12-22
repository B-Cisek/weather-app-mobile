import 'package:flutter/material.dart';
import 'package:weather_app/PermissionScreen.dart';

import 'MyHomePage.dart';
import 'SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Strings {
  static const String appTitle = 'Weather App';
}
