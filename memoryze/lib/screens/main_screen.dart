
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoryze/widgets/costum_calendar_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../main.dart';
import 'add_appointment_screen.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainScreenState();

}

class MainScreenState extends State<MainScreen>{

  Calendar calendar = Calendar(appointments: Memoryze.appointments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memoryze'),
        backgroundColor: Colors.red,
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async{
          Appointment a = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddAppointmentScreen(),
            )
          );

          print(a.startTime);
          setState(() {
            Memoryze.appointments.add(a);
          });
          calendar = Calendar(appointments: Memoryze.appointments);
        },
      ),

      body: Column(
        children: [
          calendar,
        ],
      ),
    );
  }

}