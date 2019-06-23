import 'package:flutter/material.dart';

class TweetScreen extends StatefulWidget{
  @override
  _TweetScreenState createState() => _TweetScreenState();
}

class _TweetScreenState extends State<TweetScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tweet'),
      ),
    );
  }
}