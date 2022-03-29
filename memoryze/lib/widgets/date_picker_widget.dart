import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget{
  DatePicker({Key? key, required this.hint}) : super(key: key);

  final String hint;
  final TextEditingController controller = TextEditingController();
  DateTime date = DateTime(1999); // instead of null


  String getDateString() => controller.text;
  DateTime getDate() => date;


  @override
  State<StatefulWidget> createState() {
    return _DatePicker();
  }

}

class _DatePicker extends State<DatePicker>{

  void editDate() async{
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (dateTime != null){
      setState(() {
        widget.date = dateTime;
        widget.controller.text = dateTime.day.toString() + '.' + dateTime.month.toString() + '.' + dateTime.year.toString();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              onTap: editDate,
              readOnly: true,
              enableInteractiveSelection: false,
              controller: widget.controller,
              decoration: InputDecoration(hintText: widget.hint),
            ),
          ),
        ),
      ],
    );
  }
}