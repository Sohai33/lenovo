

import 'package:flutter/material.dart';



import 'package:lenovarustisia/notification/homepage.dart';



class noyificationapp extends StatelessWidget {
  const noyificationapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodApp(),
    );
  }
}



/*FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void initializeNotifications() async {
  const AndroidInitializationSettings androidInitializationSettings =
  AndroidInitializationSettings('img4.png'); // Replace with your app icon
  final InitializationSettings initializationSettings =
  InitializationSettings(android: androidInitializationSettings);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}*/


