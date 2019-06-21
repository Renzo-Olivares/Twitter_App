import 'package:flutter/material.dart';

class MessageModel {
  String message;
  String profileUrl;
  String userName;
  String name;

  MessageModel({this.message, this.profileUrl, this.userName, this.name});
}

List<MessageModel> listData = [
  MessageModel(
    message: "How's it going bro",
    userName: "@Goku",
    name: "Son Goku",
    profileUrl: "https://avatarfiles.alphacoders.com/782/78200.png",
  ),
  MessageModel(
    message: "Want to train today?",
    userName: "@PrinceofAllSaiyans",
    name: "Vegeta",
    profileUrl: "https://avatarfiles.alphacoders.com/739/73989.jpg",
  ),
  MessageModel(
    message: "Want to study tomorrow?",
    userName: "@Gohan",
    name: "Son Gohan",
    profileUrl: "https://avatarfiles.alphacoders.com/153/153624.jpg",
  ),
  MessageModel(
    message: "You forgot your wallet at my place again.",
    userName: "@DemonKing",
    name: "Piccolo",
    profileUrl: "https://avatarfiles.alphacoders.com/652/65280.jpg",
  ),
  MessageModel(
    message: "We should hangout with Gaara soon",
    userName: "@Hokage",
    name: "Naruto Uzumaki",
    profileUrl: "https://avatarfiles.alphacoders.com/946/94610.jpg",
  ),
];

class Messages extends StatefulWidget{
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages>{
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: AnimatedList(
          initialItemCount: listData.length,
          key: _listKey,
          itemBuilder: (BuildContext context, int index, Animation animation) {
            return Dismissible(
              key: ValueKey(index),
              onDismissed: (both) {},
              background: Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20.0),
                  color: Colors.blueAccent,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              secondaryBackground: Card(
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                  color: Colors.blueAccent,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Card(
                  child: FadeTransition(
                      opacity: animation,
                      child:  ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                          NetworkImage(listData[index].profileUrl),
                        ),
                        title: Text(
                            "${listData[index].name} ${listData[index].userName}"),
                        subtitle: Text(listData[index].message),
                        onLongPress: () {
                          print("long press");
                        },),
                  )),
            );
          },
        ),
      ),
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Messages')),
    );
  }
}