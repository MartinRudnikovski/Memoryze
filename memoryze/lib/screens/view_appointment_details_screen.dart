import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:memoryze/widgets/unselectable_text_box.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ViewAppointmentDetailsScreen extends StatefulWidget{
  const ViewAppointmentDetailsScreen({Key? key, required this.appointment, required this.index}) : super(key: key);

  final Appointment appointment;
  final int index;

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
          widget.appointment.subject
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
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

          widget.appointment.location != null ?

          SizedBox(

            width: 400,
            height: 200,

            child:
            
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(41.997345, 21.427996),
                zoom: 11.5,
              ),
              markers: {
                Marker(
                  markerId: MarkerId(widget.appointment.subject),
                  infoWindow: InfoWindow(title: widget.appointment.subject),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed
                  ),
                  position: LatLng(
                    double.parse(widget.appointment.location!.split('|')[0]),
                    double.parse(widget.appointment.location!.split('|')[1]),
                  ),
                )
              },
              myLocationButtonEnabled: true,
              mapToolbarEnabled: false,


            ),
          )
          :
          const UnselectableTextBox(text: 'no location provided.'),

          ElevatedButton(

            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
            ),
            onPressed: () async{
              print(widget.appointment.id.toString());
              await Hive.box('appointments').deleteAt(widget.index);
              setState((){});
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }
}