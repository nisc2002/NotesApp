import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/widgets/color_bar_widget.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/note.dart';
import '../bloc/note_bloc.dart';
import '../bloc/note_bloc.dart';

class AddNotePage extends StatefulWidget {
  static final _formKey = GlobalKey<FormState>();

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String txtNote;
  Color selected;

  void selectColor(Color color) {
    setState(() {
      selected = color;
    });
  }

  void submitNote(NoteBloc bloc) {
    if (AddNotePage._formKey.currentState.validate()) {
      AddNotePage._formKey.currentState.save();
      bloc.add(
        AddNoteEvent(
          Note(
            text: txtNote,
            color: selected,
            date: DateTime.now(),
          ),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NoteBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      backgroundColor: selected ?? Theme.of(context).scaffoldBackgroundColor,
      body: Form(
        key: AddNotePage._formKey,
        child: Column(
          children: <Widget>[
            ColorSelectWidget(selectColor),
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
                submitNote(bloc);
              },
            ),
          ],
        ),
      ),
    );
  }
}
