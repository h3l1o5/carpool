import 'package:flutter/material.dart';
import 'package:kapoo/router.dart';
import 'package:kapoo/theme.dart';
import 'package:provider/provider.dart';
import 'package:kapoo/blocs/root_page_tab_bloc.dart';
import 'package:kapoo/pages/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RootPageTabBloc>(
      builder: (_) => RootPageTabBloc(initialTab: RootPageTabEnum.explore),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Baby Names',
        home: RootPage(),
        initialRoute: rootPageRoute,
        onGenerateRoute: Router.generateRoute,
        theme: AppTheme.dark,
      ),
    );
  }
}
