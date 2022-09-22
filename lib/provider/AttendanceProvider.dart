import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AttendanceProvider extends ChangeNotifier{
  TextEditingController controller=TextEditingController();

  addAttendanceToDatabase(){
   print("hello");

  notifyListeners();
  controller.clear();
  }
}