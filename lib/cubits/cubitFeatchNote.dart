import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:hive/hive.dart';
import 'package:test/Static.dart';
import 'package:test/cubits/cubit_noteModel/StatesFetchnote.dart';

import 'package:test/models/NoteModelView.dart';

class Cubitfeatchnote extends Cubit<Statesfetchnote> {
  Cubitfeatchnote() : super(noteInitStatee()) {
    FetchAllNotes();
  }

  List<Notemodelview> models = [];
  var boxnote = Hive.box<Notemodelview>(kNote_box);

  FetchAllNotes() {
    emit(noteLodingStatee());

    try {
      List<Notemodelview> allnotes = boxnote.values.toList();

      emit(noteSucsesStatee(allnotes.reversed.toList()));
    } catch (e) {
      emit(noteLodingStatee());
      emit(noteFieledStatee(e: e.toString()));
    }
  }

  WhenAddNote() {
    FetchAllNotes();
  }

  DelteCoustomNote({required index}) async {
    var realIndex = boxnote.length - 1 - index;
    await boxnote.deleteAt(realIndex.toInt());
    FetchAllNotes();
  }

  editNote({required int index, required Notemodelview model}) async {
    log("mm");
    var realIndex = boxnote.length - 1 - index;
    try {
      await boxnote.putAt(realIndex, model);
      List<Notemodelview> allnotes = boxnote.values.toList();
      emit(EditeDoneStatee(allnotes.reversed.toList()));
      await latt();
      FetchAllNotes();
    } catch (e) {
      print(e);
    }
  }

  latt() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
