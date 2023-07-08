import 'dart:ui';

import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {

  final Widget child;

  const GlassBox({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.2),
          child: child,
        ),
      ),
    );
  }
}