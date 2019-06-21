import 'package:flutter/material.dart';

class NotificationModel {
  String message;
  String profileUrl;
  String userName;
  String name;

  NotificationModel({this.message, this.profileUrl, this.userName, this.name});
}

List<NotificationModel> listAllData = [
  NotificationModel(
    message: "The google stadia ia awesome!",
    userName: "@ItachiUchiha",
    name: "Itachi",
    profileUrl: "https://avatarfiles.alphacoders.com/163/163767.jpg",
  ),
  NotificationModel(
    message: "Konoha has been peaceful lately.",
    userName: "@Hokage",
    name: "Naruto Uzumaki",
    profileUrl: "https://avatarfiles.alphacoders.com/946/94610.jpg",
  ),
  NotificationModel(
    message: "Losers.",
    userName: "@UchihaSasuke",
    name: "Sasuke",
    profileUrl: "https://avatarfiles.alphacoders.com/170/170527.jpg",
  ),
  NotificationModel(
    message: "Love my new pixel 4",
    userName: "@Oneforall",
    name: "Midoriya",
    profileUrl: "https://avatarfiles.alphacoders.com/181/181368.jpg",
  ),
  NotificationModel(
    message: "24 hours a day, seven days a week, 365 days a year!",
    userName: "@MrAllDayEveryday",
    name: "Marshall D. Teach",
    profileUrl: "https://avatarfiles.alphacoders.com/109/109464.png",
  ),
];

List<NotificationModel> listMentionsData = [
  NotificationModel(
    message: "@OPMan How was last night's concert?",
    userName: "@Goku",
    name: "Son Goku",
    profileUrl: "https://avatarfiles.alphacoders.com/782/78200.png",
  ),
  NotificationModel(
    message: "@OPMan I will beat you one day",
    userName: "@PrinceofAllSaiyans",
    name: "Vegeta",
    profileUrl: "https://avatarfiles.alphacoders.com/739/73989.jpg",
  ),
  NotificationModel(
    message: "@OPMan you should check out this cool book.",
    userName: "@Gohan",
    name: "Son Gohan",
    profileUrl: "https://avatarfiles.alphacoders.com/153/153624.jpg",
  ),
  NotificationModel(
    message: "@OPMan did you still want to play video games friday?",
    userName: "@DemonKing",
    name: "Piccolo",
    profileUrl: "https://avatarfiles.alphacoders.com/652/65280.jpg",
  ),
  NotificationModel(
    message: "@OPMan the google stadia is awesome!",
    userName: "@Hokage",
    name: "Naruto Uzumaki",
    profileUrl: "https://avatarfiles.alphacoders.com/946/94610.jpg",
  ),
];

class Notifications extends StatefulWidget{
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
                child: Container(
                  child: Padding(padding: const EdgeInsets.all(16.0),
                  child: TabBar(
                      unselectedLabelColor: Colors.black45,
                      labelColor: Colors.white,
                      indicator: CustomTabIndicator(),
                      tabs: <Widget>[
                    Tab(text: "All"),
                    Tab(text: "Mentions"),
                  ])),
                ),
                preferredSize: Size.fromHeight(kToolbarHeight)),
            body: TabBarView(children: <Widget>[
              ListView(
                children: listAllData.map<Widget>(_buildListTile).toList(),
              ),
              ListView(
                children: listMentionsData.map<Widget>(_buildListTile).toList(),
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

  Widget _buildListTile(NotificationModel notifyModel){
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage:
          NetworkImage(notifyModel.profileUrl),
        ),
        title: Text(
            "${notifyModel.name} ${notifyModel.userName}"),
        subtitle: Text(notifyModel.message),
        onLongPress: () {
          print("long press");
        }),
    );
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

    final indicatorHeight = 30.0;
    final Rect rect = Offset(
        offset.dx, (configuration.size.height / 2) - indicatorHeight / 2) &
    Size(configuration.size.width, indicatorHeight);
    final Paint paint = Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(30)), paint);
  }
}