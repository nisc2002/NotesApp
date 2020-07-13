import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/bloc/note_bloc.dart';

class ColorBarWidget extends StatelessWidget {
  final Function onTap;
  final Color selectedColor;

  ColorBarWidget({this.onTap, this.selectedColor});

  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow[600],
    Colors.green,
    Colors.blue[600],
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(colors.length, (index) {
          return colorButton(colors[index], selectedColor, context, onTap);
        }),
      ),
    );
  }

  Widget colorButton(
      Color color, Color selected, BuildContext context, Function onTap) {
    return InkWell(
        //customBorder: Border.all(color: Colors.black, width: 2),
        /*borderRadius: BorderRadius.circular(15),*/
        child: Container(
          decoration: selected == color
              ? BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  shape: BoxShape.circle)
              : null,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 15,
          ),
        ),
        onTap: () {
          onTap(color);
          /*print("${color.toString()}");
          BlocProvider.of<NoteBloc>(context).add(GetNotesByColorEvent(color));*/
        });
  }
}

class ColorSearchWidget extends StatelessWidget {
  final Color selected;
  ColorSearchWidget({this.selected});

  @override
  Widget build(BuildContext context) {
    return ColorBarWidget(
      onTap: (color) {
        BlocProvider.of<NoteBloc>(context).add(GetNotesByColorEvent(color));
      },
      selectedColor: selected,
    );
  }
}

class ColorSelectWidget extends StatelessWidget {
  final Function select;
  ColorSelectWidget(this.select);

  @override
  Widget build(BuildContext context) {
    return ColorBarWidget(
      onTap: select,
    );
  }
}
