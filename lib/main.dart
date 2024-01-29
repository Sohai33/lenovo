import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lenovarustisia/firebase_options.dart';
import 'package:lenovarustisia/homepage/lib/Views/auth.dart';
import 'package:lenovarustisia/homepage/lib/Views/dashboard.dart';
import 'package:lenovarustisia/homepage/lib/Views/login.dart';

import 'package:lenovarustisia/homepage/lib/settings.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Your theme configuration here
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/LoginScreen': (context) => LoginScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Profile());
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final FirebaseAnalyticsObserver observer =
  FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);

  @override
  void initState() {
    analytics.setAnalyticsCollectionEnabled(true);
    super.initState();

    // Use a callback inside Future.delayed to access context
    Future.delayed(Duration(seconds: 4), () {
      FirebaseAnalytics.instance.logEvent(
        name: 'splash_screen_displayed',
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/img4.png'),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
