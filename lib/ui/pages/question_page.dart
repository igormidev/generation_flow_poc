import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/core/context_extensions.dart';
import 'package:generation_flow_poc/data/models/flow_step.dart';
import 'package:generation_flow_poc/logic/cubits/flow_cubit.dart';
import 'package:generation_flow_poc/logic/dtos/question_pattern.dart';
import 'package:generation_flow_poc/logic/mixins/pattern_cast_mixin.dart';
import 'package:generation_flow_poc/logic/mixins/start_flow_again_mixin.dart';
import 'package:generation_flow_poc/ui/components/flow_bottom_navigation_bar.dart';
import 'package:generation_flow_poc/ui/pages/episode_lenght_page.dart';
import 'package:generation_flow_poc/ui/pages/flow_page.dart';
import 'package:generation_flow_poc/ui/pages/start_page.dart';

class QuestionsPage extends StatefulWidget {
  final int currentStep;
  final FlowStep flowStep;
  const QuestionsPage({
    super.key,
    required this.currentStep,
    required this.flowStep,
  });

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage>
    with PatternCastMixin, StartFlowAgainMixin {
  QuestionPattern? questionPattern;
  String selectedButtonText = '';
  final List<String> titles = [];

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isTitlesScreen = widget.flowStep.screenState == EScreenType.end;

    questionPattern = fromQuestionUi(
      source: widget.flowStep.uiTextBuilder,
      scheme: context.scheme,
      selectedButtonText: selectedButtonText,
      onClick: (button) {
        setState(() {
          selectedButtonText = button;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            if (questionPattern != null)
              questionPattern!.when(
                richText: (spans) {
                  return RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                      children: spans,
                    ),
                  );
                },
                buttons: (title, options) {
                  return Column(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 20),
                      ...options.map(
                        (option) {
                          final isSelected = isTitlesScreen
                              ? titles.contains(option)
                              : option == selectedButtonText;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isSelected
                                    ? Theme.of(context)
                                        .colorScheme
                                        .primaryContainer
                                    : Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                              ),
                              onPressed: () {
                                if (controller.text.isNotEmpty) {
                                  controller.clear();
                                }

                                if (isTitlesScreen) {
                                  titles.add(option);
                                  setState(() {});
                                } else {
                                  setState(() {
                                    selectedButtonText = option;
                                  });
                                }
                              },
                              child: Text(option),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 4),
                      TextButton.icon(
                        onPressed: () {
                          context
                              .read<FlowCubit>()
                              .showDiferrentAnswers(widget.currentStep);
                        },
                        label: const Text('Show me different answers'),
                        icon: const Icon(Icons.refresh),
                      ),
                      const SizedBox(height: 8),
                      const OrDivider(),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Type in your own input...',
                        ),
                        onChanged: (value) {
                          if (titles.isNotEmpty ||
                              selectedButtonText.isNotEmpty) {
                            titles.clear();
                            selectedButtonText = '';
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(height: 12),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
      bottomSheet: FlowBottomNavigationBar(
        currentStep: widget.currentStep,
        onResetPressed: resetFlow,
        onContinuePressed: () {
          final text =
              controller.text.isNotEmpty ? controller.text : selectedButtonText;
          switch (widget.flowStep.screenState) {
            case EScreenType.start:
              break;
            case EScreenType.questions:
              context
                  .read<FlowCubit>()
                  .runFlowStep(widget.currentStep + 1, text);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return FlowPage(
                      step: widget.currentStep + 1,
                    );
                  },
                ),
              );
            case EScreenType.end:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return EpisodeLenghtPage(
                      titles: titles,
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
