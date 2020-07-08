import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/presentation/bloc/note_bloc.dart';
import 'package:note_app/features/notes/presentation/widgets/add_note_widget.dart';
import 'package:note_app/features/notes/presentation/widgets/color_search_widget.dart';
import 'package:note_app/features/notes/presentation/widgets/note_widget.dart';
import '../../../../injection_container.dart';

class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (_) {
                return AddNoteWidget();
              },
            ),
          ),
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NoteBloc>(),
      child: Column(
        children: <Widget>[
          ColorSearchWidget(), //put into build functions
          //Expanded(child: buildError("Failed to get notes", context)),
          Expanded(child: buildLoaded([])),
        ],
      ),
    );
  }

  Widget buildLoading() {
    return CircularProgressIndicator();
  }

  Widget buildLoaded(List<Note> notes) {
    notes = [
      Note(color: Colors.green, text: "dlkfj", date: DateTime.now()),
      Note(color: Colors.blue, text: "dlkfdsfj", date: DateTime.now()),
      Note(color: Colors.blue, text: "dlkfdsfj", date: DateTime.now()),
      Note(color: Colors.green, text: "dlkfj", date: DateTime.now()),
      Note(color: Colors.blue, text: "dlkfdsfj", date: DateTime.now()),
      Note(color: Colors.blue, text: "dlkfdsfj", date: DateTime.now()),
      Note(color: Colors.green, text: "dlkfj", date: DateTime.now()),
      Note(color: Colors.blue, text: "dlkfdsfj", date: DateTime.now()),
      Note(color: Colors.blue, text: "dlkfdsfj", date: DateTime.now()),
    ];
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple, Colors.red],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return NoteWidget(notes[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEmpty(BuildContext context) {
    return Center(
        child: Text(
      "No notes added yet",
      style: Theme.of(context).textTheme.headline5,
    ));
  }

  Widget buildError(String message, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Error: $message",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          child: Text("Try again"),
          onPressed: () {},
          color: Colors.grey[300],
        )
      ],
    );
  }
}
