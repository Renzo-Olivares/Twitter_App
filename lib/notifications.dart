import 'package:flutter/material.dart';
import 'post_card.dart';
import 'postmodel.dart';

List<String> tabList = [
  "All",
  "Mentions",
];

List<PostModel> allData = [
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
];

List<PostModel> mentionsData = [
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
];

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicator: CustomTabIndicator(),
              tabs:
                  tabList.map((String tabName) => Tab(text: tabName)).toList(),
            ),
            body: TabBarView(children: <Widget>[
              ListView(
                children: allData.map<Widget>((PostModel post) => _buildListTile(post, false)).toList(),
              ),
              ListView(
                children: mentionsData.map<Widget>((PostModel post) => _buildListTile(post, true)).toList(),
              )
            ]),
          )),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Notifications'),
      ),
    );
  }

  Widget _buildListTile(PostModel post, bool fullPost) {
    return CardPost(post: post, full: fullPost);
  }
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([onChanged]) {
    // TODO: implement createBoxPainter
    return _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    assert(configuration != null);
    assert(configuration.size != null);

    final indicatorHeight = 35.0;
    final Rect rect = Offset(
            offset.dx, (configuration.size.height / 2) - indicatorHeight / 2) &
        Size(configuration.size.width, indicatorHeight);
    final Paint paint = Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(25)), paint);
  }
}
