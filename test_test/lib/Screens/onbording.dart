import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase/const/colors/colors.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(


         // actions: [
           //IconButton(
             //onPressed:(){
               //FirebaseAuth.instance.signOut();
          //},
            //   icon: const Icon(Icons.logout),
          // )

        //],
        ),

    /*body: Padding(
    padding: const EdgeInsets.all(20.0),*/
      body: PageView.builder(itemCount: 1,
          itemBuilder: (_,i){

        return Padding(
          padding: const EdgeInsets.only(left:40, top:130, right:40, bottom:50),
          child: Column(
            children: [
              Image.asset("assets/life.jpg", width: 170, height: 170),
              Text("Your Life Matters To Us",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),
              Text("The gas sensor detection application is an essential tool for ensuring safety . With its advanced features, real-time monitoring capabilities, and user-friendly interface, it provides a reliable solution for detecting and managing gas concentrations in any environment."),

              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/camera');
                },
                child: Text(
                  'Go to Camera',
                  style: TextStyle(color: Colors.black))),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/account');
                  },
                  child: Text(
                    'Settings',
                    style: TextStyle(color: Colors.black),
                ),



              ) ],

          ),


        );

          }
      ));
  }
}
