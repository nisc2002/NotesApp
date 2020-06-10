part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();
}

class GetNotes extends NoteEvent {
  @override
  List<Object> get props => [];
}

class GetNotesByColor extends NoteEvent {
  final Color color;
  GetNotesByColor(this.color);

  @override
  List<Object> get props => [color];
}

class AddNote extends NoteEvent {
  final Note note;
  AddNote(this.note);

  @override
  List<Object> get props => [note];
}
