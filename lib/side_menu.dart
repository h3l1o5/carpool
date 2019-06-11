import 'package:flutter/material.dart';
import 'package:kapoo/side_menu_scaffold.dart';

class SideMenu extends StatelessWidget {
  const SideMenu(
      {Key key, @required this.currentTab, @required this.onChangeScreen})
      : super(key: key);

  final TabEnum currentTab;
  final Function(TabEnum screen) onChangeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(45),
              ),
            ),
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "訪客",
                style: TextStyle(fontSize: 36),
              ),
              Text(
                "請登入以使用大部分功能",
                style: TextStyle(color: Colors.white70),
              )
            ],
          ),
          SizedBox(height: 60),
          Container(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => onChangeScreen(TabEnum.explore),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.search,
                          color: currentTab == TabEnum.explore
                              ? Colors.white
                              : Colors.white54),
                      SizedBox(width: 10),
                      Text(
                        "Feature X",
                        style: TextStyle(
                            fontSize: 20,
                            color: currentTab == TabEnum.explore
                                ? Colors.white
                                : Colors.white54),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
          Spacer(),
          RaisedButton(
            child: Text("登入"),
            color: Color(0xFFFF5A5F),
            textColor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
