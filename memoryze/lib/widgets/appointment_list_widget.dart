import 'package:flutter/cupertino.dart';
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
    return ListView.builder(
      itemCount: widget.appointments.length,
      shrinkWrap: true,
      itemBuilder: (contx, index){
        return AppointmentItemWidget(appointment: widget.appointments[index],);
      }
    );
  }
}