// splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';

import 'mainPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds:2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return  mainPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image(image: AssetImage('image/the.png')),
            // Icon(
            //   Icons.camera_alt,
            //   size: 100,
            //   color: Colors.pink,
            // ),
            SizedBox(height: 20),
            Text(
              'Welcome to Vista App',
              style: TextStyle(
                fontSize: 24,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
