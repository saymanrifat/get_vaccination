import 'package:flutter/material.dart';
import 'package:get_vaccination/home.dart';
import 'package:get_vaccination/result.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'home',
    debugShowCheckedModeBanner: false,
    routes: {
      'home': (context) => MyHomePage(),
      'result': (context) => MyResultPage(),
    },
  ));
}
