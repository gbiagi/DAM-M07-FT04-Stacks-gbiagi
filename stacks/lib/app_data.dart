import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppData with ChangeNotifier {
// App status
  bool isSidebarLeftVisible = false;
  bool isSidebarRightVisible = false;
  Color textColor = Colors.black;

// Toggle sidebar left
  void toggleSidebarLeft() {
    isSidebarLeftVisible = !isSidebarLeftVisible;
    notifyListeners();
  }

// Toggle sidebar right
  void toggleSidebarRight() {
    isSidebarRightVisible = !isSidebarRightVisible;
    notifyListeners();
  }

  // Change color central text
  void setTextColor(Color color) {
    textColor = color;
    notifyListeners();
  }
}
