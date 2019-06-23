import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Profile Cover'),
            backgroundColor: Colors.green,
            expandedHeight: 200.0,
            pinned: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network("https://i.redd.it/zdarxtlshg611.jpg", fit: BoxFit.cover,),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.red),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.orange),
                  Container(color: Colors.yellow),
                  Container(color: Colors.pink),
                ],
              ),
              itemExtent: 150.0)
        ],
      ),
    );
  }
}