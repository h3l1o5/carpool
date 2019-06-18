import 'package:flutter/material.dart';
import 'package:kapoo/blocs/auth_bloc.dart';
import 'package:kapoo/utils/validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  bool _shouldAutoValidate = false;
  bool _isBusy = false;

  @override
  void dispose() {
    super.dispose();
    _emailFieldController.dispose();
    _passwordFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: _isBusy,
        child: Builder(
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
                            child: Icon(
                              Icons.arrow_back,
                              color: theme.textTheme.body1.color,
                            ),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Form(
                        key: _formKey,
                        autovalidate: _shouldAutoValidate,
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
                                Text(
                                  "註冊",
                                  style: TextStyle(fontSize: 24),
                                ),
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
                                  controller: _passwordFieldController,
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
                                SizedBox(height: 20),
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
                            child: Text("註冊"),
                            onPressed: () => handleSignUp(context),
                            color: theme.primaryColor,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }

  Future<void> handleSignUp(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      setState(() {
        _shouldAutoValidate = true;
      });
      return;
    }

    setState(() {
      _isBusy = true;
    });

    final authBloc = Provider.of<AuthBloc>(context);
    try {
      await authBloc.signUp(
          _emailFieldController.text, _passwordFieldController.text);

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              title: Text("註冊成功"),
              content: Text("現在你可以使用這個電子郵件地址登入了"),
              actions: <Widget>[
                FlatButton(
                  child: Text("返回"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
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
    } finally {
      setState(() {
        _isBusy = false;
      });
    }
  }
}
