import 'package:flutter/material.dart';

class FormCard extends StatefulWidget {
  FormCard(
      {Key key,
      this.isSignUp = false,
      @required this.emailFieldController,
      @required this.passwordFieldController})
      : super(key: key);

  final bool isSignUp;
  final TextEditingController emailFieldController;
  final TextEditingController passwordFieldController;

  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return new Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.isSignUp ? "註冊" : "登入",
                  style: TextStyle(fontSize: 24)),
              SizedBox(height: 30),
              Text("電子郵件地址", style: TextStyle(fontSize: 18)),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: widget.emailFieldController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter some text";
                  } else {
                    return null;
                  }
                },
                style: TextStyle(color: theme.textTheme.body1.color),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.textTheme.body1.color.withOpacity(.3),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.textTheme.body1.color.withOpacity(.3),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text("密碼", style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: widget.passwordFieldController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter some text";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                style: TextStyle(color: theme.textTheme.body1.color),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.textTheme.body1.color.withOpacity(.3),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: theme.textTheme.body1.color.withOpacity(.3),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              widget.isSignUp
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "忘記密碼?",
                          style:
                              TextStyle(color: theme.accentColor, fontSize: 16),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
