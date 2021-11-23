import 'package:flutter/material.dart';

import 'Welcome/WelcomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF7047EB),
      ),
      home: WelcomeScreen(),
    );
  }
}
