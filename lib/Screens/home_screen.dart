import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/Screens/colors.dart';
import 'package:login_page/Screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: buttoncolor,
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "User Logged In Successfully",
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
            SizedBox(
              height: 25.h,
            ),
            GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  SystemChrome.setSystemUIOverlayStyle(
                      const SystemUiOverlayStyle(
                    statusBarColor: maincolor,
                    statusBarIconBrightness: Brightness.light,
                  ));
                });
              },
              child: Container(
                height: 30.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: buttoncolor,
                ),
                child: Center(
                    child: Text(
                  "Sign Out",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
