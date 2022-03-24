import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoryze/main.dart';
import 'package:memoryze/widgets/date_picker_widget.dart';
import 'package:memoryze/widgets/text_input_widget.dart';
import 'package:memoryze/widgets/time_picker_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AddAppointmentScreen extends StatefulWidget{
  const AddAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AddAppointmentScreenState();
  }
}

class AddAppointmentScreenState extends State<AddAppointmentScreen>{

  final TextInput title = TextInput(hint: 'title');
  final DatePicker date = DatePicker(hint: 'date',);
  final TimePicker startTime = TimePicker(hint: 'start time',);
  final TimePicker endTime = TimePicker(hint: 'end time',);
  final TextInput description = TextInput(hint: 'description');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memoryze'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          title,
          date,
          startTime,
          endTime,
          description,

          ElevatedButton(
            onPressed: (){
              DateTime start = date.getDate();
              TimeOfDay startT = startTime.getTime();
              start.add(Duration(hours: startT.hour, minutes: startT.minute));

              DateTime end = date.getDate();
              TimeOfDay endT = endTime.getTime();
              end.add(Duration(hours: endT.hour, minutes: endT.minute));

              Appointment a = Appointment(
                startTime: start,
                endTime: end,
                color: Colors.red,
                subject: title.getDescription(),
                notes: description.getDescription()
              );

              Navigator.pop(context, a);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}