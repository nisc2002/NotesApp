import 'package:flutter/material.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class GetNotesByColor {
  final NoteRepository noteRepository;

  GetNotesByColor(this.noteRepository);

  Future<List<Note>> call(Color color) async {
    return await noteRepository.getNotesByColor(color);
  }
}