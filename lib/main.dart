import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/Screens/colors.dart';
import 'package:login_page/Screens/home_screen.dart';
import 'package:login_page/Screens/login_screen.dart';
import 'package:login_page/Screens/signup_screen.dart';
import 'package:login_page/Screens/startup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: (context, _) {
          return MaterialApp(
            initialRoute: '/loginscreen',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textSelectionTheme: const TextSelectionThemeData(
                selectionColor: Colors.deepPurple,
                selectionHandleColor: Colors.deepPurple,
              ),
              primaryColor: maincolor,
              scaffoldBackgroundColor: const Color(0xFF212121),
            ),
            home: const StatrupScreen(),
            routes: {
              '/loginscreen': (context) => const LoginScreen(),
              '/signupscreen': (context) => const SignupScreen(),
              '/homescreen': (context) => const HomeScreen(),
              '/startupscreen': (context) => const StatrupScreen(),
            },
          );
        });
  }
}
