import 'package:flutter/material.dart';

enum RootPageTabEnum { explore, setting }

class RootPageTabBloc with ChangeNotifier {
  RootPageTabEnum _currentTab;

  RootPageTabBloc({RootPageTabEnum initialTab = RootPageTabEnum.explore}) {
    _currentTab = initialTab;
  }

  RootPageTabEnum get currentTab {
    return _currentTab;
  }

  set currentTab(RootPageTabEnum tab) {
    _currentTab = tab;
    notifyListeners();
  }
}
