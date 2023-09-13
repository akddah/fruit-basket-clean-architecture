import 'package:flutter/material.dart';

extension ExtensionContext on BuildContext {
  double get h => MediaQuery.of(this).size.height;
  double get w => MediaQuery.of(this).size.width;
  TextStyle? get boldText => Theme.of(this).textTheme.labelMedium;
  TextStyle? get light => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get medium => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get regular => Theme.of(this).textTheme.bodyLarge;
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get activeColor => Theme.of(this).colorScheme.onSurfaceVariant;
  Color get hoverColor => Theme.of(this).hoverColor;
  Color get hintColor => Theme.of(this).hintColor;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get lightColor => Theme.of(this).primaryColorLight;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
}

extension StringContext on String {
  Color get color {
    String colorStr = trim();
    if (colorStr.length == 7) colorStr = "FF$colorStr";
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException("An error occurred when converting a color");
      }
    }
    return Color(val);
  }
}

extension ExtensionWidget on Widget {
  Widget get center => Align(alignment: Alignment.center, child: this);
  Widget withPadding(
      {double all = 0.0,
      double vertical = 0.0,
      double horizontal = 0.0,
      double top = 0.0,
      double bottom = 0.0,
      double start = 0.0,
      double end = 0.0}) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: all + vertical + top,
        bottom: all + vertical + bottom,
        start: all + horizontal + start,
        end: all + horizontal + end,
      ),
      child: this,
    );
  }

  Widget get toEnd => Align(alignment: AlignmentDirectional.centerEnd, child: this);
  Widget get toStart => Align(alignment: AlignmentDirectional.centerStart, child: this);
}

extension ExtensionInt on int {
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get minutes => Duration(minutes: this);
}
