import 'package:test/models/NoteModelView.dart';

class Statesfetchnote {}

class noteInitStatee extends Statesfetchnote {}

class noteSucsesStatee extends Statesfetchnote {
  final List<Notemodelview> model_List;

  noteSucsesStatee(this.model_List);
}

class noteFieledStatee extends Statesfetchnote {
  String e;
  noteFieledStatee({required this.e});
}

class noteLodingStatee extends Statesfetchnote {}

class EditeDoneStatee extends Statesfetchnote {
  final List<Notemodelview> model_List;

  EditeDoneStatee(this.model_List);
}
