import 'package:flutter/material.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();
  Future<List<Note>> getNotesByColor(Color color);
  Future<void> addNote(Note note);
}