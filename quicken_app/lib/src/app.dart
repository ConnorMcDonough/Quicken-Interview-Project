import 'package:flutter/material.dart';
import 'package:quicken_app/src/screens/login_screen.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quicken Homework Project",
      theme: ThemeData(primaryColor: Colors.deepOrangeAccent),
      home: LoginScreen(),
    );
  }
}
