import 'package:flutter/material.dart';
import 'home_page1.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/homePage1',
    routes: {
      '/homePage1': (context) => HomePage1(),
    },
  ));
}
