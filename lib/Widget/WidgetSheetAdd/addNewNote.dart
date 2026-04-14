import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:test/Widget/WidgetSheetAdd/notesheetform.dart';

import 'package:test/cubits/cubit_noteModel/noteAdd_cubit.dart';
import 'package:test/cubits/cubit_noteModel/noteAdd_state.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
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
    return BlocProvider(
      create: (context) => NoteaddCubit(),
      child: BlocConsumer<NoteaddCubit, NoteaddStates>(
        builder: (context, state) {
          // bool isLoding=false;
          return ModalProgressHUD(
            inAsyncCall: state is noteLodingState ? true : false,
            child: Notesheetform(),
          );
        },
        listener: (context, state) {
          if (state is noteSucsesState) {
            Navigator.pop(context);
          } else if (state is noteFieledState) {
            print("error${state.e}");
          }
        },
      ),
    );
  }
}
