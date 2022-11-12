import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyProvider with ChangeNotifier{
  var defaultItem = "Female";
  DateTime date = DateTime.now();
  late var formattedDate = DateFormat('d-MMM-yy').format(date);
  bool checkedValue = true;

  void switchChange(String? changedValue) {
    defaultItem = changedValue!;
    defaultItem;
    notifyListeners();
  }
  void dateChanger(selectedDate){
    date = selectedDate;
    formattedDate = DateFormat('d-MMM-yy').format(selectedDate);
    notifyListeners();
  }
  void check(newValue){
    checkedValue = newValue;
    notifyListeners();
  }
}