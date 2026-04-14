import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/Widget/WidgetSheetAdd/CirculeColor.dart';
import 'package:test/Widget/WidgetSheetAdd/notesheetform.dart';

class ListScrollColor extends StatefulWidget {
  @override
  State<ListScrollColor> createState() => _ListScrollColorState();
}

int Colorr = Colors.amber.value;
int currentState = 0;
List<Color> colors = [
  const Color(0xFFF44336),
  const Color(0xFFFFC107),
  const Color(0xFF2196F3),
  const Color(0xFF673AB7),
  const Color(0xFF8BC34A),
  const Color(0xFF3F51B5),
  const Color(0xFF795548),
  const Color(0xFFFF5722),
  Color(0xFFE91E63),
];

class _ListScrollColorState extends State<ListScrollColor> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentState = index;

              Colorr = colors[index].value;
              setState(() {});
            },
            child: circuleColor(
              color: colors[index],
              isActive: currentState == index,
            ),
          );
        },
      ),
    );
  }
}
