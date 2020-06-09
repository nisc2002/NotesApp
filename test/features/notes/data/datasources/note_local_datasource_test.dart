import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/features/notes/data/datasources/note_local_datasource.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  NoteLocalDataSourceImpl dataSource;
  MockDatabase mockDatabase;
  NoteModel tNoteModel;
  List<Map<String, dynamic>> tQuery;
  List<NoteModel> tNoteList;
  Color tColor;

  setUp(() {
    mockDatabase = MockDatabase();
    dataSource = NoteLocalDataSourceImpl(mockDatabase);

    tQuery = [
      {
        "id": 1,
        "text": "Note 1",
        "color": Colors.green.value,
        "date": DateTime.utc(2020, 5, 3).toIso8601String(),
      },
      {
        "id": 2,
        "text": "Note 2",
        "color": Colors.green.value,
        "date": DateTime.utc(2020, 5, 3).toIso8601String(),
      }
    ];

    tNoteList = [
      NoteModel(text: "Note 1", color: Color(Colors.green.value), date: DateTime.utc(2020, 5, 3)),
      NoteModel(text: "Note 2", color: Color(Colors.green.value), date: DateTime.utc(2020, 5, 3)),
    ];

    tNoteModel = NoteModel(text: "New Note", color: Colors.red, date: DateTime.now());
    tColor = Color(Colors.green.value);
  });
  test("add note to database", () {
    dataSource.addNote(tNoteModel);
    var excectedMap = tNoteModel.toMap();
    verify(mockDatabase.insert("notes", excectedMap));
  });

  test("get all notes from database", () async {
    when(mockDatabase.query(any)).thenAnswer((realInvocation) async => tQuery);

    var result = await dataSource.getNotes();

    verify(mockDatabase.query("notes"));
    expect(result, tNoteList);
  });

  test("get notes with corresponding color", () async {
    when(mockDatabase.query(any, where: anyNamed("where"))).thenAnswer((realInvocation) async => tQuery);

    var result = await dataSource.getNotesByColor(tColor);

    verify(mockDatabase.query("notes", where: "color = ${tColor.value}"));
    expect(result, tNoteList);
  });
}