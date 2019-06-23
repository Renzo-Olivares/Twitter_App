import 'package:flutter/material.dart';
import 'postmodel.dart';

class CustomTab extends StatefulWidget {
  final int length;
  final List<String> tabList;
  final List<List<PostModel>> postList;

  const CustomTab(this.length, this.tabList, this.postList);

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: widget.length,
        child: Scaffold(
          appBar: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              indicator: CustomTabIndicator(),
              tabs: widget.tabList.map<Widget>(_createTab).toList()),
          body: TabBarView(
              children: widget.postList.map<Widget>(_createLists).toList()),
        ));
  }

  Widget _createTab(String tabTitle) {
    return Tab(text: tabTitle);
  }

  Widget _createLists(List<PostModel> listofPosts) {
    return ListView(
      children: listofPosts.map<Widget>(_buildListTile).toList(),
    );
  }

  Widget _buildListTile(PostModel post) {
    return Card(
      child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(post.profileUrl),
          ),
          title: Text("${post.name} ${post.userName}"),
          subtitle: Text(post.post),
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
