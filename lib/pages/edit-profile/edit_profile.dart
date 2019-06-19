import 'package:flutter/material.dart';
import 'package:kapoo/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authBloc = Provider.of<AuthBloc>(context);
    final user = authBloc.getUser();

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          elevation: 0,
          actions: <Widget>[
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.only(right: 10),
              child: FlatButton(
                textColor: theme.textTheme.button.color,
                child: Text("儲存"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        backgroundColor: theme.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("基本資訊", style: theme.textTheme.display1),
                SizedBox(height: 15),
                Text("顯示名稱"),
                TextField(
                  style: TextStyle(color: theme.textTheme.body1.color),
                  decoration: InputDecoration(hintText: "若為空則顯示為匿名用戶"),
                ),
                SizedBox(height: 15),
                Text("性別"),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 0, top: 12, right: 0, bottom: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: theme.inputDecorationTheme.border.borderSide,
                    ),
                  ),
                  child: Text("不透露"),
                ),
                SizedBox(height: 15),
                Text("生日"),
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.only(left: 0, top: 12, right: 0, bottom: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: theme.inputDecorationTheme.border.borderSide,
                    ),
                  ),
                  child: Text("2000/8/24"),
                ),
                SizedBox(height: 15),
                Text("關於我"),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: TextField(
                    style: TextStyle(color: theme.textTheme.body1.color),
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "簡單介紹一下您自己，讓未來的駕駛或乘客更了解您。",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text("選填內容", style: theme.textTheme.display1),
                SizedBox(height: 15),
                Text("職業"),
                TextField(
                  style: TextStyle(color: theme.textTheme.body1.color),
                  decoration: InputDecoration(hintText: "輸入職業"),
                ),
                SizedBox(height: 15),
                Text("學校或工作單位"),
                TextField(
                  style: TextStyle(color: theme.textTheme.body1.color),
                  decoration: InputDecoration(hintText: "輸入學校或工作單位"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
