import 'package:flutter/material.dart';
import 'postmodel.dart';
import 'profile_screen.dart';

class CardPost extends StatefulWidget {
  final Animation animation;
  final PostModel post;

  const CardPost(this.animation, this.post);

  @override
  _CardPostState createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: FadeTransition(
            opacity: widget.animation,
            child: Column(
              children: <Widget>[
                ListTile(
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
            )));
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
}
