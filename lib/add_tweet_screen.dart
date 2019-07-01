import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  final bool isReply;

  const AddScreen({this.isReply = false});

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
                child: widget.isReply ? Text("Reply") : Text("Tweet"),
                onPressed: () {},
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))),
          )
        ],
      ),
      body: TextField(
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.photo),
              ),
              IconButton(
                icon: Icon(Icons.gif),
              ),
              IconButton(
                icon: Icon(Icons.poll),
              ),
              IconButton(
                icon: Icon(Icons.location_on),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
