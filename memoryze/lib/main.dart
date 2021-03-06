import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:memoryze/models/memoryze_appointment.dart';
import 'screens/main_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MemoryzeAppointmentAdapter());

  AwesomeNotifications().initialize('', [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      defaultColor: Colors.deepOrange,
      importance: NotificationImportance.High,
      channelShowBadge: true,
      channelDescription: '',
    ),
    NotificationChannel(
      channelKey: 'scheduled_channel',
      channelName: 'Scheduled Notifications',
      defaultColor: Colors.deepOrange,
      locked: true,
      importance: NotificationImportance.High,
      channelShowBadge: true,
      channelDescription: '',

    )
  ],);

  runApp(const Memoryze());
}

class Memoryze extends StatefulWidget{
  const Memoryze({Key? key}) : super(key: key);

  @override
  State<Memoryze> createState() => _MemoryzeState();
}

class _MemoryzeState extends State<Memoryze> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memoryze',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Colors.red.shade900
      ),
      home: FutureBuilder(
        future: Hive.openBox('appointments'),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState == ConnectionState.done){

            if (snapshot.hasError){
              return Text(snapshot.error.toString());
            }

            else{

              return const MainScreen();
            }
          }

          else{
            return const Scaffold();
          }
        },
      ),
    );
  }

  @override
  void dispose() {

    Hive.close();
    super.dispose();
  }
}