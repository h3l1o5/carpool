import 'package:flutter/material.dart';
import 'package:kapoo/side_menu_scaffold.dart';

class SideMenu extends StatelessWidget {
  const SideMenu(
      {Key key, @required this.currentScreen, @required this.onChangeScreen})
      : super(key: key);

  final ScreensEnum currentScreen;
  final Function(ScreensEnum screen) onChangeScreen;

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
            // padding: EdgeInsets.only(left: 15),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => onChangeScreen(ScreensEnum.screen1),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.search,
                          color: currentScreen == ScreensEnum.screen1
                              ? Colors.white
                              : Colors.white54),
                      SizedBox(width: 10),
                      Text(
                        "Feature X",
                        style: TextStyle(
                            fontSize: 20,
                            color: currentScreen == ScreensEnum.screen1
                                ? Colors.white
                                : Colors.white54),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () => onChangeScreen(ScreensEnum.screen2),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.message,
                          color: currentScreen == ScreensEnum.screen2
                              ? Colors.white
                              : Colors.white54),
                      SizedBox(width: 10),
                      Text(
                        "Feature Y",
                        style: TextStyle(
                            fontSize: 20,
                            color: currentScreen == ScreensEnum.screen2
                                ? Colors.white
                                : Colors.white54),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () => onChangeScreen(ScreensEnum.screen3),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today,
                          color: currentScreen == ScreensEnum.screen3
                              ? Colors.white
                              : Colors.white54),
                      SizedBox(width: 10),
                      Text(
                        "Feature Z",
                        style: TextStyle(
                            fontSize: 20,
                            color: currentScreen == ScreensEnum.screen3
                                ? Colors.white
                                : Colors.white54),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () => onChangeScreen(ScreensEnum.screen4),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.view_list,
                          color: currentScreen == ScreensEnum.screen4
                              ? Colors.white
                              : Colors.white54),
                      SizedBox(width: 10),
                      Text(
                        "Feature A",
                        style: TextStyle(
                            fontSize: 20,
                            color: currentScreen == ScreensEnum.screen4
                                ? Colors.white
                                : Colors.white54),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () => onChangeScreen(ScreensEnum.screen5),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.settings,
                          color: currentScreen == ScreensEnum.screen5
                              ? Colors.white
                              : Colors.white54),
                      SizedBox(width: 10),
                      Text(
                        "Feature B",
                        style: TextStyle(
                            fontSize: 20,
                            color: currentScreen == ScreensEnum.screen5
                                ? Colors.white
                                : Colors.white54),
                      ),
                    ],
                  ),
                ),
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
