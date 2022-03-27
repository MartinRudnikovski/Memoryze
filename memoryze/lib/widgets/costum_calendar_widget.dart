import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment>? source) {

    if(source != null) {
      appointments = source;
    }

    else {
      appointments = <Appointment>[];
    }

  }

  void addAppointment(Appointment appointment) => appointments?.add(appointment);
}


class Calendar extends StatelessWidget{

  late final _DataSource _dataSource;

  Calendar({Key? key, List<Appointment>? appointments}) : super(key: key) {
    _dataSource = _DataSource(appointments);
  }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      firstDayOfWeek: 1,
      view: CalendarView.month,
      selectionDecoration: BoxDecoration(
        border: Border.all(
          color: Colors.red.shade900,
        ),
      ),
      dataSource: _dataSource,

      todayHighlightColor: Colors.red.shade900,

      cellBorderColor: Colors.transparent,

      showNavigationArrow: true,
      showCurrentTimeIndicator: true,
    );
  }

  void addAppointment(Appointment appointment) => _dataSource.addAppointment(appointment);
}