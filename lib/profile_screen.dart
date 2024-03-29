import 'package:flutter/material.dart';
import 'postmodel.dart';
import 'post_card.dart';

List<String> tabList = [
  "Tweets",
  "Replies",
  "Media",
  "Likes",
];

List<List<PostModel>> postData = [
  [
    PostModel(
      post: "The google stadia ia awesome!",
      userName: "@ItachiUchiha",
      name: "Itachi",
      profileUrl: "https://avatarfiles.alphacoders.com/163/163767.jpg",
    ),
    PostModel(
      post: "Konoha has been peaceful lately.",
      userName: "@Hokage",
      name: "Naruto Uzumaki",
      profileUrl: "https://avatarfiles.alphacoders.com/946/94610.jpg",
    ),
    PostModel(
      post: "Losers.",
      userName: "@UchihaSasuke",
      name: "Sasuke",
      profileUrl: "https://avatarfiles.alphacoders.com/170/170527.jpg",
    ),
    PostModel(
      post: "Love my new pixel 4",
      userName: "@Oneforall",
      name: "Midoriya",
      profileUrl: "https://avatarfiles.alphacoders.com/181/181368.jpg",
    ),
    PostModel(
      post: "24 hours a day, seven days a week, 365 days a year!",
      userName: "@MrAllDayEveryday",
      name: "Marshall D. Teach",
      profileUrl: "https://avatarfiles.alphacoders.com/109/109464.png",
    ),
  ],
  [
    PostModel(
      post: "@OPMan How was last night's concert?",
      userName: "@Goku",
      name: "Son Goku",
      profileUrl: "https://avatarfiles.alphacoders.com/782/78200.png",
    ),
    PostModel(
      post: "@OPMan I will beat you one day",
      userName: "@PrinceofAllSaiyans",
      name: "Vegeta",
      profileUrl: "https://avatarfiles.alphacoders.com/739/73989.jpg",
    ),
    PostModel(
      post: "@OPMan you should check out this cool book.",
      userName: "@Gohan",
      name: "Son Gohan",
      profileUrl: "https://avatarfiles.alphacoders.com/153/153624.jpg",
    ),
    PostModel(
      post: "@OPMan did you still want to play video games friday?",
      userName: "@DemonKing",
      name: "Piccolo",
      profileUrl: "https://avatarfiles.alphacoders.com/652/65280.jpg",
    ),
    PostModel(
      post: "@OPMan the google stadia is awesome!",
      userName: "@Hokage",
      name: "Naruto Uzumaki",
      profileUrl: "https://avatarfiles.alphacoders.com/946/94610.jpg",
    ),
  ],
  [
    PostModel(
      post: "@OPMan How was last night's concert?",
      userName: "@Goku",
      name: "Son Goku",
      profileUrl: "https://avatarfiles.alphacoders.com/782/78200.png",
    ),
    PostModel(
      post: "@OPMan I will beat you one day",
      userName: "@PrinceofAllSaiyans",
      name: "Vegeta",
      profileUrl: "https://avatarfiles.alphacoders.com/739/73989.jpg",
    ),
    PostModel(
      post: "@OPMan you should check out this cool book.",
      userName: "@Gohan",
      name: "Son Gohan",
      profileUrl: "https://avatarfiles.alphacoders.com/153/153624.jpg",
    ),
    PostModel(
      post: "@OPMan did you still want to play video games friday?",
      userName: "@DemonKing",
      name: "Piccolo",
      profileUrl: "https://avatarfiles.alphacoders.com/652/65280.jpg",
    ),
    PostModel(
      post: "@OPMan the google stadia is awesome!",
      userName: "@Hokage",
      name: "Naruto Uzumaki",
      profileUrl: "https://avatarfiles.alphacoders.com/946/94610.jpg",
    ),
  ],
  [
    PostModel(
      post: "@OPMan How was last night's concert?",
      userName: "@Goku",
      name: "Son Goku",
      profileUrl: "https://avatarfiles.alphacoders.com/782/78200.png",
    ),
    PostModel(
      post: "@OPMan I will beat you one day",
      userName: "@PrinceofAllSaiyans",
      name: "Vegeta",
      profileUrl: "https://avatarfiles.alphacoders.com/739/73989.jpg",
    ),
    PostModel(
      post: "@OPMan you should check out this cool book.",
      userName: "@Gohan",
      name: "Son Gohan",
      profileUrl: "https://avatarfiles.alphacoders.com/153/153624.jpg",
    ),
    PostModel(
      post: "@OPMan did you still want to play video games friday?",
      userName: "@DemonKing",
      name: "Piccolo",
      profileUrl: "https://avatarfiles.alphacoders.com/652/65280.jpg",
    ),
    PostModel(
      post: "@OPMan the google stadia is awesome!",
      userName: "@Hokage",
      name: "Naruto Uzumaki",
      profileUrl: "https://avatarfiles.alphacoders.com/946/94610.jpg",
    ),
  ],
];

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxisScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('Profile Cover'),
                backgroundColor: Colors.green,
                expandedHeight: 200.0,
                pinned: true,
                bottom: TabBar(
                    tabs: tabList
                        .map<Widget>((String tabName) => Tab(
                              text: tabName,
                            ))
                        .toList()),
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://i.redd.it/zdarxtlshg611.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body:
              TabBarView(children: postData.map<Widget>(_createLists).toList()),
        ),
      ),
    );
  }

  Widget _createLists(List<PostModel> listofPosts) {
    final GlobalKey<AnimatedListState> _listKey = GlobalKey();

    return AnimatedList(
      initialItemCount: listofPosts.length,
      key: _listKey,
      itemBuilder: (BuildContext context, int index, Animation animation) {
        return CardPost(animation: animation, post: listofPosts[index], full: true);
      },
    );
  }
}
