import 'package:flutter/material.dart';

/// This widget is used to delay the appearance of a widget.
/// This is util when you don't wan't to start loading a heavy widget
/// during the initial build of a screen after a navigation.
///
/// So that widget will build later alone without competing resources with
/// other widgets.
class SizedBoxApearDelay extends StatefulWidget {
  final double? width;
  final double? height;
  final Widget child;
  final Duration duration;
  const SizedBoxApearDelay({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<SizedBoxApearDelay> createState() => _SizedBoxApearDelayState();
}

class _SizedBoxApearDelayState extends State<SizedBoxApearDelay> {
  bool _isSizedBoxVisible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(widget.duration, () {
      if (context.mounted) {
        setState(() {
          _isSizedBoxVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Visibility(
        visible: _isSizedBoxVisible,
        child: widget.child,
      ),
    );
  }
}
