import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/core/app_theme.dart';
import 'package:generation_flow_poc/data/interfaces/i_generator_service.dart';
import 'package:generation_flow_poc/data/repositories/flow_repository.dart';
import 'package:generation_flow_poc/data/services/mock_generator_service.dart';
import 'package:generation_flow_poc/logic/cubits/flow_cubit.dart';
import 'package:generation_flow_poc/logic/cubits/theme_cubit.dart';
import 'package:generation_flow_poc/logic/states/theme_state.dart';
import 'package:generation_flow_poc/ui/pages/flow_page.dart';

bool isDevicePreviewEnables = false;

void main() {
  if (isDevicePreviewEnables) {
    runApp(
      DevicePreview(
        enabled: isDevicePreviewEnables,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        RepositoryProvider<IGeneratorService>(
          create: (context) => MockGeneratorService(),
          // create: (context) => GeneratorService(),
        ),
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
            builder: isDevicePreviewEnables ? DevicePreview.appBuilder : null,
            title: 'Flutter Demo',
            theme: getTheme(state, context),
            // home: const StartPage(),
            scrollBehavior: ScrollConfiguration.of(context).copyWith(
              physics: const BouncingScrollPhysics(),
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
              },
            ),
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
