import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:note_app/features/notes/data/datasources/note_local_datasource.dart';
import 'package:note_app/features/notes/data/repositories/note_repository_impl.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes.dart';
import 'package:note_app/features/notes/domain/usecases/get_notes_by_color.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'features/notes/domain/usecases/add_note.dart';
import 'features/notes/domain/usecases/delete_note.dart';
import 'features/notes/presentation/bloc/note_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  print("dependency injection");
  // Features

  sl.registerFactory(() => NoteBloc(
        getNotes: sl(),
        getNotesByColor: sl(),
        addNote: sl(),
        deleteNote: sl(),
      ));

  sl.registerLazySingleton(() => GetNotes(sl()));
  sl.registerLazySingleton(() => GetNotesByColor(sl()));
  sl.registerLazySingleton(() => AddNote(sl()));
  sl.registerLazySingleton(() => DeleteNote(sl()));

  sl.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl(sl()));

  sl.registerLazySingleton<NoteLocalDataSource>(
      () => NoteLocalDataSourceImpl(sl()));

  // External

  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "notes_app.db");
  final Database db = await openDatabase(path, onCreate: createDB, version: 1);
  sl.registerLazySingleton(() => db);
}

Future<void> createDB(Database db, int version) async {
  await db.execute("""
    CREATE TABLE notes (id INTEGER PRIMARY KEY, text TEXT, color INTEGER, date TEXT)
    """);
}
