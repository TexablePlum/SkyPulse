import 'package:flutter/material.dart';
import 'package:sky_pulse/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen());
  }
}

class Strings
{
  static const String appTitle = 'SkyPulse';
}


