import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Static.dart';
import 'package:test/cubits/cubitFeatchNote.dart';
import 'package:test/models/NoteModelView.dart';
import 'package:test/observes/noteAddObserve.dart';

import 'package:test/views/HomeView.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test/views/editNoteView.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = Noteaddobserve();
  Hive.registerAdapter(NotemodelviewAdapter());
  await Hive.openBox<Notemodelview>(kNote_box);

  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => Cubitfeatchnote())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {"editNote": (context) => Editnoteview()},

        home: Homeview(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
