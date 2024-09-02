import 'package:flutter/material.dart';

/// Fades child in by duration.
class FadeWrapper extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const FadeWrapper({
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    super.key,
  });

  @override
  State<FadeWrapper> createState() => _FadeWrapperState();
}

class _FadeWrapperState extends State<FadeWrapper> with TickerProviderStateMixin {
  late AnimationController _fadeController;

  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(vsync: this, duration: widget.duration);

    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(_fadeController);

    _fadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();

    super.dispose();
  }
}
