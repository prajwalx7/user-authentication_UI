import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/Screens/colors.dart';
import 'package:login_page/services/auth.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _isvisible = true;

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: maincolor,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: maincolor,
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 180,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: maincolor,
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: Lottie.asset('assets/animations/login.json'),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // username
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 30.0),
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
                              borderRadius: BorderRadius.circular(18.0),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0),
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
                      const SizedBox(height: 10),

                      //password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade500),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
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
                              )),
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

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                const SizedBox(
                  height: 25,
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
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/images/google.png',
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade600),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/images/apple.png',
                        height: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an acount?",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(width: 3),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maincolor,
                        elevation: 0.0,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/signupscreen');
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: buttoncolor),
                      ),
                    )
                  ],
                )
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
