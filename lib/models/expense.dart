class Expense {

  int _id;
  String _expenseName;
  String _expenseDescription;
  String _expenseType;
  double _expenseValue;
  String _expenseDate;

  Expense(Map json) {
    _id = json["id"];
    _expenseName = json["expenseName"];
    _expenseDescription = json["expenseDescription"];
    _expenseType = json["expenseType"];
    _expenseValue = json["expenseValue"];
    _expenseDate = json["expenseDate"];
  }

  int get getId => _id;

  String get getExpenseName => _expenseName;

  String get getExpenseDescription => _expenseDescription;

  String get getExpenseType => _expenseType;

  double get getExpenseValue => _expenseValue;

  String get getExpenseDate => _expenseDate;

}