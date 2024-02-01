import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/logic/cubits/flow_cubit.dart';
import 'package:generation_flow_poc/ui/components/next_indicator_icon.dart';
import 'package:generation_flow_poc/ui/pages/flow_page.dart';

class FlowBottomNavigationBar extends StatelessWidget {
  final int currentStep;
  final void Function() onResetPressed;
  final void Function() onContinuePressed;
  const FlowBottomNavigationBar({
    super.key,
    required this.onContinuePressed,
    required this.currentStep,
    required this.onResetPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FilledButton(
              onPressed: onContinuePressed,
              child: const Text('Continue'),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              context.read<FlowCubit>().runFlowStep(
                  currentStep + 1, 'Take me straight to possible titles');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FlowPage(step: currentStep + 1);
              }));
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            icon: const NextIndicatorIcon(),
            label: const Text('Skip to titles'),
          ),
        ],
      ),
    );
  }
}
