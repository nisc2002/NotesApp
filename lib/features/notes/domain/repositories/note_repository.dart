import 'package:flutter/material.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';

abstract class NoteRepository {
  // TODO: maybe use functional programming stuff with dartz library
  Future<List<Note>> getNotes();
  Future<List<Note>> getNotesByColor(Color color);
  Future<void> addNote(Note note);
  Future<void> deleteNote(Note note);
}
