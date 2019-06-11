import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kapoo/blocs/root_page_tab_bloc.dart';
import 'package:kapoo/pages/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: ChangeNotifierProvider<RootPageTabBloc>(
        builder: (_) => RootPageTabBloc(initialTab: RootPageTabEnum.explore),
        child: RootPage(
          backgroundColor: Color(0xFF333340),
        ),
      ),
      theme: ThemeData(
        primaryColor: Color(0xFFFF5A5F),
        accentColor: Color(0xFF00A699),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
