import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';

void main() {
  final tNoteModel = NoteModel(text: "Note 1", color: Color(Colors.green.value), date: DateTime.utc(2020, 6, 9, 21, 35, 53));
  final Map<String, dynamic> tNoteMap = {"text": "Note 1", "color": Colors.green.value, "date": "2020-06-09T21:35:53.000Z"};

  test("note model should be subclass of Note entity", () async {
    expect(tNoteModel, isA<Note>());
  });
  
  group("from map", () {
    test("should return valid model from normal map", () async {
      final result = NoteModel.fromMap(tNoteMap);
      expect(result.text, tNoteModel.text);
      expect(result.color, tNoteModel.color);
      expect(result.date, tNoteModel.date);
      //expect(result, tNoteModel);
    });
  });

  group("to map", () {
    test("should return valid map from model", () async {
      final result = tNoteModel.toMap();
      expect(result, tNoteMap); 
    });
    // TODO: add more tests for edge cases
  });
}