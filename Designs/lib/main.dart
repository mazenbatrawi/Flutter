import 'package:flutter/material.dart';
import 'package:projects/layout/home_layout.dart';
import 'package:projects/modules/login/login_screen.dart';
import 'package:projects/modules/messenger/messenger_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
