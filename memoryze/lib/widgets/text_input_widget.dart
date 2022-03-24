import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget{
  TextInput({Key? key, required this.hint}) : super(key: key);
  String text = '';
  String getDescription() => text;
  final String hint;
  @override
  State<StatefulWidget> createState() {
    return _TextInput();
  }

}

class _TextInput extends State<TextInput>{



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 360,
          height: 30,
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: TextField(
            decoration: InputDecoration(hintText: widget.hint),
            onChanged: (text) => widget.text = text,
            textInputAction: TextInputAction.next,
          ),
        )
      ],
    );
  }
}