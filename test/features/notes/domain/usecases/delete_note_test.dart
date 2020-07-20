import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';
import 'package:note_app/features/notes/domain/usecases/delete_note.dart';

class MockNoteRepository extends Mock implements NoteRepository {
  List<Note> tNoteList = [
    Note(text: "Note", color: Colors.green, date: DateTime.utc(2020, 5, 5)),
    Note(text: "Note 2 ", color: Colors.red, date: DateTime.utc(2020, 5, 8)),
  ];
}

void main() {
  MockNoteRepository mockRepo;
  DeleteNote usecase;

  setUp(() {
    mockRepo = MockNoteRepository();
    usecase = DeleteNote(mockRepo);
  });

  Note tNote =
      Note(text: "Note", color: Colors.green, date: DateTime.utc(2020, 5, 5));

  test("should remove from list", () async {
    mockRepo.deleteNote(tNote);
    expect(mockRepo.tNoteList.contains(tNote), false);
  });
}
