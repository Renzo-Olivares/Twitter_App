import 'package:flutter/material.dart';

class DMScreen extends StatefulWidget{
  @override
  _DMScreenState createState() => _DMScreenState();
}

class _DMScreenState extends State<DMScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('@username'),
      ),
    );
  }
}