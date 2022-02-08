// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveNewsModelAdapter extends TypeAdapter<HiveNewsModel> {
  @override
  final int typeId = 0;

  @override
  HiveNewsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveNewsModel()
      ..title = fields[0] as String
      ..summary = fields[1] as String
      ..published = fields[2] as String
      ..id = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, HiveNewsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.summary)
      ..writeByte(2)
      ..write(obj.published)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveNewsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
