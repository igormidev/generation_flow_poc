import 'package:flutter/material.dart';

class RestartFlowButton extends StatelessWidget {
  final void Function() onResetPressed;
  const RestartFlowButton({
    super.key,
    required this.onResetPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onResetPressed,
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      child: const Icon(
        Icons.keyboard_double_arrow_left_rounded,
        size: 36,
      ),
    );
  }
}
