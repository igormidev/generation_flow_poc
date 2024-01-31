import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/core/constants.dart';
import 'package:generation_flow_poc/logic/cubits/theme_cubit.dart';
import 'package:generation_flow_poc/ui/elements/sized_box_apear_delay.dart';
import 'package:lottie/lottie.dart';

class ConfigurationsLottie extends StatelessWidget {
  const ConfigurationsLottie({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final primaryContainer = Theme.of(context).colorScheme.primaryContainer;
    final onPrimaryContainer = Theme.of(context).colorScheme.onPrimaryContainer;

    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final secondaryContainer = Theme.of(context).colorScheme.secondaryContainer;
    final onSecondaryContainer =
        Theme.of(context).colorScheme.onSecondaryContainer;

    final tertiaryColor = Theme.of(context).colorScheme.tertiary;
    final tertiaryContainer = Theme.of(context).colorScheme.tertiaryContainer;

    final isDarkMode =
        context.read<ThemeCubit>().state.brightness == Brightness.dark;

    return SizedBoxApearDelay(
      height: 200,
      duration: const Duration(milliseconds: 600),
      child: Center(
        child: Transform.scale(
          scale: 2,
          child: Lottie.asset(
            Constants.i.lottie.configurations,
            fit: BoxFit.fitWidth,
            width: 200,
            delegates: LottieDelegates(
              values: [
                /// Bars
                ValueDelegate.color(
                  ['**', 'Ebene 2', '**'],
                  value: primaryColor,
                ),
                ValueDelegate.color(
                  ['**', 'Ebene 3', '**'],
                  value: primaryContainer,
                ),
                ValueDelegate.color(
                  ['**', 'Ebene 4', '**'],
                  value: secondaryColor,
                ),
                ValueDelegate.color(
                  ['**', 'Ebene 16', '**'],
                  value: secondaryContainer,
                ),
                ValueDelegate.color(
                  ['**', 'Ebene 5', '**'],
                  value: tertiaryColor,
                ),
                ValueDelegate.color(
                  ['**', 'Ebene 6', '**'],
                  value: tertiaryContainer,
                ),

                /// Clothes
                ...<int>[5, 18, 19].map((e) {
                  return ValueDelegate.color(
                    ['**', 'Ebene 1', 'Gruppe $e', '**'],
                    value: primaryColor,
                  );
                }).toList(),

                // Hair
                ValueDelegate.color(
                  ['**', 'Ebene 1', 'Gruppe 15', '**'],
                  value: isDarkMode ? secondaryColor : onSecondaryContainer,
                ),

                // Border
                ValueDelegate.strokeColor(
                  ['**', 'Ebene 12', '**'],
                  value: isDarkMode ? onPrimaryContainer : tertiaryColor,
                ),
                ValueDelegate.strokeColor(
                  ['**', 'Ebene 7', '**'],
                  value: isDarkMode ? onPrimaryContainer : tertiaryColor,
                ),
                ValueDelegate.color(
                  ['**', 'Ebene 11', '**'],
                  value: primaryColor,
                ),
                ValueDelegate.color(
                  ['**', 'Ebene 10', '**'],
                  value: secondaryColor,
                ),
                ValueDelegate.color(
                  ['**', 'Ebene 9', '**'],
                  value: tertiaryColor,
                ),
              ],
            ),
          ),
        ),
      ).animate().scale(),
    );
  }
}
