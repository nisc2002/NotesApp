part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();
}

class GetNotesEvent extends NoteEvent {
  @override
  List<Object> get props => [];
}

class GetNotesByColorEvent extends NoteEvent {
  final Color color;
  GetNotesByColorEvent(this.color);

  @override
  List<Object> get props => [color];
}

class AddNoteEvent extends NoteEvent {
  final Note note;
  AddNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}
