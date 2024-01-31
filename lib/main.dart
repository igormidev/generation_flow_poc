import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/core/app_theme.dart';
import 'package:generation_flow_poc/data/repositories/flow_repository.dart';
import 'package:generation_flow_poc/data/services/generator_service.dart';
import 'package:generation_flow_poc/logic/cubits/flow_cubit.dart';
import 'package:generation_flow_poc/logic/cubits/theme_cubit.dart';
import 'package:generation_flow_poc/logic/states/theme_state.dart';
import 'package:generation_flow_poc/ui/pages/flow_page.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        RepositoryProvider<GeneratorService>(
            create: (context) => GeneratorService()),
        RepositoryProvider<FlowRepository>(
          create: (context) => FlowRepository(service: context.read()),
        ),
        BlocProvider<FlowCubit>(
          create: (context) => FlowCubit(repository: context.read()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            title: 'Flutter Demo',
            theme: getTheme(state, context),
            // home: const StartPage(),
            home: const AppHome(),
          );
        },
      ),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  void initState() {
    context.read<FlowCubit>().createFlow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const FlowPage(
      step: 0,
    );
  }
}
