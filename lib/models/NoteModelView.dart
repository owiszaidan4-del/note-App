import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'NoteModelView.g.dart';

@HiveType(typeId: 0) //هاض بحدد نوع ال هايف
class Notemodelview extends HiveObject {
  @HiveField(0)
  final String Title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final int color;

  Notemodelview({
    required this.Title,
    required this.content,
    required this.time,
    required this.color,
  });
}
