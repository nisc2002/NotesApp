import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/error/failure.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/usecases/add_note.dart';
import 'package:note_app/features/notes/domain/usecases/delete_note.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes_by_color.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetNotes getNotes;
  final GetNotesByColor getNotesByColor;
  final AddNote addNote;
  final DeleteNote deleteNote;

  NoteBloc(
      {@required this.getNotes,
      @required this.getNotesByColor,
      @required this.addNote,
      @required this.deleteNote}) {
    this.add(GetNotesEvent());
  }

  @override
  NoteState get initialState {
    print("initial");
    //this.add(GetNotesEvent());
    return Initial();
  }

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    yield Loading();
    if (event is GetNotesEvent) {
      try {
        final List<Note> notes = await getNotes();
        if (notes.isNotEmpty) {
          yield Loaded(notes: notes, selected: null);
        } else {
          yield Empty();
        }
      } on StorageFailure {
        yield Error(message: "Storage Failure");
      }
    } else if (event is GetNotesByColorEvent) {
      try {
        List<Note> notes;
        if (event.color == Colors.white) {
          //get all notes if no color
          notes = await getNotes();
        } else {
          notes = await getNotesByColor(event.color);
        }
        if (notes.isNotEmpty) {
          yield Loaded(notes: notes, selected: event.color);
        } else {
          yield Empty(selected: event.color);
        }
      } on StorageFailure {
        yield Error(message: "Storage Failure");
      }
    } else if (event is AddNoteEvent) {
      try {
        await addNote(event.note);
        this.add(GetNotesEvent());
      } on StorageFailure {
        yield Error(message: "Storage Failure");
      }
    } else if (event is DeleteNoteEvent) {
      try {
        await deleteNote(event.note);
        print(event.previouslySelected);
        this.add(GetNotesByColorEvent(event.previouslySelected));
      } on StorageFailure {
        yield Error(message: "Storage Failure");
      }
    }
  }
}
