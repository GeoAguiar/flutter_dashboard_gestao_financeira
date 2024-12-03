import 'package:flutter/material.dart';

class LayoutResponsivo extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;

  const LayoutResponsivo({
    required this.desktop,
    required this.mobile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
