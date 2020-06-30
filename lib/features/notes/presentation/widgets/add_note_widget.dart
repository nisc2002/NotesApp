import 'package:flutter/material.dart';

class AddNoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      //key: ,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Note"),
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }
}
