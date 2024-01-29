/*import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lenovarustisia/homepage/lib/notifications.dart';

class NotificationSwitch extends StatefulWidget {
  @override
  _NotificationSwitchState createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch> {
  bool isNotificationEnabled = true;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground notifications
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle background and terminated notifications
      showNotification(message);
    });

    //initializeNotifications();

    // Subscribe to or unsubscribe from the topic when the widget is created
    updateNotificationSubscription();
  }

  void updateNotificationSubscription() {
    if (isNotificationEnabled) {
      FirebaseMessaging.instance.subscribeToTopic('your_topic');
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic('your_topic');
    }
  }

  void showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id', // Replace with your channel ID
      'Your Channel Name', // Replace with your channel name

      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    var flutterLocalNotificationsPlugin;
    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Center(child:Text('Notification Switch',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enable Notifications',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: 140,
            ),
            Switch(
              value: isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationEnabled = value;
                });

                // Update notification subscription when the switch is toggled
                updateNotificationSubscription();
              },
            ),
          ],
        ),
      ),
    );
  }
}*/



import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:lenovarustisia/notification/notificationsetting.dart';



class FoodApp extends StatefulWidget {

  const FoodApp({Key? key}) : super(key: key);

  @override
  State<FoodApp> createState() => _FoodAppState();

}

class _FoodAppState extends State<FoodApp> {
  final notificationservices notificationServices = notificationservices();
  bool isNotificationEnabled = true;


  @override
  void initState() {
    super.initState();
    notificationServices.requestnotificationpermission();
    notificationServices.firebaseInit(context);

    _fetchDeviceToken();
  }

  void _fetchDeviceToken() {
    notificationServices.getDeviceToken().then((deviceToken) {
      print('Device token: $deviceToken');
    });
  }
  void updateNotificationSubscription() {
    if (isNotificationEnabled) {
      FirebaseMessaging.instance.subscribeToTopic('your_topic');
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic('your_topic');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: Center(child:Text('Notification Switch',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enable Notifications',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: 140,
            ),
            Switch(
              value: isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationEnabled = value;
                });

                // Update notification subscription when the switch is toggled
                updateNotificationSubscription();
              },
            ),
          ],
        ),
      ),
    );
  }
}

