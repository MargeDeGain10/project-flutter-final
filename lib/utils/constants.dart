import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color accent = Color(0xFF1976D2);
  static const Color background = Color(0xFFF0F0F0);
}

class AppStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle taskTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static const TextStyle taskTitleDone = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.lineThrough,
    color: Colors.grey,
  );
}
