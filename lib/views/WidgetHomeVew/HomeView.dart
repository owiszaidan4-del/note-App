import 'package:flutter/material.dart';
import 'package:test/Widget/WidgetHomeVew/NoteListBuilder.dart';
import 'package:test/Widget/WidgetSheetAdd/addNewNote.dart';
import 'package:test/Widget/coustomAppBarrWidget.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNewNote();
            },
          );
        },
        backgroundColor: Colors.blue,

        child: Icon(Icons.add),
      ),
      appBar: AppBarrMethod(
        title: "Notes",
        icon: Icon(Icons.search),
        onpressedIcon: () {},
      ),

      body: NoteListBuilder(),
    );
  }
}
