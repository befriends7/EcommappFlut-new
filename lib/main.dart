import 'package:ecomap/homePage.dart';
import 'package:ecomap/loginpg.dart';
import 'package:ecomap/setUplocator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';



void main() {
  setUplocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return homePage();
  }
}
