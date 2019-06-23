import 'package:flutter/material.dart';
import 'profile_screen.dart';

class TweetModel {
  String tweet;
  String profileUrl;
  String userName;
  String name;

  TweetModel({this.tweet, this.profileUrl, this.userName, this.name});
}

List<TweetModel> listData = [
  TweetModel(
    tweet: "where's all the food",
    userName: "@Goku",
    name: "Son Goku",
    profileUrl: "https://avatarfiles.alphacoders.com/782/78200.png",
  ),
  TweetModel(
    tweet: "where's my bulma",
    userName: "@PrinceofAllSaiyans",
    name: "Vegeta",
    profileUrl: "https://avatarfiles.alphacoders.com/739/73989.jpg",
  ),
  TweetModel(
    tweet: "@Goku i miss you pops",
    userName: "@Gohan",
    name: "Son Gohan",
    profileUrl: "https://avatarfiles.alphacoders.com/153/153624.jpg",
  ),
  TweetModel(
    tweet: "@Naruto why are we here",
    userName: "@DemonKing",
    name: "Piccolo",
    profileUrl: "https://avatarfiles.alphacoders.com/652/65280.jpg",
  ),
  TweetModel(
    tweet: "@Sasuke wya bro",
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
                  )
                ),
              ),
              child: Card(
                  child: FadeTransition(
                      opacity: animation,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: InkWell(
                              onTap: () => _onTap(context),
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(listData[index].profileUrl),
                              ),
                            ),
                            title: Text(
                                "${listData[index].name} ${listData[index].userName}"),
                            subtitle: Text(listData[index].tweet),
                            onLongPress: () {
                              print("long press");
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Spacer(),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.mode_comment),
                              ),
                              Spacer(),
                              IconButton(icon: Icon(Icons.import_export)),
                              Spacer(),
                              IconButton(icon: Icon(Icons.favorite)),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.share),
                              ),
                              Spacer(),
                            ],
                          )
                        ],
                      )
                  )),
            );
          },
        ),
      ),
    );
  }

  void _onTap(BuildContext context){
    print("lol");
    if(Navigator.of(context).canPop()){
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return ProfileScreen();
    }));
  }
}
