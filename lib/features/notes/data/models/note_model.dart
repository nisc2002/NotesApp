import 'package:flutter/material.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    @required final String text,
    @required final Color color,
    @required final DateTime date,
  }) : super(text: text, color: color, date: date);

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(text: map["text"], color: map["color"], date: map["date"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "text": text,
      "color": color,
      "date": date,
    };
  }
}