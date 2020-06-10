import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  @override
  NoteState get initialState => Initial();

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
