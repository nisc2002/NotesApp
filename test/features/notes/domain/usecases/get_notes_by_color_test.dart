import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes_by_color.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

void main() {
  MockNoteRepository mockRepo;
  GetNotesByColor usecase;

  setUp(() {
    mockRepo = MockNoteRepository();
    usecase = GetNotesByColor(mockRepo);
  });

  Color tColor = Colors.blue;

  List<Note> tList = [
    Note(text: "Blue Note 1", date: null, color: Colors.blue),
    Note(text: "Blue Note 2", date: null, color: Colors.blue)
  ];

  test("should return blue notes", () async {
    when(mockRepo.getNotesByColor(any)).thenAnswer((realInvocation) async => tList);
    final result = await usecase(tColor);
    
    expect(result, tList);
    verify(mockRepo.getNotesByColor(tColor));
    verifyNoMoreInteractions(mockRepo);
  });
}