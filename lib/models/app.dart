import 'package:flutter/material.dart';

import 'package:expenses_management_webapp/pages/home_page.dart';

class App extends ChangeNotifier {
  Widget page;

  App() {
    this.page = HomePage();
  }

  changePage(Widget page) {
    this.page = page;

    notifyListeners();
  }

}