import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/zoomentry_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.white),
          ),
          primaryColor: Colors.redAccent),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ZoomEntry.id: (context) => ZoomEntry(),
      },
    );
  }
}
