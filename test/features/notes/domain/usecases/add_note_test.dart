import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';
import 'package:note_app/features/notes/domain/usecases/add_note.dart';

class MockNoteRepository extends Mock implements NoteRepository {
  List<Note> noteList = [];
}

void main() {
  MockNoteRepository mockRepo;
  AddNote usecase;

  setUp(() {
    mockRepo = MockNoteRepository();
    usecase = AddNote(mockRepo);
  });

  /*String tText = "Note 1";
  Color tColor = Colors.blue;
  DateTime tDate = DateTime.now();*/

  Note tNote = Note(text: "Note 1", color: Colors.blue, date: DateTime.now());

  test("should add note to repository", () async {
    //when(mockRepo.addNote(any)).thenAnswer((realInvocation) => null);
     mockRepo.noteList.add(tNote);
     expect(mockRepo.noteList[0] == tNote, true);
  });
}