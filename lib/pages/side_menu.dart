import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kapoo/blocs/root_page_tab_bloc.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key, this.onChangingSideMenuStatus}) : super(key: key);

  final void Function() onChangingSideMenuStatus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rootPagetabBloc = Provider.of<RootPageTabBloc>(context);

    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
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
                      snapshot.hasData ? "你好" : "訪客",
                      style: TextStyle(
                        fontSize: 36,
                        color: theme.textTheme.body1.color,
                      ),
                    ),
                    Text(
                      snapshot.hasData ? "點此編輯詳細資訊" : "請登入以使用大部分功能",
                      style: TextStyle(
                        color: theme.textTheme.body1.color.withAlpha(150),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 60),
                Container(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          rootPagetabBloc.currentTab = RootPageTabEnum.explore;
                          onChangingSideMenuStatus();
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: rootPagetabBloc.currentTab ==
                                      RootPageTabEnum.explore
                                  ? theme.iconTheme.color
                                  : theme.iconTheme.color.withAlpha(90),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "探索",
                              style: TextStyle(
                                fontSize: 20,
                                color: rootPagetabBloc.currentTab ==
                                        RootPageTabEnum.explore
                                    ? theme.textTheme.body1.color
                                    : theme.textTheme.body1.color.withAlpha(90),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          rootPagetabBloc.currentTab = RootPageTabEnum.setting;
                          onChangingSideMenuStatus();
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.settings,
                              color: rootPagetabBloc.currentTab ==
                                      RootPageTabEnum.setting
                                  ? theme.textTheme.body1.color
                                  : theme.textTheme.body1.color.withAlpha(90),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "設定",
                              style: TextStyle(
                                fontSize: 20,
                                color: rootPagetabBloc.currentTab ==
                                        RootPageTabEnum.setting
                                    ? theme.textTheme.body1.color
                                    : theme.textTheme.body1.color.withAlpha(90),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                RaisedButton(
                  child: Text(snapshot.hasData ? "登出" : "登入"),
                  color: theme.primaryColor,
                  textColor: Colors.white,
                  onPressed: () => snapshot.hasData
                      ? handleSignOut(context)
                      : handleSignIn(context),
                ),
              ],
            ),
          );
        });
  }

  void handleSignIn(BuildContext context) {
    Navigator.pushNamed(context, "/auth");
  }

  Future<void> handleSignOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }
}
