import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/Screens/colors.dart';
import 'package:login_page/services/auth.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setStatusBarColor();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _setStatusBarColor();
    }
  }

  void _setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: maincolor,
      statusBarIconBrightness: Brightness.light,
    ));

    @override
    void dispose() {
      _emailcontroller.dispose();
      _passwordcontroller.dispose();
      super.dispose();
    }
  }

  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _isvisible = true;

  @override
  Widget build(BuildContext context) {
    _setStatusBarColor(); 
    return SafeArea(
      child: Scaffold(
        appBar: null,
        backgroundColor: maincolor,
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 180.h,
                      width: 200.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      height: 180.h,
                      width: 180.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: maincolor,
                      ),
                    ),
                    SizedBox(
                      height: 150.h,
                      width: 180.w,
                      child: Lottie.asset('assets/animations/login.json'),
                    ),
                  ],
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // username
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0.h, horizontal: 30.0.w),
                        child: TextFormField(
                          controller: _emailcontroller,
                          cursorColor: Colors.white,
                          textInputAction: TextInputAction.next,
                          autofocus: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            prefixIcon: const Icon(
                              CupertinoIcons.mail,
                              color: Colors.white,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0.r),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0.r),
                              borderSide: const BorderSide(color: Colors.blue),
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
                      //////
                      SizedBox(height: 6.h),

                      //password
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                        child: TextFormField(
                          controller: _passwordcontroller,
                          cursorColor: Colors.white,
                          textInputAction: TextInputAction.done,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            prefixIcon: const Icon(
                              CupertinoIcons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0.r),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0.r),
                              borderSide: const BorderSide(color: Colors.blue),
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
                              return 'Password should be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),

                //Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _signIn();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(buttoncolor),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
                    ),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                  height: 15.h,
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content:
                                      Text('Sign in failed. Please try again.'),
                                ),
                              );
                            }
                          } catch (e) {
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
                      child: Image.asset(
                        'assets/images/apple.png',
                        color: Colors.grey.shade200,
                        height: 40.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an acount?",
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: maincolor,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/signupscreen');
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: buttoncolor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    try {
      User? user = await _auth.signinMethod(
        _emailcontroller.text,
        _passwordcontroller.text,
      );

      if (user != null) {
        Navigator.pushNamed(context, '/homescreen');
      } else {
        _showErrorMessage('Incorrect email or password.');
      }
    } catch (e) {
      _showErrorMessage('Login failed. Please try again.');
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
