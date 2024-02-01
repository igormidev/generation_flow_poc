import 'package:enchanted_collection/enchanted_collection.dart';
import 'package:enchanted_regex/enchanted_regex.dart';
import 'package:flutter/material.dart';
import 'package:generation_flow_poc/logic/dtos/question_pattern.dart';

mixin PatternCastMixin {
  /// Returns `null` if dosen't exist
  QuestionPattern? fromQuestionUi({
    required String source,
    required ColorScheme scheme,
    required void Function(String button) onClick,
    required String? selectedButtonText,
  }) {
    final caracterSpecialDetector = RegExp(r'(?<hightLight>\[[a-zA-Z\s&]+\])');

    if (source.contains('\n')) {
      final String cleanText = source
          .replaceAll(caracterSpecialDetector, '')
          .replaceAll('\n', '')
          .trim();

      final List<String> options = source
          .splitMapNamedGroupWithCast<String?>(
            caracterSpecialDetector,
            onMatch: (group) {
              return group.content.replaceAll('[', '').replaceAll(']', '');
            },
            onNonMatch: (_) => null,
          )
          .removeNull;

      return QuestionPattern.buttons(
        title: cleanText,
        options: options,
      );
    } else {
      return QuestionPattern.richText(
        spans: source
            .splitMapNamedGroupWithCast<List<InlineSpan>>(
              caracterSpecialDetector,
              onMatch: (group) {
                final cleanGroup =
                    group.content.replaceAll('[', '').replaceAll(']', '');

                return [
                  WidgetSpan(
                    // baseline: TextBaseline.alphabetic,
                    // alignment: PlaceholderAlignment.middle,
                    child: Builder(builder: (context) {
                      return InkWell(
                        onTap: () {
                          onClick(cleanGroup);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: selectedButtonText == cleanGroup
                                ? scheme.primaryContainer
                                : scheme.tertiaryContainer,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text.rich(
                            TextSpan(
                              text: cleanGroup,
                              style: TextStyle(
                                fontSize: 20,
                                color: selectedButtonText == cleanGroup
                                    ? scheme.primary
                                    : scheme.tertiary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                ];
              },
              onNonMatch: (text) {
                return [
                  const WidgetSpan(
                    child: Text.rich(
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ...text.split(' ').map<WidgetSpan?>((text) {
                    if (text.isEmpty) return null;
                    return WidgetSpan(
                      child: Text.rich(
                        TextSpan(
                          text: '$text ',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                ].removeNull;
              },
            )
            .removeNull
            .expand((element) => element)
            .toList(),
      );
    }
  }
}

extension EnchantedStringRegexExtension on String {
  /// Equal to [splitMapCast], but instead of [onMatch] using
  /// a [Match] class will use a [FindedGroup] class.
  List<T> splitMapNamedGroupWithCast<T>(
    RegExp regex, {
    required T Function(FindedGroup group) onMatch,
    required T Function(String text) onNonMatch,
  }) {
    final List<T> items = [];
    int startIndex = 0;
    for (final RegExpMatch match in regex.allMatches(this)) {
      items.add(onNonMatch(substring(startIndex, match.start)));
      final findedGroups = match.groupsStats(regex.pattern);

      int groupStartIndex = 0;

      for (final FindedGroup group in findedGroups) {
        items.add(
          onNonMatch(group.content.substring(groupStartIndex, group.start)),
        );
        items.add(onMatch(group));
        groupStartIndex = group.end;

        items.add(onNonMatch(group.content.substring(groupStartIndex)));
      }

      startIndex = match.end;
    }

    items.add(onNonMatch(substring(startIndex)));
    return items;
  }
}
