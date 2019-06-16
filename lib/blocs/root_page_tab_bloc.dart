import 'package:flutter/material.dart';

enum RootPageTabEnum { explore, setting }

class RootPageTabBloc with ChangeNotifier {
  static final RootPageTabBloc _rootPageTabSingleton =
      RootPageTabBloc._internal();
  RootPageTabEnum _currentTab;

  factory RootPageTabBloc() {
    return _rootPageTabSingleton;
  }
  RootPageTabBloc._internal() {
    _currentTab = RootPageTabEnum.explore;
  }

  RootPageTabEnum get currentTab {
    return _currentTab;
  }

  set currentTab(RootPageTabEnum tab) {
    _currentTab = tab;
    notifyListeners();
  }
}
