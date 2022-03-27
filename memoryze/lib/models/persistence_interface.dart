import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../main.dart';

//@TODO Finish persistence implementation

class LocalPersistence{
  

  static const String numberOfAppointments = 'numberOfAppointments';
  static const String titles = 'titles';
  static const String descriptions = 'descriptions';
  static const String dates = 'dates';
  static const String times = 'times';
  static const String locations = 'locations';
  
  void save(Appointment appointment) async{
    final prefs = await SharedPreferences.getInstance();

    //prefs.getStringList(titles) != null

    //prefs.setStringList(ti, value)
  }

  void setup() async{
    final prefs = await SharedPreferences.getInstance();

    final int? n = prefs.getInt(LocalPersistence.numberOfAppointments) ?? -1;

    if( n != null && n > 0){
      List<String>? titles = prefs.getStringList(LocalPersistence.titles);
      List<String>? descriptions = prefs.getStringList(LocalPersistence.descriptions);
      List<String>? dates = prefs.getStringList(LocalPersistence.dates);
      List<String>? times = prefs.getStringList(LocalPersistence.times);
      List<String>? locations = prefs.getStringList(LocalPersistence.locations);

      for(int i = 0; i<n; i++){

        if (dates!.any((element) => element.contains(titles![i])) &&
            times!.any((element) => element.contains(titles![i])) ){

          //dmy = Day Month Year
          List<String> dmy = dates.firstWhere((element) => element.contains(titles![i])).split('.');
          //hm = Hour Minute
          List<String> hm= times.firstWhere((element) => element.contains(titles![i])).split('.');
          List<String> description = descriptions!.firstWhere((element) => element.contains(titles![i])).split('.');
          List<String> location = locations!.firstWhere((element) => element.contains(titles![i])).split('.');
          Memoryze.appointments.add(
              Appointment(
                startTime: DateTime(
                  int.parse(dmy[3]),
                  int.parse(dmy[2]),
                  int.parse(dmy[1]),
                  int.parse(hm[1]),
                  int.parse(hm[2]),
                ),
                endTime: DateTime(
                  int.parse(dmy[3]),
                  int.parse(dmy[2]),
                  int.parse(dmy[1]),
                  int.parse(hm[3]),
                  int.parse(hm[4]),
                ),
                color: Colors.red.shade900,
                subject: titles![i],
                notes: description[1],
                location: location[1],
              )
          );
        }
      }
    }

    else{
      prefs.setStringList(titles, []);
      prefs.setStringList(descriptions, []);
      prefs.setStringList(dates, []);
      prefs.setStringList(times, []);
      prefs.setStringList(locations, []);
      prefs.setInt(numberOfAppointments, 0);
    }
  }

  
}