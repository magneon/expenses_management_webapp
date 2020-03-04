class Expense {

  int _id;
  String _expenseName;
  String _expenseDescription;
  String _expenseType;
  double _expenseValue;
  String _expenseDate;

  Expense(Map json) {
    _id = json["id"];
    _expenseName = json["name"];
    _expenseDescription = json["description"];
    _expenseType = json["type"];
    _expenseValue = json["value"];
    _expenseDate = json["date"];
  }

  int get getId => _id;

  String get getExpenseName => _expenseName;

  String get getExpenseDescription => _expenseDescription;

  String get getExpenseType => _expenseType;

  double get getExpenseValue => _expenseValue;

  String get getExpenseDate => _expenseDate;

  @override
  String toString() {
    return "id=[$_id], expenseName=[$_expenseName], expenseDescription=[$_expenseDescription], expenseType=[$_expenseType], expenseValue=[$_expenseValue], expenseDate=[$_expenseDate]";
  }

}