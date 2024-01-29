
import 'package:flutter/material.dart';

import 'package:lenovarustisia/homepage/lib/calculater.dart';
import 'package:lenovarustisia/homepage/lib/contacts.dart';
import 'package:lenovarustisia/homepage/lib/dashboard.dart';
import 'package:lenovarustisia/homepage/lib/events.dart';
import 'package:lenovarustisia/homepage/lib/logoutpage.dart';
import 'package:lenovarustisia/homepage/lib/my_drawer_header.dart';
import 'package:lenovarustisia/homepage/lib/notes.dart';
import 'package:lenovarustisia/homepage/lib/notifications.dart';
import 'package:lenovarustisia/homepage/lib/privacy_policy.dart';
import 'package:lenovarustisia/homepage/lib/send_feedback.dart';
import 'package:lenovarustisia/homepage/lib/settings.dart';







class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  void navigateToCalculator(BuildContext context) {
    // Implement the navigation logic here when the text is tapped.
    // For instance, pushing a new route to the calculator screen.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CalculatorApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = WebViewApp();
    } else if (currentPage == DrawerSections.contacts) {
      container = contact();
    } else if (currentPage == DrawerSections.Speisekarte) {
      container = event();
    } else if (currentPage == DrawerSections.UBERUNS) {
      container = UBERUNS();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage1();
    } else if (currentPage == DrawerSections.notifications) {
      container = noyificationapp();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = App();
    }else if (currentPage == DrawerSections.LogoutPage) {
      container = LogoutPage();
    }


    else if (currentPage == DrawerSections.calculator) {
      container = CalculatorApp();
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: GestureDetector(
          onTap: () {
            navigateToCalculator(context); // Call function to navigate
          },
          child: Text("Menu                                 Calculator",
            style: TextStyle(color: Colors.white),),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Speisekarte", Icons.menu,
              currentPage == DrawerSections.Speisekarte ? true : false),
          menuItem(4, "About Us", Icons.work_history,
              currentPage == DrawerSections.UBERUNS ? true : false),

          menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(7, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
          Divider(),
          menuItem(9, "Calculator", Icons.calculate_outlined,
              currentPage == DrawerSections.calculator ? true : false),
          Divider(),
          menuItem(10, "LogoutPage", Icons.logout,
              currentPage == DrawerSections.LogoutPage ? true : false),

        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color:  Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.Speisekarte;
            } else if (id == 4) {
              currentPage = DrawerSections.UBERUNS;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            } else if (id == 9) {
              currentPage = DrawerSections.calculator;
            } else if (id == 10) {
              currentPage = DrawerSections.LogoutPage;
            }

          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}



enum DrawerSections {
  dashboard,
  contacts,
  Speisekarte,
  UBERUNS,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
  calculator,
  LogoutPage,

}