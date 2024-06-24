import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Language'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to change the language
              },
              child: Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                // Logic to change the language
              },
              child: Text('Spanish'),
            ),
            // Add more language options here
          ],
        ),
      ),
    );
  }
}
