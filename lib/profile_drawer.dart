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
            currentAccountPicture: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://avatarfiles.alphacoders.com/491/49114.jpg"),
              ),
            ),
            accountName: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: <Widget>[
                  Text("Saitama"),
                  Spacer(),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            accountEmail: Column(
              children: <Widget>[
                Align(
                  child: Text("@OPMan"),
                  alignment: Alignment.centerLeft,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text("0 Following"),
                      ),
                      Text("100M Followers"),
                    ],
                  ),
                )
              ],
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
            leading: Icon(Icons.bookmark),
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
