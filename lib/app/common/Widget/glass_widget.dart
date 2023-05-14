import 'dart:ui';

import 'package:chat_gpt_flutter/app/common/Constant/colors.dart';
import 'package:flutter/material.dart';

class Glass extends StatelessWidget {
  const Glass({super.key, required this.child});
  final Widget child;

  get primaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: child,
          ),
        ),
      ),
    );
  }
}
