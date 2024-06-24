import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_test/Screens/login_screen.dart';

import '../Screens/onbording.dart';

class HomeSwitcher extends StatelessWidget{
  const HomeSwitcher ({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder:(builder,snapshot){
            if (snapshot.hasData){
              return Onbording();
            }else{
              return LoginScreen();
            }
          })
    );
    throw UnimplementedError();
  }}