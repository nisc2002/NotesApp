import 'package:note_app/features/notes/domain/entities/note.dart';
import 'dart:ui';

import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  @override
  Future<void> addNote(Note note) {
    // TODO: implement addNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotesByColor(Color color) {
    // TODO: implement getNotesByColor
    throw UnimplementedError();
  }

}