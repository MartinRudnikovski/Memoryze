import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnselectableTextBox extends StatefulWidget{
  const UnselectableTextBox({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<StatefulWidget> createState() {
    return _UnselectableTextBox();
  }

}

class _UnselectableTextBox extends State<UnselectableTextBox>{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: TextField(
            decoration: InputDecoration(hintText: widget.text),
            enabled: false,
          ),
        )
      ],
    );
  }
}