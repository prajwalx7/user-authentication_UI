import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/colors.dart';
import 'package:login_page/pages/home_screen.dart';
import 'package:login_page/pages/login_screen.dart';
import 'package:login_page/pages/signup_screen.dart';
import 'package:login_page/pages/welcome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

      routes: {
        '/loginscreen' : (context) => const LoginScreen(),
        '/signupscreen' : (context) => const SignupScreen(),
        '/homescreen' : (context) => const HomeScreen(),
      },
    );
  }
}
