/*
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Go to Settings'),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.account_circle),
              label: Text('Go to Account'),
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text('Go to Login'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             // HomeScreenButton(
               // icon: Ionicons.settings,
                //text: 'Settings',
                //color: Colors.orange,
                //onTap: () {
                  //Navigator.pushNamed(context, '/settings');
                //},
              //),
              //SizedBox(height: 20),
              //HomeScreenButton(
                //icon: Ionicons.person_circle,
                //text: 'Account',
                //color: Colors.green,
                //onTap: () {
                  //Navigator.pushNamed(context, '/account');
                //},
              //),
              SizedBox(height: 20),
              Image.asset("assets/cam.jpg", width: 150, height: 150),
              const SizedBox(width: 20),


              // color: Colors.white,
              // onTap: () {
              // Your custom action
              // }, text: 'Welcome',
              //),
              SizedBox(height: 20),
              HomeScreenButton(
                icon: Ionicons.log_in,
                text: "LET'S GO",
                color: Colors.black,
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function() onTap;

  const HomeScreenButton({
    required this.icon,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 30),
      label: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap,
    );
  }
}
