import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      child: Lottie.asset(
                        "assets/animations/signup.json",
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  const Text(
                    'Hurray New User!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // username
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _usernamecontroller,
                      // maxLength: 15,
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
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 75, 57, 239),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  //Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _emailcontroller,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.done,
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
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 75, 57, 239),
                          ),
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
                  const SizedBox(height: 15),

                  //Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _passwordcontroller,
                      cursorColor: Colors.white,
                      textInputAction: TextInputAction.next,
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
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 75, 57, 239),
                            ),
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
                              })),
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
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: _signUp,
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(buttoncolor),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an acount?",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(width: 3),
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: maincolor,
                          elevation: 0.0,
                          padding: EdgeInsets.zero,
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
                      )
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

      User? user = await _auth.signupMethod(email, password);

      if (user != null) {
        print("User Created");
        Navigator.pushNamed(context, '/homescreen');
      } else {
        print("Error Occurred");
      }
    }
  }
}
