import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/splash.dart';
import 'package:world_time/pages/choose-location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
));
