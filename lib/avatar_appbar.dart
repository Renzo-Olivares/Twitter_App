import 'package:flutter/material.dart';

class AvatarAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String appBarTitle;
  
  const AvatarAppBar(this.appBarTitle);
  
  @override
  _AvatarAppBarState createState() => _AvatarAppBarState();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AvatarAppBarState extends State<AvatarAppBar>{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => _onTap(context),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                    "https://avatarfiles.alphacoders.com/491/49114.jpg"),
              ),
            ),
          ),
          Text(widget.appBarTitle),
        ],
      ),
    );
  }


  void _onTap(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}