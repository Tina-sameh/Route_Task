import 'package:flutter/material.dart';
import 'package:task/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     routes: {
       Screen.routeName: (context)=> Screen(),
     },
      initialRoute: Screen.routeName,
    );
  }
}
