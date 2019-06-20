import 'package:flutter/material.dart';
import 'package:kapoo/models/user.dart';
import 'package:kapoo/utils/selector.dart';

class EditProfile extends StatefulWidget {
  final User user;

  const EditProfile({Key key, this.user}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _displayName;
  String _gender;

  @override
  void initState() {
    super.initState();

    _displayName = widget.user.displayName;
    _gender = widget.user.gender;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("基本資訊", style: theme.textTheme.display1),
                SizedBox(height: 15),
                Text("顯示名稱"),
                TextFormField(
                  initialValue: _displayName,
                  style: TextStyle(color: theme.textTheme.body1.color),
                  decoration: InputDecoration(hintText: "若為空則顯示為匿名用戶"),
                ),
                SizedBox(height: 15),
                Text("性別"),
                InkWell(
                  onTap: () {
                    Selector.show(
                      context: context,
                      title: "性別",
                      items: {
                        "": "不透露",
                        "male": "男",
                        "female": "女",
                        "other": "其他"
                      },
                      selectedItemKey: _gender,
                      onSelect: (gender) => setState(() => _gender = gender),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 0, top: 12, right: 0, bottom: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: theme.inputDecorationTheme.border.borderSide,
                      ),
                    ),
                    child: Text(_gender == "male"
                        ? "男"
                        : _gender == "female"
                            ? "女"
                            : _gender == "other" ? "其他" : "不透露"),
                  ),
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
