import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

part 'memoryze_appointment.g.dart';

@HiveType(typeId: 1)
class MemoryzeAppointment {
  @HiveField(0)
  String title;

  @HiveField(1)
  int year;

  @HiveField(2)
  int month;

  @HiveField(3)
  int day;

  @HiveField(4)
  int sHour;

  @HiveField(5)
  int sMinute;

  @HiveField(6)
  int eHour;

  @HiveField(7)
  int eMinute;

  @HiveField(8)
  String? description;

  @HiveField(9)
  String? location;

  MemoryzeAppointment(
    {
      required this.title,
      required this.year,
      required this.month,
      required this.day,
      required this.sHour,
      required this.sMinute,
      required this.eHour,
      required this.eMinute,
      this.description,
      this.location
    }
  );

  Appointment toAppointment(){
    return Appointment(
      startTime: DateTime(
        this.year,
        this.month,
        this.day,
        this.sHour,
        this.sMinute
      ),
      endTime: DateTime(
        this.year,
        this.month,
        this.day,
        this.eHour,
        this.eMinute
      ),
      subject: this.title,
      notes: this.description,
      location: this.location,
    );
  }
}