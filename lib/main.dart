import 'package:flutter/material.dart';
import 'package:login_page/pages/colors.dart';
import 'package:login_page/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: maincolor,
        scaffoldBackgroundColor: const Color(0xFF212121),
      ),
      home: const MainPage(),
    );
  }
}
