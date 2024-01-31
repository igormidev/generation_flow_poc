import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_pattern.freezed.dart';

@freezed
abstract class QuestionPattern with _$QuestionPattern {
  factory QuestionPattern.richText({
    required List<InlineSpan> spans,
  }) = _QuestionPatternRichText;

  factory QuestionPattern.buttons({
    required String title,
    required List<String> options,
  }) = _QuestionPatternButtons;
}
