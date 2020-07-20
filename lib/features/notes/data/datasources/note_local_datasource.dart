import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

abstract class NoteLocalDataSource {
  Future<List<Note>> getNotes();
  Future<List<Note>> getNotesByColor(Color color);
  Future<void> addNote(NoteModel note);
  Future<void> deleteNote(NoteModel note);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final Database database;

  NoteLocalDataSourceImpl(this.database);

  @override
  Future<void> addNote(NoteModel note) async {
    await database.insert("notes", note.toMap());
  }

  @override
  Future<List<Note>> getNotes() async {
    var result = await database.query("notes");
    return result.map((e) => NoteModel.fromMap(e)).toList();
  }

  @override
  Future<List<Note>> getNotesByColor(Color color) async {
    var result = await database.query("notes", where: "color = ${color.value}");
    return result.map((e) => NoteModel.fromMap(e)).toList();
  }

  @override
  Future<void> deleteNote(NoteModel note) async {
    var map = note.toMap();
    await database.delete("notes",
        where:
            "text = '${map["text"]}' AND color = ${map["color"]} AND date = '${map["date"]}'");
  }
}
