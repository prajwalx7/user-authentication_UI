import 'package:flutter/material.dart';
import 'package:login_page/pages/colors.dart';
import 'package:lottie/lottie.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: maincolor,
      body: ListView(
        children: [
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Container(
                    child: Lottie.network(
                        "https://lottie.host/860eae11-051d-4c0a-9d04-4f4dad2dca83/2qM17yulCo.json",
                        fit: BoxFit.cover,
                        height: 200,
                        width: 200),
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
                    // maxLength: 15,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
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
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.mail, color: Colors.white),
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
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                //Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Icon(Icons.key, color: Colors.white),
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
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(buttoncolor),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                  ),
                  child: Text(
                    "SIGN UP",
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an acount?",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(width: 3),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: buttoncolor),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
