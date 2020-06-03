import 'package:flutter/material.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  GetNotes usecase;
  MockNoteRepository mockRepo;

  setUp(() {
    mockRepo = MockNoteRepository();
    usecase = GetNotes(mockRepo);
  });

  final tText = "Note 1";
  final Color tColor = Colors.blue;

  List<Note> tList = [
    Note(color: Colors.blue, text: "Note 1", date: null),
    //Note(color: Colors.green, text: "Note 2", date: null),
    //Note(color: Colors.red, text: "Note 3", date: null)
  ];

  test("Should get list of notes from repo", () async {
    when(mockRepo.getNotes()).thenAnswer((_) async  => tList);
    final result = await usecase();
    
    expect(result[0].text, tText);
    verify(mockRepo.getNotes());
    verifyNoMoreInteractions(mockRepo);
  });
}
