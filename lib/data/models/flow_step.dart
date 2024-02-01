// ignore_for_file: public_member_api_docs, sort_constructors_first
class FlowStep {
  final EScreenType screenState;
  final String uiTextBuilder;

  const FlowStep({
    required this.screenState,
    required this.uiTextBuilder,
  });

  factory FlowStep.fromMap(Map<String, dynamic> map) {
    final screenStateText = map['screen_state'] as String;

    return FlowStep(
      screenState: screenStateText == 'final'
          ? EScreenType.end
          : screenStateText == 'questions'
              ? EScreenType.questions
              : EScreenType.start,
      uiTextBuilder: map['ui'] as String,
    );
  }

  @override
  String toString() => 'uiTextBuilder: $uiTextBuilder';
}

enum EScreenType {
  start,
  questions,
  end;
}
