// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memoryze_appointment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemoryzeAppointmentAdapter extends TypeAdapter<MemoryzeAppointment> {
  @override
  final int typeId = 1;

  @override
  MemoryzeAppointment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemoryzeAppointment(
      title: fields[0] as String,
      year: fields[1] as int,
      month: fields[2] as int,
      day: fields[3] as int,
      sHour: fields[4] as int,
      sMinute: fields[5] as int,
      eHour: fields[6] as int,
      eMinute: fields[7] as int,
      description: fields[8] as String?,
      location: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MemoryzeAppointment obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.year)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.day)
      ..writeByte(4)
      ..write(obj.sHour)
      ..writeByte(5)
      ..write(obj.sMinute)
      ..writeByte(6)
      ..write(obj.eHour)
      ..writeByte(7)
      ..write(obj.eMinute)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoryzeAppointmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
