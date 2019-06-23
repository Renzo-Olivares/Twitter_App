import 'package:flutter/material.dart';
import 'postmodel.dart';
import 'profile_screen.dart';
import 'direct_messages_screen.dart';
import 'tweet_screen.dart';

class CardPost extends StatefulWidget {
  final Animation animation;
  final PostModel post;
  final bool full;
  final bool message;

  const CardPost({this.animation, this.post, this.full, this.message = false});

  @override
  _CardPostState createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.full
        ? Card(
            child: widget.animation != null
                ? FadeTransition(
                    opacity: widget.animation,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () => _onTouch(context),
                          leading: InkWell(
                            onTap: () => _onTap(context),
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(widget.post.profileUrl),
                            ),
                          ),
                          title: Text(
                              "${widget.post.name} ${widget.post.userName}"),
                          subtitle: Text(widget.post.post),
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
                    ))
                : Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () => _onTouch(context),
                        leading: InkWell(
                          onTap: () => _onTap(context),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.post.profileUrl),
                          ),
                        ),
                        title:
                            Text("${widget.post.name} ${widget.post.userName}"),
                        subtitle: Text(widget.post.post),
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
                  ),
          )
        : Card(
            child: ListTile(
              onTap: () => _onTouch(context),
              leading: InkWell(
                onTap: () => _onTap(context),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.post.profileUrl),
                ),
              ),
              title: Text("${widget.post.name} ${widget.post.userName}"),
              subtitle: Text(widget.post.post),
              onLongPress: () {
                print("long press");
              },
            ),
          );
  }

  void _onTap(BuildContext context) {
    print("lol");
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ProfileScreen();
    }));
  }

  void _onTouch(BuildContext context) {
    print("lol");
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return widget.message ? DMScreen() : TweetScreen();
    }));
  }
}
