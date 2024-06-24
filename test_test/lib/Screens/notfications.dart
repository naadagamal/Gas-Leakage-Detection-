import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Notification Settings'),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Receive Notifications'),
              value: true, // Replace with actual value
              onChanged: (value) {
                // Logic to enable/disable notifications
              },
            ),
            SwitchListTile(
              title: Text('Receive Promotional Notifications'),
              value: false, // Replace with actual value
              onChanged: (value) {
                // Logic to enable/disable promotional notifications
              },
            ),
          ],
        ),
      ),
    );
  }
}

