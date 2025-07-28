import 'package:flutter/material.dart';

class MainContent extends StatelessWidget {
  final Widget child;
  const MainContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final slide = Tween<Offset>(
          begin: const Offset(0, -1), // Slide in from top
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: slide, child: child),
        );
      },
      child: child,
    );
  }
}
