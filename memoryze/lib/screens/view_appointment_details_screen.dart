import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoryze/widgets/unselectable_text_box.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ViewAppointmentDetailsScreen extends StatefulWidget{
  const ViewAppointmentDetailsScreen({Key? key, required this.appointment}) : super(key: key);

  final Appointment appointment;

  @override
  State<StatefulWidget> createState() {
    return _ViewAppointmentDetailsScreen();
  }
}

class _ViewAppointmentDetailsScreen extends State<ViewAppointmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title: Text(
          widget.appointment.subject.length > 15 ?
          widget.appointment.subject.substring(0, 15) :
          widget.appointment.subject
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          UnselectableTextBox(
            text: widget.appointment.subject
          ),
          UnselectableTextBox(
            text: widget.appointment.startTime.day.toString() + '.' +
                widget.appointment.startTime.month.toString() + '.' +
                widget.appointment.startTime.year.toString() + ' ' +
                widget.appointment.startTime.hour.toString() + ':' +
                widget.appointment.startTime.minute.toString(),
          ),
          UnselectableTextBox(
            text: widget.appointment.endTime.day.toString() + '.' +
                widget.appointment.endTime.month.toString() + '.' +
                widget.appointment.endTime.year.toString() + ' ' +
                widget.appointment.endTime.hour.toString() + ':' +
                widget.appointment.endTime.minute.toString(),
          ),
          UnselectableTextBox(
              text: widget.appointment.notes != null ? widget.appointment.notes.toString() : 'no description'
          ),
        ],
      ),
    );
  }
}