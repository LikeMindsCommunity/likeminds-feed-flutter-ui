import 'package:flutter/material.dart';

class LMLoader extends StatelessWidget {
  final bool isPrimary;
  final Color? color;

  const LMLoader({super.key, this.isPrimary = true, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? (isPrimary ? Theme
          .of(context)
          .primaryColor : Colors.white),
    );
  }
}
