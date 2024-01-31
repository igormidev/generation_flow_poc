import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/data/models/flow_step.dart';
import 'package:generation_flow_poc/logic/cubits/flow_cubit.dart';
import 'package:generation_flow_poc/logic/states/flow_state.dart';
import 'package:generation_flow_poc/ui/components/page_shimmer_loading.dart';
import 'package:generation_flow_poc/ui/pages/question_page.dart';
import 'package:generation_flow_poc/ui/pages/start_page.dart';

class FlowPage extends StatefulWidget {
  final int step;
  const FlowPage({
    super.key,
    required this.step,
  });

  @override
  State<FlowPage> createState() => _FlowPageState();
}

class _FlowPageState extends State<FlowPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlowCubit, FlowState>(
      builder: (context, state) {
        final pageFlow = state.history[widget.step];
        if (pageFlow == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const SafeArea(
              child: PageShimmerLoading(),
            ),
          );
        }

        return switch (pageFlow.screenState) {
          EScreenType.start => StartPage(
              currentStep: widget.step,
              flowStep: pageFlow,
            ),
          EScreenType.questions => QuestionsPage(
              currentStep: widget.step,
              flowStep: pageFlow,
            ),
          EScreenType.end => QuestionsPage(
              currentStep: widget.step,
              flowStep: pageFlow,
            ),
        };
      },
    );
  }
}
