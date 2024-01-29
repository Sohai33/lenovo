import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lenovarustisia/JSON/users.dart';
import 'package:lenovarustisia/SQLite/database_helper.dart';
import 'package:lenovarustisia/homepage/lib/Components/button.dart';
import 'package:lenovarustisia/homepage/lib/Components/colors.dart';
import 'package:lenovarustisia/homepage/lib/Components/textfield.dart';
import 'package:lenovarustisia/homepage/lib/Views/login.dart';
import 'package:lenovarustisia/homepage/lib/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


   final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
 void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
   super.dispose();
  }

  //Controllers
  final fullName = TextEditingController();
  final email = TextEditingController();
  final usrName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final db = DatabaseHelper();
  signUp() async {
    var res = await db.createUser(Users(
        fullName: fullName.text,
        email: email.text,
        usrName: usrName.text,
        password: password.text));
    if (res > 0) {
      if (!mounted) return;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Register New Account",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 55,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                InputField(
                    hint: "Full name",
                    icon: Icons.person,
                    controller: fullName),
                InputField(hint: "Email", icon: Icons.email, controller: email),
                InputField(
                    hint: "Username",
                    icon: Icons.account_circle,
                    controller: usrName),
                InputField(

                    hint: "Password",
                    icon: Icons.lock,
                    controller: password,
                    passwordInvisible: true),
                InputField(
                    hint: "Re-enter password",
                    icon: Icons.lock,
                    controller: confirmPassword,
                    passwordInvisible: true),
                const SizedBox(height: 10),
                Button(
                    label: "SIGN UP",
                    press: () {
                      _signUp();
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text("LOGIN"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _signUp() async{
    String usrName = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;


    User? user = await _auth.signUpwithEmailAndPassword(email, password);


    if (user == null){
      print("User is successfully created");
      Navigator.pushNamed(context, "/LoginScreen");

    } else {
      print("some error happend");
    }
  }
}
