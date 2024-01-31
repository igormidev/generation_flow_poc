import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/core/context_extensions.dart';
import 'package:generation_flow_poc/logic/cubits/theme_cubit.dart';
import 'package:generation_flow_poc/ui/lotties/configurations_lottie.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        context.read<ThemeCubit>().state.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 40),
          const ConfigurationsLottie(),
          const SizedBox(height: 32),
          ListTile(
            title: const Text('Brightness mode'),
            subtitle: Text(
              isDarkMode ? 'Dark mode is enabled' : 'Light mode is enabled',
            ),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (isSwitchingToDark) {
                if (isSwitchingToDark) {
                  context.read<ThemeCubit>().setBrightness(Brightness.dark);
                } else {
                  context.read<ThemeCubit>().setBrightness(Brightness.light);
                }
              },
            ),
          ),
          const Divider(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              'App color theme:',
              style: context.texts.titleLarge,
            ),
          ),
          const SizedBox(height: 8),
          GridView.extent(
            shrinkWrap: true,
            maxCrossAxisExtent: 50,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            physics: const NeverScrollableScrollPhysics(),
            children: const <Color>[Colors.black, Colors.white]
                .followedBy(Colors.primaries.reversed)
                .followedBy(Colors.accents)
                .where(_removeBlackAndWhite)
                .map(ColorOption.fromColor)
                .toList(growable: false),
          ),
        ],
      ),
    );
  }

  bool _removeBlackAndWhite(Color color) =>
      color != Colors.black && color != Colors.white;
}

class ColorOption extends StatelessWidget {
  const ColorOption({
    super.key,
    required this.color,
  });

  factory ColorOption.fromColor(Color color) => ColorOption(color: color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ThemeCubit>();
    final isSelected = bloc.state.seedColor == color;

    return InkWell(
      onTap: () {
        bloc.setSeedColor(color);
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isSelected)
              CircleAvatar(
                backgroundColor: context.scheme.inverseSurface,
                radius: 20,
              ),
            CircleAvatar(
              backgroundColor: color,
              radius: isSelected ? 16 : 20,
            ),
            if (isSelected)
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: context.scheme.inverseSurface,
                  child: Icon(
                    Icons.check,
                    color: context.scheme.surface,
                    size: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
