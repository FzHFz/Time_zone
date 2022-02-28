import 'package:flutter/material.dart';
import 'package:the_world_time_app/pages/choose_location.dart';
import 'package:the_world_time_app/pages/home.dart';
import 'package:the_world_time_app/pages/loading.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
    debugShowCheckedModeBanner: false,
  routes: {
      '/': (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));
