import 'package:note_app/features/notes/data/datasources/note_local_datasource.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'dart:ui';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource localDataSource;

  NoteRepositoryImpl(this.localDataSource);

  @override
  Future<void> addNote(Note note) async {
    await localDataSource.addNote(
        NoteModel(text: note.text, color: note.color, date: note.date));
  }

  @override
  Future<List<Note>> getNotes() async {
    return await localDataSource.getNotes();
  }

  @override
  Future<List<Note>> getNotesByColor(Color color) async {
    return await localDataSource.getNotesByColor(color);
  }

  @override
  Future<void> deleteNote(Note note) async {
    await localDataSource.deleteNote(
        NoteModel(text: note.text, color: note.color, date: note.date));
  }
}
