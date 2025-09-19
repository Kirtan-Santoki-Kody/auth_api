// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokensModelAdapter extends TypeAdapter<TokensModel> {
  @override
  final int typeId = 0;

  @override
  TokensModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokensModel(
      accessToken: fields[0] as String?,
      refreshToken: fields[1] as String?,
      tokenType: fields[2] as String?,
      expiresIn: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TokensModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.tokenType)
      ..writeByte(3)
      ..write(obj.expiresIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokensModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
