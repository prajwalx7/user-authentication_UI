import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: Container(
        color: maincolor, //background color
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // **********The Headline**********
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Text(
                        'Embrace the Movie Experience',
                        style: GoogleFonts.barlowCondensed(
                            fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              // **********The Lottie Animation**********
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: nonmaincolor, //animation background color
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: 400,
                  height: 400,
                ),
              ),
              Lottie.asset('assets/animations/splash.json'),

              //**********Swipeable Button**********
              Padding(
                padding: const EdgeInsets.only(top: 600),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
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
                    buttontextstyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
