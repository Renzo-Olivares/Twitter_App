import 'package:flutter/material.dart';
import 'post_card.dart';
import 'postmodel.dart';
import 'avatar_appbar.dart';

List<PostModel> listData = [
  PostModel(
    post: "How's it going bro",
    userName: "@Goku",
    name: "Son Goku",
    profileUrl: "https://avatarfiles.alphacoders.com/782/78200.png",
  ),
  PostModel(
    post: "Want to train today?",
    userName: "@PrinceofAllSaiyans",
    name: "Vegeta",
    profileUrl: "https://avatarfiles.alphacoders.com/739/73989.jpg",
  ),
  PostModel(
    post: "Want to study tomorrow?",
    userName: "@Gohan",
    name: "Son Gohan",
    profileUrl: "https://avatarfiles.alphacoders.com/153/153624.jpg",
  ),
  PostModel(
    post: "You forgot your wallet at my place again.",
    userName: "@DemonKing",
    name: "Piccolo",
    profileUrl: "https://avatarfiles.alphacoders.com/652/65280.jpg",
  ),
  PostModel(
    post: "We should hangout with Gaara soon",
    userName: "@Hokage",
    name: "Naruto Uzumaki",
    profileUrl: "https://avatarfiles.alphacoders.com/946/94610.jpg",
  ),
];

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
              child: CardPost(
                  animation: animation, post: listData[index], full: false, message: true,),
            );
          },
        ),
      ),
      appBar: AvatarAppBar("Messages"),
    );
  }
}
