import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lenovarustisia/JSON/users.dart';
import 'package:lenovarustisia/SQLite/database_helper.dart';
import 'package:lenovarustisia/homepage/lib/Components/button.dart';
import 'package:lenovarustisia/homepage/lib/Components/colors.dart';
import 'package:lenovarustisia/homepage/lib/Components/textfield.dart';
import 'package:lenovarustisia/homepage/lib/Views/dashboard.dart';
import 'package:lenovarustisia/homepage/lib/Views/signup.dart';
import 'package:lenovarustisia/homepage/lib/firebase_auth.dart';
import 'package:lenovarustisia/loginsignup/forgetpassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //bool _isSigning = false;

  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _usernameController = TextEditingController();
  //TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    //_emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  //Controller is used to take the value from user and pass it to database
  final usrName = TextEditingController();
  final password = TextEditingController();
  bool isHiddenPassword = true;
  bool isEmailIncorrect = false;
  TextEditingController emailController = TextEditingController();

  bool isChecked = false;
  bool isLoginTrue = false;

  final db = DatabaseHelper();
  //Login Method
  //We will take the value of text fields using controllers in order to verify whether details are correct or not
  login() async {
    Users? usrDetails = await db.getUser(usrName.text);
    var res = await db
        .authenticate(Users(usrName: usrName.text, password: password.text));
    if (res == true) {
      // If result is correct then go to profile or home
      if (!mounted) return;
      if (usrDetails != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Profile(profile: usrDetails)));
      }
    } else {
      //Otherwise show the error message
      setState(() {
        isLoginTrue = true;
      });
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
                //Because we don't have account, we must create one to authenticate
                //lets go to sign up

                const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 40,
                  ),
                ),
                Image.asset(
                  "images/img4.png",
                  height: 200,
                  width: 200,
                ),
                InputField(
                    hint: "Username",
                    icon: Icons.account_circle,
                    controller: usrName),
                InputField(
                    hint: "Password",
                    icon: Icons.lock,
                    controller: password,
                    passwordInvisible: true),

                ListTile(
                  horizontalTitleGap: 2,
                  title: const Text("Remember me"),
                  leading: Checkbox(
                    activeColor: primaryColor,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Replace 'YourNavigationLogicHere' with your actual navigation logic.
                        // For example, you can use Navigator.push() to navigate to a new screen.
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Forgetpassword()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          "Forgot Password? ",
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Our login button
                Button(
                    label: "LOGIN",
                    press: () {
                      _signIn();
                    }),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        child: const Text("SIGN UP"))
                  ],
                ),

                // Access denied message in case when your username and password is incorrect
                //By default we must hide it
                //When login is not true then display the message
                isLoginTrue
                    ? Text(
                        "Username or password is incorrect",
                        style: TextStyle(color: Colors.red.shade900),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _signIn() async{

    String email = _usernameController.text;
    String password = _passwordController.text;


    User? user = await _auth.signInwithEmailAndPassword(email, password);


    if (user == null){
      print("User is successfully signin");
      Navigator.pushNamed(context, "/Profile");

    } else {
      print("some error happend");
    }
  }
}
