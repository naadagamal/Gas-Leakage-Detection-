import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Help Information'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to open a help topic
              },
              child: Text('How to use the app'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to open a help topic
              },
              child: Text('Contact Support'),
            ),
            // Add more help topics here
          ],
        ),
      ),
    );
  }
}

