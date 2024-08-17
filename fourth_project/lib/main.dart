import 'package:flutter/material.dart';
import 'package:fourth_project/home_screen.dart';
import 'package:fourth_project/homework.dart';
 void main (List <String> args) {
  runApp(const MyApp());
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}