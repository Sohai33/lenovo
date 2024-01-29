
 import 'dart:math';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

 import 'package:flutter/foundation.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lenovarustisia/homepage/lib/messagescreen.dart';




class notificationservices {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();








  void requestnotificationpermission() async {
   NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
       badge: true,
      criticalAlert: true,
       provisional: true,
     sound: true,
    );
     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.authorized) {
       print('user granted pervisional permission');
    } else {
      print('user deny permission');
    }
   }

   Future<String> getDeviceToken()async{
     String? token = await messaging.getToken();
    return token!;}


  void initLocalNotification(BuildContext context,RemoteMessage message)async{
    var androidInitializationsettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting = InitializationSettings(
      android: androidInitializationsettings,
   );
   await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
   onDidReceiveBackgroundNotificationResponse: (payload){
       handleMessage(context, message);
      }
   );


   }

 void firebaseInit(BuildContext context){
    FirebaseMessaging.onMessage.listen((message) {

       if(kDebugMode) {
         print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data.toString());
        print(message.data['type']);
         print(message.data['id']);


     }
     initLocalNotification(context, message);
      showNotification(message);
    });
   }

  Future<void> showNotification(RemoteMessage message)async {
     AndroidNotificationChannel channel = AndroidNotificationChannel(
       Random.secure().nextInt(10000).toString(),

        'high importance notification',
        importance: Importance.max

     );


  AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
       channel.id.toString(),
       channel.name.toString(),

      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',


    );
     NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
         message.notification!.title.toString(),
         message.notification!.body.toString(),
         notificationDetails);
   });
  }



 Future<void> refreshToken() async {   String? newToken = await _firebaseMessaging.getToken();

    print("Refreshed token: $newToken");


  void handleMessage(BuildContext context, RemoteMessage message){

   }

  }

 static void handleMessage(BuildContext context,RemoteMessage message){
     if(message.data['type'] == 'msj'){
       Navigator.push(context, MaterialPageRoute(builder: (context) => messagescreen()));
 }

 }

 Future<void>setupInteractMessage(BuildContext context) async{

    RemoteMessage? initialMessage = await FirebaseMessaging .instance . getInitialMessage();

    if(initialMessage != null){
      handleMessage(context, initialMessage);

     }
     FirebaseMessaging.onMessageOpenedApp. listen((event) {

    });

   }
}





