import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/features/notes/data/datasources/note_local_datasource.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:note_app/features/notes/data/repositories/note_repository_impl.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';

class MockLocalDataSource extends Mock implements NoteLocalDataSource {} 

void main() {
  NoteRepositoryImpl repo;
  MockLocalDataSource mockLocalDataSource;
  NoteModel tNoteModel;
  List<Note> tNoteList;
  Color tColor;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    repo = NoteRepositoryImpl(mockLocalDataSource);
    tNoteModel = NoteModel(text: "Note 1", color: Colors.blue, date: DateTime.utc(2000, 5 ,5));
    tNoteList = [tNoteModel, tNoteModel];
    tColor = Colors.blue;
  });

  test("should get data from database", () async {
    when(mockLocalDataSource.getNotes()).thenAnswer((realInvocation) async => tNoteList);
    final result = await repo.getNotes();
    verify(mockLocalDataSource.getNotes());
    expect(result, tNoteList);
  });

  group("add note", () {
    test("add note to database", () {
      //when(mockLocalDataSource.addNote(any)).
      repo.addNote(tNoteModel);
      verify(mockLocalDataSource.addNote(tNoteModel));
    });
  });

  group("get notes by color", () {
    test("get data with corresponding color", () async {
      when(mockLocalDataSource.getNotesByColor(any)).thenAnswer((realInvocation) async => tNoteList);
      final result = await repo.getNotesByColor(tColor);
      verify(mockLocalDataSource.getNotesByColor(tColor));
      expect(result, tNoteList);
      expect(result[0].color, tColor);
    });
  });
}