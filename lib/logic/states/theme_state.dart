// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ThemeState {
  final Brightness brightness;
  final Color seedColor;
  const ThemeState({
    required this.brightness,
    required this.seedColor,
  });

  ThemeState.initial()
      : brightness = Brightness.light,
        seedColor = Colors.deepPurple;

  ThemeState copyWith({
    Brightness? brightness,
    Color? seedColor,
  }) {
    return ThemeState(
      brightness: brightness ?? this.brightness,
      seedColor: seedColor ?? this.seedColor,
    );
  }
}
