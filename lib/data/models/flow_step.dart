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
}

enum EScreenType {
  start,
  questions,
  end;
}
