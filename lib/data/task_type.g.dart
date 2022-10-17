// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TskeTypeAdapter extends TypeAdapter<TskeType> {
  @override
  final int typeId = 2;

  @override
  TskeType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TskeType(
      fields[0] as String,
      fields[1] as String,
      fields[2] as TaskTypeEnum,
    );
  }

  @override
  void write(BinaryWriter writer, TskeType obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.taskTypeEnum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TskeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
