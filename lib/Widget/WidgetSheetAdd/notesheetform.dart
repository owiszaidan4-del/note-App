import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test/Static.dart';
import 'package:test/Widget/WidgetSheetAdd/AddButomWidget.dart';
import 'package:test/Widget/WidgetSheetAdd/CirculeColor.dart';
import 'package:test/Widget/WidgetSheetAdd/ListScrollColor.dart';
import 'package:test/Widget/customTextFieldWidget.dart';
import 'package:test/cubits/cubitFeatchNote.dart';
import 'package:test/cubits/cubit_noteModel/noteAdd_cubit.dart';
import 'package:test/models/NoteModelView.dart';

class Notesheetform extends StatefulWidget {
  const Notesheetform({super.key});

  @override
  State<Notesheetform> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<Notesheetform> {
  String? title;
  String? content;

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    textEditingController.dispose();
    textEditingController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: globalKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            customTextField(
              textEditingController: textEditingController,
              Hint: "Title",
              hight: 20,
              validat: (value) {
                if (value?.isEmpty ?? true) {
                  return "field is requerd";
                } else {
                  title = value;
                  return null;
                }
              },
            ),
            customTextField(
              textEditingController: textEditingController2,
              Hint: "Content",
              hight: 50,
              validat: (value) {
                if (value?.isEmpty ?? true) {
                  return "field is requerd";
                } else {
                  content = value;
                  return null;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 20, left: 8),
              child: ListScrollColor(),
            ),
            AddBoutom(
              ontap: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  var curentdate = DateTime.now();
                  var dateFormate = DateFormat.yMd().format(curentdate);
                  BlocProvider.of<NoteaddCubit>(context).Addnote(
                    Notemodelview(
                      Title: title ?? "",
                      content: content ?? "",
                      time: dateFormate,
                      color: circuleColor.ColorNote ?? kColorTextsheets.value,
                    ),
                  );
                  BlocProvider<Cubitfeatchnote>(
                    create: (context) => Cubitfeatchnote(),
                    child: BlocProvider.of<Cubitfeatchnote>(
                      context,
                    ).WhenAddNote(),
                  );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
