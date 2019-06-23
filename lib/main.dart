import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Twitter',
      theme: ThemeData(
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          accentColor: Colors.blueAccent,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          primaryColor: Colors.black12,
          accentColor: Colors.blueAccent,
          brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: MyDashboard(),
    );
  }
}
