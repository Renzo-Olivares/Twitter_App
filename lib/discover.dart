import 'package:flutter/material.dart';
import 'avatar_appbar.dart';
import 'profile_drawer.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: ProfileDrawer(),
      appBar: AvatarAppBar("Discover"),
    );
  }
}
