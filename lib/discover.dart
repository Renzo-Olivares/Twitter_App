import 'package:flutter/material.dart';
import 'avatar_appbar.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AvatarAppBar("Discover"),
    );
  }
}
