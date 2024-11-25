
import 'package:flutter/material.dart';

import 'package:my_first_app/splashScreen.dart';

import 'mainPage.dart';

void main() {
  runApp(SocialApp());
}

class SocialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

