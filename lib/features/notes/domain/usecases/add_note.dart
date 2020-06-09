import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class AddNote {
  final NoteRepository noteRepository;
  AddNote(this.noteRepository);

  Future<void> call(Note note) async {
    await noteRepository.addNote(note);
  }
}