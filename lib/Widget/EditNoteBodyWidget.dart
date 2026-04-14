import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test/Widget/coustomAppBarrWidget.dart';
import 'package:test/Widget/customTextFieldWidget.dart';
import 'package:test/cubits/cubitFeatchNote.dart';
import 'package:test/cubits/cubit_noteModel/StatesFetchnote.dart';
import 'package:test/models/NoteModelView.dart';

// ignore: must_be_immutable
class Editnotebodywidget extends StatefulWidget {
  Editnotebodywidget({super.key, required this.model1, required this.index});
  Notemodelview model1;
  int index;

  @override
  State<Editnotebodywidget> createState() => _EditnotebodywidgetState();
}

class _EditnotebodywidgetState extends State<Editnotebodywidget> {
  String? Title;

  String? content;

  final TextEditingController textEditingController = TextEditingController();

  final TextEditingController textEditingController2 = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    log(widget.model1.Title);
    return Scaffold(
      appBar: AppBarrMethod(
        title: "Edit Note",
        icon: Icon(Icons.check),
        onpressedIcon: () {
          if (globalKey.currentState!.validate()) {
            globalKey.currentState!.save();
            BlocProvider.of<Cubitfeatchnote>(context).editNote(
              index: widget.index,
              model: Notemodelview(
                Title: Title ?? "",
                content: content ?? "",
                time: DateFormat.yMd().format(DateTime.now()),
                color: widget.model1.color,
              ),
            );
            Navigator.pop(context);
          } else {
            autovalidateMode = AutovalidateMode.always;
            setState(() {});
          }
          textEditingController.clear();
          textEditingController2.clear();
        },
      ),
      body: Form(
        key: globalKey,
        autovalidateMode: autovalidateMode,
        child: ListView(
          children: [
            customTextField(
              textEditingController: TextEditingController(
                text: widget.model1.Title,
              ),
              Hint: "Title",
              hight: MediaQuery.of(context).size.height * 0.03,
              validat: (input) {
                if (input?.isEmpty ?? true) {
                  return "this field is requerd";
                } else {
                  Title = input;
                  return null;
                }
              },
            ),
            customTextField(
              textEditingController: TextEditingController(
                text: widget.model1.content,
              ),
              Hint: "content",
              hight: MediaQuery.of(context).size.height * 0.1,
              validat: (input) {
                if (input?.isEmpty ?? true) {
                  return "this field is requerd";
                } else {
                  content = input;
                  return null;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
