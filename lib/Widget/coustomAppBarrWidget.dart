import 'package:flutter/material.dart';

PreferredSizeWidget AppBarrMethod({
  required String title,
  required Icon icon,
  required Function() onpressedIcon,
}) {
  return AppBar(
    title: Text(title, style: TextStyle(fontSize: 32)),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // color: Colors.white.withOpacity(0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.1),
          ),
          child: IconButton(iconSize: 23, onPressed: onpressedIcon, icon: icon),
        ),
      ),
    ],
  );
}
