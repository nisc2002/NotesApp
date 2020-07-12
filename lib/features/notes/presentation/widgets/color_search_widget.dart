import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/bloc/note_bloc.dart';

class ColorSearchWidget extends StatelessWidget {
  //List<Color> colors = []
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          colorButton(Colors.red, context),
          colorButton(Colors.orange, context),
          colorButton(Colors.yellow[600], context),
          colorButton(Colors.green, context),
          colorButton(Colors.blue[600], context),
          colorButton(Colors.purple, context),
          //colorButton(Colors.green),
        ],
      ),
    );
  }

  Widget colorButton(Color color, BuildContext context) {
    return InkWell(
        child: CircleAvatar(
          backgroundColor: color,
          radius: 15,
        ),
        onTap: () {
          print("${color.toString()}");
          BlocProvider.of<NoteBloc>(context).add(GetNotesByColorEvent(color));
        });
  }
}
