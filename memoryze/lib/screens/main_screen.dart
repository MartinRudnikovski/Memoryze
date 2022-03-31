import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memoryze/models/memoryze_appointment.dart';
import 'package:memoryze/models/notifications.dart';
import 'package:memoryze/widgets/appointment_list_widget.dart';
import 'package:memoryze/widgets/costum_calendar_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'add_appointment_screen.dart';

List<Appointment> getAppointmentsFromStorage(){
  return Hive.box('appointments').values.map((e) => (e as MemoryzeAppointment).toAppointment()).toList();
}

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainScreenState();

}

class MainScreenState extends State<MainScreen>{

  Calendar calendar = Calendar(appointments: getAppointmentsFromStorage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memoryze'),
        backgroundColor: Colors.red.shade900,
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.red.shade900,
        onPressed: () async{
          Appointment? a = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAppointmentScreen(),
            )
          );

          if(a != null){
            await Hive.box('appointments').add(MemoryzeAppointment(
                title: a.subject,
                year: a.startTime.year,
                month: a.startTime.month,
                day: a.startTime.day,
                sHour: a.startTime.hour,
                sMinute: a.startTime.minute,
                eHour: a.endTime.hour,
                eMinute: a.endTime.minute,
                description: a.notes,
                location: a.location
            ));

            createScheduledNotification(a);
          }
        },
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: Hive.box('appointments').listenable(),
            builder:(context, box, widget){
              return Calendar(appointments: getAppointmentsFromStorage());
            },
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: AppointmentListWidget(appointments: getAppointmentsFromStorage()),
          ),
        ],
      ),
    );
  }

}