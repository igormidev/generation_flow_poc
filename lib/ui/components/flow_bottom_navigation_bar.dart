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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: onResetPressed,
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            elevation: 0,
            child: const Icon(
              Icons.refresh_outlined,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.55,
            ),
            child: FilledButton(
              onPressed: onContinuePressed,
              child: const Text('Continue'),
            ),
          ),
          SizedBox(
            width: 54,
            height: 54,
            child: OutlinedButton(
              onPressed: () {
                context
                    .read<FlowCubit>()
                    .runFlowStep(currentStep + 1, 'Skip to Titles');
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FlowPage(step: currentStep + 1);
                }));
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: const NextIndicatorIcon(),
            ),
          ),
        ],
      ),
    );
  }
}
