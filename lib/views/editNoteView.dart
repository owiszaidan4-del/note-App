import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Widget/EditNoteBodyWidget.dart';
import 'package:test/cubits/cubitFeatchNote.dart';
import 'package:test/models/NoteModelView.dart';

class Editnoteview extends StatelessWidget {
  const Editnoteview({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as List;
    return Editnotebodywidget(model1: model[0], index: model[1]);
  }
}
