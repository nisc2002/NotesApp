import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/domain/repositories/note_repository.dart';

class GetNotes {
  final NoteRepository noteRepository;

  GetNotes(this.noteRepository);

  Future<List<Note>> call() async {
    return await noteRepository.getNotes();
  }
}