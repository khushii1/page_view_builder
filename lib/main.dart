import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_builder/screens/home2screen.dart';
import 'package:page_view_builder/screens/homeScreen.dart';
import 'package:page_view_builder/screens/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}
