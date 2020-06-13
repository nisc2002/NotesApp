part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();
}

class Initial extends NoteState {
  @override
  List<Object> get props => [];
}

class Empty extends NoteState {
  @override
  List<Object> get props => [];
}

class Loading extends NoteState {
  @override
  List<Object> get props => [];
}

class Loaded extends NoteState {
  final List<Note> notes;
  Loaded({this.notes});

  @override
  List<Object> get props => [notes];
}

class Error extends NoteState {
  final String message;
  Error({this.message});

  @override
  List<Object> get props => [message];
}
