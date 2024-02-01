import 'package:flutter/material.dart';
import 'package:generation_flow_poc/core/constants.dart';
import 'package:lottie/lottie.dart';

class NextIndicatorIcon extends StatelessWidget {
  const NextIndicatorIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primaryContainer,
        BlendMode.modulate,
      ),
      child: Lottie.asset(
        Constants.i.lottie.doubleArrow,
        width: 32,
        height: 32,
      ),
    );
  }
}
