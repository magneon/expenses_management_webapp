import 'package:flutter/material.dart';

import 'package:expenses_management_webapp/models/page_info.dart';
import 'package:expenses_management_webapp/pages/home_page.dart';


class App extends ChangeNotifier {
  List<PageInfo> pages = List();

  PageInfo defaultPage = PageInfo("Home", HomePage());

  App() {
    this.pages.add(defaultPage);
  }

  changePage(PageInfo page, {bool replace: false}) {
    if (replace) {
      this.pages.clear();
      this.pages.add(defaultPage);
    }

    if (page.title != "Home") {
      this.pages.add(page);
    }

    notifyListeners();
  }

  void pop() {
    this.pages.removeLast();

    notifyListeners();
  }

  void popAll() {
    this.pages.clear();

    this.pages.add(defaultPage);

    notifyListeners();
  }

  void popTo(int index) {
    this.pages.removeRange(index + 1, this.pages.length);

    notifyListeners();
  }

}