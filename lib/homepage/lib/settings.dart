import 'package:flutter/material.dart';
import 'package:lenovarustisia/homepage/lib/notes.dart';
import 'package:lenovarustisia/homepage/lib/notifications.dart';
import 'package:lenovarustisia/homepage/lib/privacy_policy.dart';
import 'package:provider/provider.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: Provider.of<ThemeProvider>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      home: YourHomePage(),
    );
  }
}

class YourHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: CustomListTile(),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Dark Mode"),
      leading: Icon(Icons.dark_mode),
      trailing: Switch(
        value: Provider.of<ThemeProvider>(context).isDarkMode,
        onChanged: (value) {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        },
      ),
    );
  }
}

class SettingsPage1 extends StatelessWidget {
  const SettingsPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: "General",
                children: [
                  _CustomListTile(
                    title: "About lenovarutisia",
                    icon: Icons.phone_android,
                    onTap: () {
                      // Navigate to the about page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UBERUNS(),
                        ),
                      );
                    },
                  ),
                  _CustomListTile(
                    title: "Dark Mode",
                    icon: Icons.dark_mode,
                    trailing: Switch(
                      value: Provider.of<ThemeProvider>(context).isDarkMode,
                      onChanged: (value) {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                    ),
                  ),
                  _CustomListTile(
                    title: "Notifications",
                    icon: Icons.notifications,
                    onTap: () {
                      // Navigate to the notifications page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => noyificationapp(),
                        ),
                      );
                    },
                  ),
                  _CustomListTile(
                    title: "Security Status",
                    icon: Icons.safety_check_outlined,
                    onTap: () {
                      // Navigate to the privacy policy page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing ?? const Icon(Icons.arrow_forward, size: 18),
      onTap: onTap,
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style:
            Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Center(
        child: Text("This is the About Us page."),
      ),
    );
  }
}

/*class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Center(
        child: Text("This is the Notifications page."),
      ),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: Center(
        child: Text("This is the Privacy Policy page."),
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}*/
