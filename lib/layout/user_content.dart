import 'package:expenses_management_webapp/models/choice.dart';
import 'package:flutter/material.dart';

class UserContent extends StatefulWidget {
  @override
  _UserContentState createState() => _UserContentState();
}

class _UserContentState extends State<UserContent> {

  GlobalKey _menuState = GlobalKey();
  Choice _selectedChoice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Text("Usuário Logado", style: TextStyle(color: Colors.white))
        ),
        GestureDetector(
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://cdn2.iconfinder.com/data/icons/people-flat-design/64/Man-Person-People-Avatar-User-Happy-512.png"),
            backgroundColor: Colors.white,
            radius: 30.0,
          ),
          onTap: () {
            dynamic state = _menuState.currentState;
            state.showButtonMenu();
          }
        ),
        PopupMenuButton<Choice>(
          key: _menuState,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          onSelected: (choice) {
            _selectedChoice = choice;

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Text("${_selectedChoice.title}"),
                );
              }
            );

            Scaffold.of(context).openEndDrawer();
          },
          itemBuilder: (BuildContext context) {
            List<Choice> choices = List();

            choices.add(Choice(icon: Icons.account_balance, title: "Lolo 2"));
            choices.add(Choice(icon: Icons.account_balance_wallet, title: "Lolo 3"));

            return choices.map((Choice choice) {
              return PopupMenuItem<Choice>(
                value: choice,
                child: Text(choice.title),
                /*
                child: ListTile(
                  leading: InkWell(
                    child: Icon(choice.icon),
                  ),
                  title: Text(choice.title),
                ),
                */
              );
            }).toList();
          },
        )
      ],
    );
  }
}