import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kapoo/side_menu.dart';

final rng = new Random();

class SideMenuScaffold extends StatefulWidget {
  SideMenuScaffold({Key key, this.backgroundColor = Colors.white})
      : super(key: key);

  final Color backgroundColor;

  @override
  SideMenuScaffoldState createState() => SideMenuScaffoldState();
}

class SideMenuScaffoldState extends State<SideMenuScaffold>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);

  Color _backgroundColor;
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.backgroundColor;
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: <Widget>[
          createSideMenuContainer(
            context,
            sideMenu: SideMenu(),
          ),
          dashboard(context),
        ],
      ),
    );
  }

  Widget createSideMenuContainer(context, {@required Widget sideMenu}) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: screenWidth * 0.75,
              padding: EdgeInsets.only(top: 80, bottom: 20),
              child: sideMenu,
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.7 * screenWidth,
      right: isCollapsed ? 0 : -0.3 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              if (isCollapsed) {
                return;
              }
              setState(() {
                _controller.reverse();
                isCollapsed = true;
              });
            },
            child: Material(
              animationDuration: duration,
              borderRadius:
                  isCollapsed ? null : BorderRadius.all(Radius.circular(40)),
              elevation: isCollapsed ? 0 : 10,
              color: _backgroundColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            child: Icon(Icons.menu, color: Colors.white),
                            onTap: () {
                              setState(() {
                                if (isCollapsed)
                                  _controller.forward();
                                else
                                  _controller.reverse();

                                isCollapsed = !isCollapsed;
                              });
                            },
                          ),
                          Text("My Cards",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white)),
                          Icon(Icons.settings, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 50),
                      Container(
                        height: 200,
                        child: PageView(
                          controller: PageController(viewportFraction: 0.8),
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.redAccent,
                              width: 100,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.blueAccent,
                              width: 100,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.greenAccent,
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Transactions",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                "Macbook",
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                "Apple",
                                style: TextStyle(color: Colors.grey),
                              ),
                              trailing: Text(
                                "-2900",
                                style: TextStyle(
                                    color: rng.nextInt(10) >= 5
                                        ? Colors.green
                                        : Colors.red),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(height: 16);
                          },
                          itemCount: 10)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
