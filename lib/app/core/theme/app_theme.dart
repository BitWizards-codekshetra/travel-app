import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTheme {
  /// for getting light theme
  ThemeData get lightTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF2F2F2F)),
        useMaterial3: false,
        iconTheme: IconThemeData(color: Colors.black),
        primaryColor: const Color(0xFFF6F4EB));
  }

  /// for getting dark theme
  ThemeData get darkTheme {
    return ThemeData(
        useMaterial3: false,
        iconTheme: IconThemeData(color: Colors.black),
        primaryColor: const Color(0xFFF6F4EB));
  }
}

/// for providing app theme [AppTheme]
final appThemeProvider = Provider<AppTheme>((_) => AppTheme());
