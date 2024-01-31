import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:generation_flow_poc/logic/states/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void setBrightness(Brightness brightness) {
    emit(state.copyWith(brightness: brightness));
  }

  void setSeedColor(Color seedColor) {
    emit(state.copyWith(seedColor: seedColor));
  }
}
