

import 'package:flutter/material.dart';
import 'package:lenovarustisia/homepage/lib/Components/button.dart';
import 'package:lenovarustisia/homepage/lib/Views/login.dart';
import 'package:lenovarustisia/homepage/lib/Views/signup.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LA NUOVA RUSTICA",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                "Authenticate to access your vital information",
                style: TextStyle(color: Colors.grey),
              ),
              Expanded(child: Image.asset("images/img4.png")),
              Button(label: "LOGIN", press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
              }),
              Button(label: "SIGN UP", press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupScreen()));
              }),
            ],
          ),
        ),
      )),
    );
  }
}
