part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();
}

class Initial extends NoteState {
  @override
  List<Object> get props => [];
}

class Empty extends NoteState {
  final Color selected;
  Empty({this.selected});

  @override
  List<Object> get props => [];
}

class Loading extends NoteState {
  @override
  List<Object> get props => [];
}

class Loaded extends NoteState {
  final List<Note> notes;
  final Color selected;
  Loaded({@required this.notes, @required this.selected});

  @override
  List<Object> get props => [notes];
}

class Error extends NoteState {
  final String message;
  Error({this.message});

  @override
  List<Object> get props => [message];
}
