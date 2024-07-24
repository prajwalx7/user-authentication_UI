import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/Screens/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class StatrupScreen extends StatefulWidget {
  const StatrupScreen({super.key});

  @override
  State<StatrupScreen> createState() => _StatrupScreenState();
}

class _StatrupScreenState extends State<StatrupScreen> {
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Embrace the Movie Experience',
              style: GoogleFonts.barlowCondensed(
                  fontSize: 30.sp, color: Colors.white),
            ),
            SizedBox(height: 20.h),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.r),
                  child: Container(
                    decoration: BoxDecoration(
                      color: nonmaincolor, //animation background color
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                    ),
                    width: 400.w,
                    height: 300.h,
                  ),
                ),
                Lottie.asset('assets/animations/splash.json'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
                child: SwipeableButtonView(
                  onWaitingProcess: () {
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {
                    await Navigator.pushReplacementNamed(
                        context, '/loginscreen');
                    setState(() {
                      isFinished = false;
                    });
                  },
                  activeColor: buttoncolor,
                  isFinished: isFinished,
                  buttonWidget: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                  buttonText: 'Get Started',
                  buttontextstyle: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
