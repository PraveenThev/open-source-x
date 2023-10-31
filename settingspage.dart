import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nreach/pages/agreements.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'about.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Function to show the signout confirmation dialog.
    Future<void> _showSignOutConfirmationDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog.adaptive(
            title: const Text('Sign Out Confirmation'),
            content: const Text('Are you sure you want to sign out?'),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog.
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signOut();

                    Navigator.of(context).pop(); // Close the dialog.
                    // Redirect to the sign-in page.
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/signin', (route) => false);
                  } catch (e) {
                    print('Error signing out: $e');
                  }
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('About'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const About(),
                ),
              );
              // Navigate to the agreements and licenses page.
              // You can create a new page for this if needed.
            },
          ),
          ListTile(
            leading: const Icon(Icons.nightlight_round),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: themeProvider.isDarkModeEnabled,
              onChanged: (bool newValue) {
                themeProvider.toggleDarkMode();
                // Implement your dark mode theme switching logic here.
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Agreements and Licenses'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AgreementsPage(),
                ),
              );
              // Navigate to the agreements and licenses page.
              // You can create a new page for this if needed.
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sign Out'),
            onTap: () {
              // Show the signout confirmation dialog.
              _showSignOutConfirmationDialog();
            },
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('App Version'),
            subtitle: Text('1.0.0'), // Replace with your app version.
          ),
        ],
      ),
    );
  }
}
