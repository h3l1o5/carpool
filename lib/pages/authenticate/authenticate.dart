import 'package:flutter/material.dart';
import 'package:kapoo/pages/authenticate/customIcons.dart';
import 'package:kapoo/pages/authenticate/widgets/form_card.dart';
import 'package:kapoo/pages/authenticate/widgets/social_icons.dart';
import 'package:kapoo/router.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => new _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return new Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child:
                        Icon(Icons.close, color: theme.textTheme.body1.color),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(height: 80),
              FormCard(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        theme.primaryColor,
                        theme.primaryColorDark,
                      ]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF6078ea).withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0)
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(6.0),
                        onTap: () {},
                        child: Center(
                          child: Text(
                            "登入",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  horizontalLine(color: theme.textTheme.body1.color),
                  Text("社群帳號登入", style: TextStyle(fontSize: 16.0)),
                  horizontalLine(color: theme.textTheme.body1.color)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    colors: [
                      Color(0xFF102397),
                      Color(0xFF187adf),
                      Color(0xFF00eaf8),
                    ],
                    iconData: CustomIcons.facebook,
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  SocialIcon(
                    colors: [
                      Color(0xFFff4f38),
                      Color(0xFFff355d),
                    ],
                    iconData: CustomIcons.googlePlus,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "沒有帳號？",
                  ),
                  InkWell(
                    child: Text(
                      "註冊",
                      style: TextStyle(color: theme.accentColor, fontSize: 16),
                    ),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).pushNamed(signUpRoute);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget horizontalLine({@required Color color}) => Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 1,
            color: color.withOpacity(.3),
          ),
        ),
      );
}
