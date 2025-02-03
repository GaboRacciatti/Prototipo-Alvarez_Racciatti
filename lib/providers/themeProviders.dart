import 'package:flutter/material.dart';
import '../helpers/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme;

  ThemeProvider(this._isDarkTheme);

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    Preferences.darkmode = _isDarkTheme; 
    notifyListeners(); 
  }
}
