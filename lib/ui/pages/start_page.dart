import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generation_flow_poc/data/models/flow_step.dart';
import 'package:generation_flow_poc/logic/cubits/flow_cubit.dart';
import 'package:generation_flow_poc/logic/mixins/validators_mixins.dart';
import 'package:generation_flow_poc/ui/components/next_indicator_icon.dart';
import 'package:generation_flow_poc/ui/lotties/imagination_lottie.dart';
import 'package:generation_flow_poc/ui/pages/flow_page.dart';
import 'package:generation_flow_poc/ui/pages/settings_page.dart';

class StartPage extends StatefulWidget {
  final int currentStep;
  final FlowStep flowStep;
  const StartPage({
    super.key,
    required this.currentStep,
    required this.flowStep,
  });

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with ValidatorsMixins {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          controller.clear();
          context.read<FlowCubit>().createFlow();
          return Future.value();
        },
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    tooltip: 'Settings',
                    onPressed: () async {
                      await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const SettingsPage();
                      }));
                      controller.clear();
                      if (mounted) {
                        context.read<FlowCubit>().createFlow();
                      }
                    },
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
              const Center(child: ImaginationAnimation()),
              const SizedBox(height: 4),
              Text(
                'What are you interested in?',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Form(
                key: _form,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Type your interest...',
                  ),
                  validator: isNotEmpty,
                ),
              ),
              const SizedBox(height: 8),
              const Divider(height: 16),
              const SizedBox(height: 30),
              FilledButton(
                onPressed: () {
                  final formState = _form.currentState;
                  if (formState?.validate() != true) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all fields'),
                        ),
                      );
                    return;
                  }

                  context
                      .read<FlowCubit>()
                      .runFlowStep(widget.currentStep + 1, controller.text);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return FlowPage(step: widget.currentStep + 1);
                  }));
                },
                child: const Text('Full Creator Mode'),
              ),
              const SizedBox(height: 8),
              const OrDivider(),
              const SizedBox(height: 8),
              Directionality(
                textDirection: TextDirection.rtl,
                child: OutlinedButton.icon(
                  onPressed: () {
                    final formState = _form.currentState;
                    if (formState?.validate() != true) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields'),
                          ),
                        );
                      return;
                    }

                    context.read<FlowCubit>().runFlowStep(
                        widget.currentStep + 1,
                        'Take me straight to possible titles');
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return FlowPage(step: widget.currentStep + 1);
                    }));
                  },
                  icon: const NextIndicatorIcon(),
                  label: const Text('Just Give me Titles'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(endIndent: 8)),
        Text(
          'Or',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.outline,
                fontWeight: FontWeight.bold,
              ),
        ),
        const Expanded(child: Divider(indent: 8)),
      ],
    );
  }
}
