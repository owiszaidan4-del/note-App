import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/Static.dart';
import 'package:test/cubits/cubit_noteModel/noteAdd_state.dart';
import 'package:test/models/NoteModelView.dart';

class NoteaddCubit extends Cubit<NoteaddStates> {
  NoteaddCubit() : super(noteInitState());
  Addnote(Notemodelview model) async {
    emit(noteLodingState());

    try {
      var boxnote = Hive.box<Notemodelview>(kNote_box);
      await boxnote.add(model);
      emit(noteSucsesState());
    } on Exception catch (e) {
      emit(noteLodingState());
      emit(noteFieledState(e: e.toString()));
    }
  }

  getNotes() {
    //var boxnote = Hive.box<Notemodelview>(kNote_box);
  }
}
