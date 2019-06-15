import 'package:flutter/material.dart';
import 'package:kapoo/blocs/root_page_tab_bloc.dart';
import 'package:kapoo/pages/explore/explore.dart';
import 'package:kapoo/pages/side_menu.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends State<RootPage>
    with SingleTickerProviderStateMixin {
  final Duration _duration = const Duration(milliseconds: 300);

  bool _isSideMenuCollapsed = true;

  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
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
    final rootPageTabBloc = Provider.of<RootPageTabBloc>(context);
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.backgroundColor,
            theme.backgroundColor.withOpacity(.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            createSideMenuContainer(
              context,
              sideMenu: SideMenu(
                onChangingSideMenuStatus: _handleChangingSideMenuStatus,
              ),
            ),
            Container(
              child: Offstage(
                offstage: rootPageTabBloc.currentTab != RootPageTabEnum.explore,
                child: Stack(
                  children: <Widget>[
                    createTabContainer(
                      context,
                      Explore(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 20,
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_home,
                  progress: _controller,
                ),
                onTap: _handleChangingSideMenuStatus,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleChangingSideMenuStatus() {
    if (_isSideMenuCollapsed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    setState(() {
      _isSideMenuCollapsed = !_isSideMenuCollapsed;
    });
  }

  Widget createSideMenuContainer(context, {@required Widget sideMenu}) {
    final screenWidth = MediaQuery.of(context).size.width;

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
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return AnimatedPositioned(
      duration: _duration,
      top: 0,
      bottom: 0,
      left: _isSideMenuCollapsed ? 0 : 0.7 * screenWidth,
      right: _isSideMenuCollapsed ? 0 : -0.3 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTap: _isSideMenuCollapsed ? null : _handleChangingSideMenuStatus,
          child: Material(
            animationDuration: _duration,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            elevation: _isSideMenuCollapsed ? 0 : 8,
            color: theme.backgroundColor,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: tabWidget,
            ),
          ),
        ),
      ),
    );
  }
}
