import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget{
  TimePicker({Key? key, required this.hint}) : super(key: key);

  final String hint;
  final TextEditingController timeController = TextEditingController();
  TimeOfDay? time;

  TimeOfDay getTime() => time!;
  String getTimeString() => timeController.text;


  @override
  State<StatefulWidget> createState() {
    return _TimePicker();
  }
}

class _TimePicker extends State<TimePicker>{


  void editTime() async{
    TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );

    if (timeOfDay != null){
      setState(() {
        widget.time = timeOfDay;
        widget.timeController.text = timeOfDay.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10,),
            child: TextFormField(
              onTap: editTime,
              readOnly: true,
              enableInteractiveSelection: false,
              controller: widget.timeController,
              decoration: InputDecoration(hintText: widget.hint),
            ),
          ),
        ),
      ],
    );
  }
}