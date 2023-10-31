import 'package:flutter/material.dart';

class AgreementsPage extends StatefulWidget {
  const AgreementsPage({super.key});

  @override
  _AgreementsPageState createState() => _AgreementsPageState();
}

class _AgreementsPageState extends State<AgreementsPage> {
  bool _accepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agreements and Licenses')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Welcome to NSBM Green University Official Mobile App',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'By using this app, you agree to the following terms and conditions:',
                style: TextStyle(fontSize: 16.0),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _accepted,
                    onChanged: (value) {
                      setState(() {
                        _accepted = value!;
                      });
                    },
                  ),
                  const Text(
                    'I accept the terms and conditions.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 16.0),
              const Text(
                '1. You must use the app in compliance with the university policies and guidelines. Any violation of these policies may result in disciplinary actions.\n\n2. Any unauthorized use or distribution of app content is strictly prohibited. The app and its contents are protected by copyright law.\n\n3. Your use of the app may involve the collection and storage of personal data, such as your name, student ID, and course information. NSBM Green University is committed to protecting your privacy, and your data will be used solely for app-related purposes. You can review our detailed Privacy Policy for more information on data handling.\n\n4. This app provides access to various features, including course materials, event updates, and academic resources. The information provided within the app is for informational purposes only and should not replace official communications from the university. Always refer to official university channels for critical updates and announcements.\n\n5. NSBM Green University reserves the right to modify, suspend, or terminate the app\'s services or access to certain features at any time, with or without notice.\n\nFor more details, please review the full terms and conditions and privacy policy on our website.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: _accepted
                      ? () {
                          // Implement logic to navigate to the main app screen
                          // after the user agrees to the terms and conditions.
                        }
                      : null, // Disable button if terms are not accepted
                  child: const Text('I Agree'),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Implement logic to open the full terms and conditions page
                  },
                  child: const Text(
                    'View Full Terms and Conditions',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
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
