// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hivedb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class bookmarkedAdapter extends TypeAdapter<bookmarked> {
  @override
  final int typeId = 0;

  @override
  bookmarked read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return bookmarked(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, bookmarked obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is bookmarkedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
