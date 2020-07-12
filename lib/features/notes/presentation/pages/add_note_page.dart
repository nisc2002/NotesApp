import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/note.dart';
import '../bloc/note_bloc.dart';
import '../bloc/note_bloc.dart';

class AddNotePage extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  String txtNote;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NoteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Note"),
              keyboardType: TextInputType.multiline,
              minLines: 3,
              //maxLines: null,
              maxLines: 20,
              validator: (value) {
                if (value.isEmpty) {
                  return "Enter something";
                }
                return null;
              },
              onSaved: (input) => txtNote = input,
            ),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  bloc.add(
                    AddNoteEvent(
                      Note(
                        text: txtNote,
                        color: Colors.green,
                        date: DateTime.now(),
                      ),
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
