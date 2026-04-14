part of 'NoteModelView.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotemodelviewAdapter extends TypeAdapter<Notemodelview> {
  @override
  final int typeId = 0;

  @override
  Notemodelview read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notemodelview(
      Title: fields[0] as String,
      content: fields[1] as String,
      time: fields[2] as String,
      color: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Notemodelview obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.Title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotemodelviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
