import 'package:flutter/material.dart';
import 'package:kapoo/blocs/auth_bloc.dart';
import 'package:kapoo/blocs/root_page_tab_bloc.dart';
import 'package:kapoo/enum.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key, this.onChangingSideMenuStatus}) : super(key: key);

  final void Function() onChangingSideMenuStatus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final rootPagetabBloc = Provider.of<RootPageTabBloc>(context);
    final authBloc = Provider.of<AuthBloc>(context);
    final user = authBloc.getUser();

    return Container(
      padding: EdgeInsets.all(48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          user != null && user.photoUrl != ""
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: Image.network(
                    user.photoUrl,
                    height: 90,
                    width: 90,
                  ),
                )
              : Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(45),
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
                user != null
                    ? user.displayName != "" ? user.displayName : "匿名用戶"
                    : "訪客",
                style: TextStyle(
                  fontSize: 36,
                  color: theme.textTheme.body1.color,
                ),
              ),
              Text(
                user != null ? "點此編輯詳細資訊" : "請登入以使用大部分功能",
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
                    rootPagetabBloc.currentTab = ROOT_PAGE_TAB.EXPLORE;
                    onChangingSideMenuStatus();
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color:
                            rootPagetabBloc.currentTab == ROOT_PAGE_TAB.EXPLORE
                                ? theme.iconTheme.color
                                : theme.iconTheme.color.withAlpha(90),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "探索",
                        style: TextStyle(
                          fontSize: 20,
                          color: rootPagetabBloc.currentTab ==
                                  ROOT_PAGE_TAB.EXPLORE
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
                    rootPagetabBloc.currentTab = ROOT_PAGE_TAB.SETTING;
                    onChangingSideMenuStatus();
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color:
                            rootPagetabBloc.currentTab == ROOT_PAGE_TAB.SETTING
                                ? theme.textTheme.body1.color
                                : theme.textTheme.body1.color.withAlpha(90),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "設定",
                        style: TextStyle(
                          fontSize: 20,
                          color: rootPagetabBloc.currentTab ==
                                  ROOT_PAGE_TAB.SETTING
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
            child: Text(user != null ? "登出" : "登入"),
            color: theme.primaryColor,
            textColor: Colors.white,
            onPressed: () =>
                user != null ? handleSignOut(context) : handleSignIn(context),
          ),
        ],
      ),
    );
  }

  void handleSignIn(BuildContext context) {
    Navigator.pushNamed(context, "/auth");
  }

  Future<void> handleSignOut(BuildContext context) async {
    final authBloc = Provider.of<AuthBloc>(context);

    try {
      await authBloc.signOut();
    } catch (e) {
      print(e);
    }
  }
}
