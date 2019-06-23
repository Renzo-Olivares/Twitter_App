import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'home.dart';
import 'discover.dart';
import 'notifications.dart';
import 'messages.dart';

class MyDashboard extends StatefulWidget {
  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Discover(),
    Notifications(),
    Messages(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) {
          final scaleTween = TweenSequence([
            TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 1),
            TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 1),
          ]);
          final angle = Tween(begin: 0 / 360, end: -90 / 360);
          return RotationTransition(
              turns: _currentIndex == 3
                  ? angle.animate(animation)
                  : angle.animate(ReverseAnimation(animation)),
              alignment: Alignment.center,
              child: ScaleTransition(
                scale: scaleTween.animate(animation),
                child: child,
              ));
        },
        duration: Duration(milliseconds: 300),
        child: _currentIndex == 3
            ? FloatingActionButton(
                key: UniqueKey(),
                onPressed: () {},
                child: Transform.rotate(
                  child: Icon(Icons.chat_bubble),
                  angle: math.pi / 2,
                ),
              )
            : FloatingActionButton(
                key: UniqueKey(),
                onPressed: () {},
                child: Icon(Icons.add),
              ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 28,
        onTap: onTabTapped,
        selectedItemColor: Colors.blueAccent,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Discover'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
