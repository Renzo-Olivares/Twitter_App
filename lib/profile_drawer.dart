import 'package:flutter/material.dart';

class ProfileDrawer extends StatefulWidget {
  @override
  _ProfileDrawerState createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Saitama"),
            accountEmail: Text("@OPMan"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatarfiles.alphacoders.com/491/49114.jpg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Lists"),
          ),
          ListTile(
            leading: Icon(Icons.bookmark_border),
            title: Text("Bookmarks"),
          ),
          ListTile(
            leading: Icon(Icons.flash_on),
            title: Text("Moments"),
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Follower Requests"),
          ),
          ListTile(
            title: Text("Settings & Privacy"),
          ),
          ListTile(
            title: Text("About"),
          ),
        ],
      ),
    );
  }
}
