

import 'package:flutter/material.dart';
import 'package:lenovarustisia/HOME.dart';
import 'package:lenovarustisia/JSON/users.dart';
import 'package:lenovarustisia/homepage/lib/Components/button.dart';
import 'package:lenovarustisia/homepage/lib/Components/colors.dart';


class Profile extends StatelessWidget {
  final Users? profile;
  const Profile({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 45.0,horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 77,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("images/img4.png"),
                      radius: 75,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Text(profile!.fullName??"",style: const TextStyle(fontSize: 28,color: primaryColor),),
                  Text(profile!.email??"",style: const TextStyle(fontSize: 17,color: Colors.grey),),

                  Button(label: "SIGN UP", press: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  }),

                  ListTile(
                    leading: const Icon(Icons.person,size: 30,color: Colors.white,),
                    subtitle: const Text("Full name"),
                    title: Text(profile!.fullName??""),
                  ),

                  ListTile(
                    leading: const Icon(Icons.email,size: 30,color: Colors.white),
                    subtitle: const Text("Email"),
                    title: Text(profile!.email??""),
                  ),

                  ListTile(
                    leading: const Icon(Icons.account_circle,size: 30,color: Colors.white),
                    subtitle: Text(profile!.usrName),
                    title: const Text("admin"),
                  ),

                ],
              ),
            )),
      ),
    );
  }
}