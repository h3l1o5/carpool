import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kapoo/pages/authenticate/customIcons.dart';
import 'package:kapoo/pages/authenticate/widgets/social_icons.dart';
import 'package:kapoo/router.dart';
import 'package:kapoo/utils/validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => new _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  bool _shouldAutoValidate = false;
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget horizontalLine = Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 1,
          color: theme.textTheme.body1.color.withOpacity(.3),
        ),
      ),
    );

    return Container(
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: ModalProgressHUD(
          inAsyncCall: _isBusy,
          child: SafeArea(
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
                        child: Icon(Icons.close,
                            color: theme.textTheme.body1.color),
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: theme.backgroundColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        autovalidate: _shouldAutoValidate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("登入", style: TextStyle(fontSize: 24)),
                            SizedBox(height: 30),
                            Text("電子郵件地址", style: TextStyle(fontSize: 18)),
                            TextFormField(
                              controller: _emailFieldController,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              validator: (value) {
                                if (!Validator.isEmailValid(value)) {
                                  return "請輸入正確的電子郵件地址";
                                }
                              },
                              style:
                                  TextStyle(color: theme.textTheme.body1.color),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: theme.textTheme.body1.color
                                        .withOpacity(.3),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: theme.textTheme.body1.color
                                        .withOpacity(.3),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Text("密碼", style: TextStyle(fontSize: 18)),
                            TextFormField(
                              controller: _passwordFieldController,
                              validator: (value) {
                                if (!Validator.isPasswordValid(value)) {
                                  return "密碼需要至少為八碼";
                                }
                              },
                              obscureText: true,
                              style:
                                  TextStyle(color: theme.textTheme.body1.color),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: theme.textTheme.body1.color
                                        .withOpacity(.3),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: theme.textTheme.body1.color
                                        .withOpacity(.3),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "忘記密碼?",
                                  style: TextStyle(
                                      color: theme.accentColor, fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("登入"),
                        onPressed: () => handleSignInPressed(context),
                        color: theme.primaryColor,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine,
                      Text("社群帳號登入", style: TextStyle(fontSize: 16.0)),
                      horizontalLine,
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
                          style:
                              TextStyle(color: theme.accentColor, fontSize: 16),
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
        ),
      ),
    );
  }

  Future<void> handleSignInPressed(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      setState(() {
        _shouldAutoValidate = true;
      });
      return;
    }

    setState(() {
      _isBusy = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailFieldController.text,
          password: _passwordFieldController.text);

      Navigator.of(context).pop();
    } catch (e) {
      print(e.code);
      if (e.code == "ERROR_EMAIL_ALREADY_IN_USE") {
        final snackBar = SnackBar(
          content: Row(
            children: <Widget>[
              Text(
                '錯誤',
                style: TextStyle(
                  color: Theme.of(context).errorColor,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '這個電子郵件地址已被使用',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          action: SnackBarAction(
            label: "關閉",
            onPressed: () {},
          ),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      }
    } finally {
      setState(() {
        _isBusy = false;
      });
    }
  }
}
