import 'package:flutter/material.dart';
import 'package:auto_umbrella/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/home": (context) => Home(),
    },
  ));
}