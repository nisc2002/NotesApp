import 'package:flutter/material.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';

class NoteModel extends Note {
  //static 
  NoteModel({
    @required final String text,
    @required final Color color,
    @required final DateTime date,
  }) : super(text: text, color: color, date: date);

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      text: map["text"], 
      color: Color(map["color"]), 
      date: DateTime.parse(map["date"]));   // parses Iso string to DateTime
  }

  Map<String, dynamic> toMap() {
    return {
      "text": text,
      "color": color.value,
      "date": date.toIso8601String(),   // turns date into string for database
    };
  }
}
