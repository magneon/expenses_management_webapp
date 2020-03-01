import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:expenses_management_webapp/models/app.dart';

class Right extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    App app = Provider.of<App>(context);

    return app.pages.last.page;
  }
}