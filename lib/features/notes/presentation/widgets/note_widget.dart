import 'package:flutter/material.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';

class NoteWidget extends StatelessWidget {
  final Function delete;
  final Note note;
  NoteWidget(this.note, this.delete);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: note.color,
      child: ListTile(
        title: Text(note.text),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              delete(note);
            }),
        contentPadding: EdgeInsets.all(10.0),
      ),
    );
  }
}
