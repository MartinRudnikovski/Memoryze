import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  
  
  //Map things
  Marker? location;
  LatLng? position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memoryze'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          title,
          date,
          startTime,
          endTime,
          description,
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(41.997345, 21.427996),
                zoom: 11.5,
              ),

              markers: { if(location != null ) location!.clone()},
              onTap: (latLng) {
                setState(() {
                  position = latLng;
                  location = Marker(
                    markerId: const MarkerId('location'),
                    infoWindow: const InfoWindow(title: 'Location'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                    position: latLng,
                  );
                });
              },
            ),
          ),


          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red.shade900),
            ),
            onPressed: (){
              DateTime start = DateTime(
                date.getDate().year,
                date.getDate().month,
                date.getDate().day,
                startTime.getTime().hour,
                startTime.getTime().minute,
              );

              DateTime end = DateTime(
                date.getDate().year,
                date.getDate().month,
                date.getDate().day,
                endTime.getTime().hour,
                endTime.getTime().minute,
              );

              Appointment a = Appointment(
                location: position != null ? position!.latitude.toString() + '|' + position!.longitude.toString() : null,
                startTime: start,
                endTime: end,
                color: Colors.red.shade900,
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