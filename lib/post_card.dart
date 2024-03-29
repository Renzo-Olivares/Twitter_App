import 'package:flutter/material.dart';
import 'postmodel.dart';
import 'profile_screen.dart';
import 'direct_messages_screen.dart';
import 'tweet_screen.dart';
import 'add_tweet_screen.dart';

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
                          trailing: InkWell(
                              onTap: () => _arrowBottomSheet(context),
                              child: Icon(Icons.arrow_drop_down)),
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
                              onPressed: () => _onComment(context),
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
                        trailing: InkWell(
                            onTap: () => _arrowBottomSheet(context),
                            child: Icon(Icons.arrow_drop_down)),
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
                            onPressed: () => _onComment(context),
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
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ProfileScreen();
    }));
  }

  void _onComment(BuildContext context){
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) {
          return AddScreen(isReply: true,);
        },
        fullscreenDialog: true));
  }

  void _onTouch(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return widget.message ? DMScreen() : TweetScreen();
    }));
  }

  void _arrowBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.content_copy),
              title: Text('Copy link to Tweet'),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Follow/Unfollow @username'),
            ),
            ListTile(
              leading: Icon(Icons.volume_off),
              title: Text('Mute @username'),
            ),
            ListTile(
              leading: Icon(Icons.block),
              title: Text('Block @username'),
            ),
            ListTile(
              leading: Icon(Icons.outlined_flag),
              title: Text('Report Tweet'),
            ),
          ],
        );
      },
    );
  }
}
