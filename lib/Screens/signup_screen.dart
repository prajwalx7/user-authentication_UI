import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/Screens/colors.dart';
import 'package:login_page/services/auth.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupScreen> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _isvisible = true;

  @override
  void dispose() {
    _usernamecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: maincolor,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      appBar: null,
      backgroundColor: maincolor,
      body: ListView(
        children: [
          SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Container(
                      child: Lottie.asset(
                        "assets/animations/signup.json",
                        fit: BoxFit.cover,
                        height: 150.h,
                        width: 180.w,
                      ),
                    ),
                  ),
                  Text(
                    'Hurray New User!',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  // username
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                    child: TextFormField(
                      controller: _usernamecontroller,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        prefixIcon: const Icon(CupertinoIcons.person,
                            color: Colors.white),
                        labelStyle: const TextStyle(color: buttoncolor),
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 75, 57, 239),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please set a username';
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),

                  //Email
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                    child: TextFormField(
                      controller: _emailcontroller,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        prefixIcon: const Icon(CupertinoIcons.mail,
                            color: Colors.white),
                        labelStyle: const TextStyle(color: buttoncolor),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 75, 57, 239),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!value.contains('@gmail.com')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),

                  //Password
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                    child: TextFormField(
                      controller: _passwordcontroller,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        prefixIcon: const Icon(CupertinoIcons.lock,
                            color: Colors.white),
                        labelStyle: const TextStyle(color: buttoncolor),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 75, 57, 239),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        suffixIcon: IconButton(
                          icon: _isvisible
                              ? const Icon(CupertinoIcons.eye_slash)
                              : const Icon(CupertinoIcons.eye),
                          color: Colors.white54,
                          onPressed: () {
                            setState(() {
                              _isvisible = !_isvisible;
                            });
                          },
                        ),
                      ),
                      obscureText: _isvisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: _signUp,
                    style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(buttoncolor),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Text(
                            'or continue with',
                            style: TextStyle(color: Colors.grey.shade400),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade600),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            try {
                              User? user = await _auth.signInWithGoogle();
                              if (user != null) {
                                Navigator.pushReplacementNamed(
                                    context, '/homescreen');
                              } else {
                                print("Sign in failed");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                        'Sign in failed. Please try again.'),
                                  ),
                                );
                              }
                            } catch (e) {
                              print("Error signing in: $e");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      'An error occurred. Please try again.'),
                                ),
                              );
                            }
                          },
                          child: Image.asset(
                            'assets/images/google.png',
                            height: 40.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade600),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/apple.png',
                            color: Colors.grey.shade200,
                            height: 40.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an acount?",
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: maincolor,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/loginscreen');
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: buttoncolor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailcontroller.text;
      String password = _passwordcontroller.text;

      User? user = await _auth.signUpMethod(context, email, password);

      if (user != null && mounted) {
        // print("User Created");
        Navigator.pushNamed(context, '/homescreen');
      } else {
        // print("Error Occurred");
      }
    }
  }
}
