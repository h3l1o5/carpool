import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kapoo/utils/validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Builder(
        builder: (context) => SafeArea(
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
                          child: Icon(Icons.arrow_back,
                              color: theme.textTheme.body1.color),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: Container(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("註冊", style: TextStyle(fontSize: 24)),
                              SizedBox(height: 30),
                              Text("電子郵件地址", style: TextStyle(fontSize: 18)),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (!Validator.isEmailValid(value)) {
                                    return "請輸入正確的電子郵件地址";
                                  }
                                },
                                style: TextStyle(
                                    color: theme.textTheme.body1.color),
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
                                validator: (value) {
                                  if (!Validator.isPasswordValid(value)) {
                                    return "密碼需要至少為八碼";
                                  }
                                },
                                obscureText: true,
                                style: TextStyle(
                                    color: theme.textTheme.body1.color),
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
                            ],
                          ),
                        ),
                      ),
                    ),
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
                              onTap: () => handleSignUp(context),
                              child: Center(
                                child: Text(
                                  "註冊",
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
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Future<void> handleSignUp(BuildContext context) async {
    if (!_autoValidate) {
      setState(() {
        _autoValidate = true;
      });
    }

    if (!_formKey.currentState.validate()) {
      return;
    }

    try {
      FirebaseUser user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "martysun25@gmail.com", password: "84504115");

      print(user);
    } catch (e) {
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
    }
  }
}
