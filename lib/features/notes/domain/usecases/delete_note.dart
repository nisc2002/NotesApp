import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class DeleteNote {
  final NoteRepository noteRepository;

  DeleteNote(this.noteRepository);

  Future<void> call(Note note) async {
    await noteRepository.deleteNote(note);
  }
}
