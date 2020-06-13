import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/usecases/add_note.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes_by_color.dart';
import 'package:note_app/features/notes/presentation/bloc/note_bloc.dart';

class MockGetNotes extends Mock implements GetNotes {}

class MockGetNotesByColor extends Mock implements GetNotesByColor {}

class MockAddNote extends Mock implements AddNote {}

void main() {
  NoteBloc bloc;
  MockGetNotes mockGetNotes;
  MockGetNotesByColor mockGetNotesByColor;
  MockAddNote mockAddNote;

  setUp(() {
    mockGetNotes = MockGetNotes();
    mockGetNotesByColor = MockGetNotesByColor();
    mockAddNote = MockAddNote();

    bloc = NoteBloc(getNotes: mockGetNotes, getNotesByColor: mockGetNotesByColor, addNote: mockAddNote);
  });

  test("initial state", () {
    expect(bloc.initialState, Initial());
  });

  group("get notes", () {
    final List<Note> tNoteList = [Note(color: Colors.blue, text: "Note 1", date: DateTime.utc(2020, 6, 12))];
    final List<Note> tEmptyList = [];

    test("should call correct usecase", () async {
      when(mockGetNotes()).thenAnswer((realInvocation) async => tNoteList);

      bloc.add(GetNotesEvent());
      await untilCalled(mockGetNotes());
      verify(mockGetNotes());
    });

    test("should emit correct order of states if database contains notes", () async {
      when(mockGetNotes()).thenAnswer((realInvocation) async => tNoteList);

      final expected = [Initial(), Loading(), Loaded(notes: tNoteList)];
      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetNotesEvent());
    });

    test("should emit different order of states if database is empty", () async {
      when(mockGetNotes()).thenAnswer((realInvocation) async => tEmptyList);

      final expected = [Initial(), Loading(), Empty()];
      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetNotesEvent());
    });
  });

  group("get notes by color", () {
    final List<Note> tNoteList = [Note(color: Colors.blue, text: "Note 1", date: DateTime.utc(2020, 6, 12))];
    final List<Note> tEmptyList = [];
    final Color tColor = Colors.green;
    
    test("should call correct usecase", () async {
      when(mockGetNotesByColor(any)).thenAnswer((realInvocation) async => tNoteList);

      bloc.add(GetNotesByColorEvent(tColor));
      await untilCalled(mockGetNotesByColor(any));
      verify(mockGetNotesByColor(tColor));
    });

    test("should emit correct order of states if database contains notes", () async {
      when(mockGetNotesByColor(tColor)).thenAnswer((realInvocation) async => tNoteList);

      final expected = [Initial(), Loading(), Loaded(notes: tNoteList)];
      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetNotesByColorEvent(tColor));
    });

    test("should emit different order of states if database is empty", () async {
      when(mockGetNotesByColor(tColor)).thenAnswer((realInvocation) async => tEmptyList);

      final expected = [Initial(), Loading(), Empty()];
      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetNotesByColorEvent(tColor));
    });
  });

  group("add note", () {
    final tNote = Note(text: "new note", color: Colors.blue, date: DateTime.utc(2020, 6, 13));
    // TODO: add more tests later
    test("should call correct usecase", () async {
      bloc.add(AddNoteEvent(tNote));
      await untilCalled(mockAddNote(any));
      verify(mockAddNote(tNote));
    });
  });
}