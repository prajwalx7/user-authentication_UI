import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "User Logged In",
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, '/loginscreen');
                },
                
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: buttoncolor,
                  ),
                  child: Center(child: const Text("Sign Out")),
                ),
              ),
            ],
          ),
        ));
  }
}
