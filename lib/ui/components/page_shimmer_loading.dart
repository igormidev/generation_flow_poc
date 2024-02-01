import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PageShimmerLoading extends StatelessWidget {
  const PageShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: const Column(
        children: [
          _GreyContainer(width: double.infinity),
          SizedBox(height: 16),
          Row(children: [
            Expanded(
              child: _GreyContainer(width: double.infinity),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _GreyContainer(width: double.infinity),
            ),
          ]),
          SizedBox(height: 16),
          Row(children: [
            Expanded(
              flex: 4,
              child: _GreyContainer(width: double.infinity),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _GreyContainer(width: double.infinity),
            ),
          ]),
          SizedBox(height: 16),
          Row(children: [
            Expanded(
              flex: 4,
              child: _GreyContainer(width: double.infinity),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 6,
              child: _GreyContainer(width: double.infinity),
            ),
          ]),
          SizedBox(height: 16),
          _GreyContainer(width: double.infinity, height: 120),
          SizedBox(height: 16),
          _GreyContainer(width: double.infinity, height: 70),
          SizedBox(height: 16),
          Row(children: [
            Expanded(
              flex: 2,
              child: _GreyContainer(width: double.infinity),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: _GreyContainer(width: double.infinity),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: _GreyContainer(width: double.infinity),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: _GreyContainer(width: double.infinity),
            ),
          ]),
        ],
      )
          .animate(
            delay: 1500.ms,
            onPlay: (controller) => controller.repeat(),
          )
          .shimmer(delay: 1500.milliseconds),
    );
  }
}

class _GreyContainer extends StatelessWidget {
  final double width;
  final double height;
  const _GreyContainer({
    required this.width,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
    );
  }
}
