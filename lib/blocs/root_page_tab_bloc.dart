import 'package:flutter/material.dart';
import 'package:kapoo/enum.dart';

class RootPageTabBloc with ChangeNotifier {
  ROOT_PAGE_TAB _currentTab;

  RootPageTabBloc() {
    _currentTab = ROOT_PAGE_TAB.EXPLORE;
  }

  ROOT_PAGE_TAB get currentTab {
    return _currentTab;
  }

  set currentTab(ROOT_PAGE_TAB tab) {
    _currentTab = tab;
    notifyListeners();
  }
}
