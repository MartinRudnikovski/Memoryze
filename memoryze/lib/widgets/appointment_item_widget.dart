import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoryze/screens/view_appointment_details_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentItemWidget extends StatefulWidget{
  const AppointmentItemWidget({Key? key, required this.appointment, required this.index}) : super(key: key);

  final Appointment appointment;
  final int index;

  @override
  State<StatefulWidget> createState() {
    return _AppointmentItemWidget();
  }

}

class _AppointmentItemWidget  extends State<AppointmentItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.appointment.subject.length > 15 ?
                widget.appointment.subject.substring(0, 15) + '...' : widget.appointment.subject,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                ),
              ),

              Text(
                widget.appointment.startTime.day.toString() + '.'
                    + widget.appointment.startTime.month.toString() + '.'
                    + widget.appointment.startTime.year.toString() + ' '
                    + (widget.appointment.startTime.hour.toString() == '0' ? '00' : widget.appointment.startTime.hour.toString()) + ':'
                    + (widget.appointment.startTime.minute.toString() == '0' ? '00' : widget.appointment.startTime.minute.toString()),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900
                ),
              ),
              Text(
                (widget.appointment.startTime.hour.toString() == '0' ? '00' : widget.appointment.startTime.hour.toString()) + ':' +
                (widget.appointment.startTime.minute.toString() == '0' ? '00' : widget.appointment.startTime.minute.toString()),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (cont) => ViewAppointmentDetailsScreen(
                          appointment: widget.appointment,
                          index: widget.index,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'View',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}