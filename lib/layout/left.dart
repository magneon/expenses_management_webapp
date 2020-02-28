import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:expenses_management_webapp/pages/home_page.dart';
import 'package:expenses_management_webapp/pages/despesa_page.dart';
import 'package:expenses_management_webapp/pages/usuario_page.dart';

import 'package:expenses_management_webapp/constants.dart';
import 'package:expenses_management_webapp/models/app.dart';
import 'package:expenses_management_webapp/utils/color_util.dart';
import 'package:expenses_management_webapp/layout/user_content.dart';

class Left extends StatefulWidget {
  @override
  _LeftState createState() => _LeftState();
}

class _LeftState extends State<Left> {
  String itemSelected;

  Size get size => MediaQuery.of(context).size;

  bool get showMenuCollapsed => size.width < 760;

  @override
  Widget build(BuildContext context) {
    return _menuContent();
  }

  _menuContent() {
    return showMenuCollapsed ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: headerHeight,
          color: ColorUtil.getHeaderColor(),
          child: _userContent(),
        ),
        Container(
          height: size.height - headerHeight,
          child: _menuOptions(),
        )
      ],
    ) : _menuOptions();
  }

  _userContent() {
    return UserContent();
  }

  _menuOptions() {
    return Container(
      child: ListView(
        children: <Widget>[
          _createListTileItem(Icons.home, "Home", HomePage()),
          _createListTileItem(Icons.account_balance_wallet, "Despesas", DespesaPage()),
          _createListTileItem(Icons.account_box, "Usuários", UsuarioPage()),
        ],
      )
    );
  }

  _createListTileItem(IconData icon, String title, Widget targetPage) {
    bool isSelected = this.itemSelected == title;

    return Material(
      color: isSelected ? Theme.of(context).hoverColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          App app = Provider.of<App>(context, listen: false);

          app.changePage(targetPage);

          Scaffold.of(context).openEndDrawer();

          setState(() {
            this.itemSelected = title;
          });
        },
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
        ),
      ),
    );
  }
}