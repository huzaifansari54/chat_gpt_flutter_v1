// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_image_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteImageModelAdapter extends TypeAdapter<FavoriteImageModel> {
  @override
  final int typeId = 0;

  @override
  FavoriteImageModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteImageModel(
      url: fields[4] as String,
      image: fields[1] as String,
      prompt: fields[2] as String,
      createdAt: fields[3] as num,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteImageModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.prompt)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteImageModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
