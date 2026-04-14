import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Widget/WidgetHomeVew/noteContaenar_widget.dart';
import 'package:test/cubits/cubitFeatchNote.dart';
import 'package:test/cubits/cubit_noteModel/StatesFetchnote.dart';

class NoteListBuilder extends StatelessWidget {
  const NoteListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Cubitfeatchnote, Statesfetchnote>(
      listener: (context, state) {
        if (state is noteFieledStatee) {
          debugPrint("Error: ${state.e}");
        }
      },
      builder: (context, state) {
        var p = state is EditeDoneStatee;
        if (state is noteSucsesStatee || p) {
          final notes = state is noteSucsesStatee
              ? state.model_List
              : (state as EditeDoneStatee).model_List;
          return Stack(
            children: [
              ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NotecontaenarWidget(
                    navigator: () {
                      Navigator.pushNamed(
                        context,
                        "editNote",
                        arguments: [notes[index], index],
                      );
                    },
                    deleteNote: () async {
                      await BlocProvider.of<Cubitfeatchnote>(
                        context,
                      ).DelteCoustomNote(index: index);
                    },
                    color: Color(notes[index].color),
                    note: notes[index].content,
                    title: notes[index].Title,
                    time: notes[index].time,
                  );
                },
              ),
              if (state is EditeDoneStatee)
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Editing is done",
                        style: TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }

        return const Center(child: Text("no data"));
      },
    );
  }
}
