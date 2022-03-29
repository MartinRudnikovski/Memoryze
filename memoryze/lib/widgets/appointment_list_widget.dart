import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:memoryze/models/memoryze_appointment.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'appointment_item_widget.dart';

class AppointmentListWidget extends StatefulWidget{
  const AppointmentListWidget({Key? key, required this.appointments}) : super(key: key);

  final List<Appointment> appointments;

  @override
  State<StatefulWidget> createState() {
    return _AppointmentListWidget();
  }

}

class _AppointmentListWidget extends State<AppointmentListWidget> {
  @override
  Widget build(BuildContext context) {
    return WatchBoxBuilder(
        box: Hive.box('appointments'),
        builder: (context, box){
          return ListView.builder(
              itemCount: Hive.box('appointments').length,
              shrinkWrap: true,
              itemBuilder: (contx, index){
                return AppointmentItemWidget(appointment: (Hive.box('appointments').getAt(index) as MemoryzeAppointment).toAppointment(), index: index,);
              }
          );
        }
    );
  }
}