import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/domain/entities/note.dart';
import 'package:note_app/features/notes/presentation/bloc/note_bloc.dart';
import 'package:note_app/features/notes/presentation/pages/add_note_page.dart';
import 'package:note_app/features/notes/presentation/widgets/color_bar_widget.dart';
import 'package:note_app/features/notes/presentation/widgets/note_widget.dart';

class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => BlocProvider.value(
                  value: BlocProvider.of<NoteBloc>(context),
                  child: AddNotePage(),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer"),
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
            ),
            ListTile(onTap: () {}, title: Text("Notes")),
            ListTile(onTap: () {}, title: Text("Delete all notes")),
          ],
        ),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      builder: (BuildContext context, state) {
        if (state is Initial) {
          return buildError("yy", context);
        } else if (state is Loaded) {
          return buildLoaded(state.notes, state.selected);
        } else if (state is Empty) {
          return buildEmpty(state.selected, context);
        } else if (state is Error) {
          return buildError(state.message, context);
        } else if (state is Loading) {
          return buildLoading();
        }
      },
    );
  }

  Widget buildLoading() {
    return CircularProgressIndicator();
  }

  Widget buildLoaded(List<Note> notes, Color selected) {
    return Column(
      children: <Widget>[
        ColorSearchWidget(
          selected: selected,
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                /*decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple, Colors.red],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),*/
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return NoteWidget(notes[index], (Note note) {
                        BlocProvider.of<NoteBloc>(context).add(
                            DeleteNoteEvent(note, selected ?? Colors.white));
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildEmpty(Color selected, BuildContext context) {
    return Column(
      children: <Widget>[
        ColorSearchWidget(selected: selected),
        Expanded(
          child: Center(
              child: Text(
            "No notes found",
            style: Theme.of(context).textTheme.headline5,
          )),
        ),
      ],
    );
  }

  Widget buildError(String message, BuildContext context) {
    return Center(
      child: Column(
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
            onPressed: () {
              BlocProvider.of<NoteBloc>(context).add(GetNotesEvent());
            },
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
