import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class circuleColor extends StatelessWidget {
  final Color color;
  final bool isActive;
  static int? ColorNote;
  const circuleColor({super.key, required this.color, required this.isActive});
  @override
  Widget build(BuildContext context) {
    if (isActive) {
      ColorNote = color.value;
    }
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 38,
            child: CircleAvatar(backgroundColor: color, radius: 36),
          )
        : CircleAvatar(backgroundColor: color, radius: 36);
  }
}
