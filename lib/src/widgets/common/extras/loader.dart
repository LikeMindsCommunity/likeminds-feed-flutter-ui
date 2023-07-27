import 'package:flutter/material.dart';

class LMLoader extends StatelessWidget {
  final bool isPrimary;

  const LMLoader({super.key, this.isPrimary = true});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: isPrimary ? Theme.of(context).primaryColor : Colors.white,
    );
  }
}
