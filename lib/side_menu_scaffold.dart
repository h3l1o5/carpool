import 'package:flutter/material.dart';
import 'package:kapoo/side_menu.dart';

enum TabEnum { explore }
const Map<TabEnum, Widget> tabs = {
  TabEnum.explore: Center(
    child: Text("TAB 1"),
  ),
};

class SideMenuScaffold extends StatefulWidget {
  SideMenuScaffold({Key key, this.backgroundColor = Colors.white})
      : super(key: key);

  final Color backgroundColor;

  @override
  SideMenuScaffoldState createState() => SideMenuScaffoldState();
}

class SideMenuScaffoldState extends State<SideMenuScaffold>
    with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(milliseconds: 300);

  bool isMenuCollapsed = true;
  double screenWidth, screenHeight;
  TabEnum currentTab = TabEnum.explore;

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

    List<Widget> stacks = List()
      ..add(createSideMenuContainer(
        context,
        sideMenu: SideMenu(
          currentTab: currentTab,
          onChangeScreen: (TabEnum screen) {
            setState(() {
              _controller.reverse();
              isMenuCollapsed = true;
              currentTab = screen;
            });
          },
        ),
      ))
      ..addAll(tabs.keys.map((tab) {
        return Offstage(
          offstage: currentTab != tab,
          child: Stack(
            children: <Widget>[
              createTabContainer(context, tabs[tab]),
            ],
          ),
        );
      }).toList());

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: stacks,
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

  Widget createTabContainer(context, Widget tabWidget) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isMenuCollapsed ? 0 : 0.7 * screenWidth,
      right: isMenuCollapsed ? 0 : -0.3 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              if (isMenuCollapsed) {
                return;
              }
              setState(() {
                _controller.reverse();
                isMenuCollapsed = true;
              });
            },
            child: Material(
              animationDuration: duration,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              elevation: isMenuCollapsed ? 0 : 8,
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
                                if (isMenuCollapsed)
                                  _controller.forward();
                                else
                                  _controller.reverse();

                                isMenuCollapsed = !isMenuCollapsed;
                              });
                            },
                          ),
                          Text(
                            "My Cards",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          Icon(Icons.settings, color: Colors.white),
                        ],
                      ),
                      SizedBox(height: 50),
                      tabWidget,
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
