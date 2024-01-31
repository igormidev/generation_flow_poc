import 'package:flutter/material.dart';

extension BuildContextThemeExtension on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;
  TextTheme get texts => Theme.of(this).textTheme;
  T theme<T>() => Theme.of(this).extension<T>()!;
}
