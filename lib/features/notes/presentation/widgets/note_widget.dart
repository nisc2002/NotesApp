import 'package:flutter/material.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  NoteWidget(this.note);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: note.color,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(note.text),
      ),
    );
  }
}
