import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text('Privacy Policy'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Welcome to our app\'s Privacy Policy.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Your privacy is important to us. This document explains our policies regarding the collection, use, and disclosure of your personal information when you use our app.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Information Collection and Use',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We do not collect any personally identifiable information when you use our app.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),

              Text(
                'Log Data',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'We may collect information that your device sends whenever you use our app. This log data may include information such as your device Internet Protocol ("IP") address, device name, operating system version, configuration of the app, and other statistics.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),

              Text(
                'Cookies',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Our app does not use "cookies" to collect information.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),

              Text(
                'Security',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'The security of your personal information is important to us, but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your personal information, we cannot guarantee its absolute security..',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              // Add more sections as needed...
              // Log Data, Cookies, Security, Changes to This Privacy Policy, Contact Us
            ],
          ),
        ),
      ),
    );
  }
}
