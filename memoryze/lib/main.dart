import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'screens/main_screen.dart';

void main() => runApp(const Memoryze());

class Memoryze extends StatelessWidget{
  const Memoryze({Key? key}) : super(key: key);

  static final List<Appointment> appointments = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memoryze',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}