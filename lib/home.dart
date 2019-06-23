import 'package:flutter/material.dart';
import 'post_card.dart';
import 'postmodel.dart';

List<PostModel> listData = [
  PostModel(
    post: "where's all the food",
    userName: "@Goku",
    name: "Son Goku",
    profileUrl: "https://avatarfiles.alphacoders.com/782/78200.png",
  ),
  PostModel(
    post: "where's my bulma",
    userName: "@PrinceofAllSaiyans",
    name: "Vegeta",
    profileUrl: "https://avatarfiles.alphacoders.com/739/73989.jpg",
  ),
  PostModel(
    post: "@Goku i miss you pops",
    userName: "@Gohan",
    name: "Son Gohan",
    profileUrl: "https://avatarfiles.alphacoders.com/153/153624.jpg",
  ),
  PostModel(
    post: "@Naruto why are we here",
    userName: "@DemonKing",
    name: "Piccolo",
    profileUrl: "https://avatarfiles.alphacoders.com/652/65280.jpg",
  ),
  PostModel(
    post: "@Sasuke wya bro",
    userName: "@Hokage",
    name: "Naruto Uzumaki",
    profileUrl: "https://avatarfiles.alphacoders.com/946/94610.jpg",
  ),
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Home'),
      ),
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
                      Icons.remove_red_eye,
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
                        Icons.remove_red_eye,
                        color: Colors.white,
                      )),
                ),
                child: CardPost(animation: animation, post: listData[index], full: true));
          },
        ),
      ),
    );
  }
}
