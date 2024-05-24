import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class ThemeModeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  FlexScheme _usedScheme = FlexScheme.mandyRed;

  ThemeMode get themeMode => _themeMode;
  FlexScheme get usedScheme => _usedScheme;

  set themeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      notifyListeners();
    }
  }

  set usedScheme(FlexScheme scheme) {
    _usedScheme = scheme;
    debugPrint("Changing color scheme");
    notifyListeners();
  }
}
