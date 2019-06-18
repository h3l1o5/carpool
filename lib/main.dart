import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kapoo/router.dart';
import 'package:kapoo/theme.dart';
import 'package:kapoo/pages/root_page.dart';
import 'package:kapoo/blocs/root_page_tab_bloc.dart';
import 'package:kapoo/blocs/auth_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RootPageTabBloc>.value(value: RootPageTabBloc()),
        ChangeNotifierProvider<AuthBloc>.value(value: AuthBloc()),
      ],
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
