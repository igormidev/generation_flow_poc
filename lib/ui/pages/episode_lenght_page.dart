import 'package:flutter/material.dart';
import 'package:generation_flow_poc/data/models/episode_time_enum.dart';
import 'package:generation_flow_poc/logic/mixins/start_flow_again_mixin.dart';

class EpisodeLenghtPage extends StatefulWidget {
  final String title;
  const EpisodeLenghtPage({
    super.key,
    required this.title,
  });

  @override
  State<EpisodeLenghtPage> createState() => _EpisodeLenghtPageState();
}

class _EpisodeLenghtPageState extends State<EpisodeLenghtPage>
    with StartFlowAgainMixin {
  EEpisodeTime? selectedEpisodeTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode lenght'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            Text(
              'How long would you like the episode to be?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ...EEpisodeTime.values.map((EEpisodeTime episode) {
              final isSelected = selectedEpisodeTime == episode;
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedEpisodeTime = episode;
                    });
                  },
                  child: Text(
                    switch (episode) {
                      EEpisodeTime.five => '5 min',
                      EEpisodeTime.ten => '10 min',
                      EEpisodeTime.twenty => '20 min',
                    },
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: resetFlow,
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              elevation: 0,
              child: const Icon(
                Icons.refresh_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed: () {
                  if (selectedEpisodeTime == null) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content: Text('Select an episode time'),
                        ),
                      );
                    return;
                  }

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('The demo is done!'),
                        content: const Text(
                          'The flow of this app is done, thank you for your time!',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              resetFlow();
                            },
                            child: const Text('Start over'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Do your magic!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
