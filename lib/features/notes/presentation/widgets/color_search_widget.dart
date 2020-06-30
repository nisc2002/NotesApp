import 'package:flutter/material.dart';

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
          colorButton(Colors.red),
          colorButton(Colors.orange),
          colorButton(Colors.yellow[600]),
          colorButton(Colors.green),
          colorButton(Colors.blue[600]),
          colorButton(Colors.purple),
          //colorButton(Colors.green),
        ],
      ),
    );
  }

  Widget colorButton(Color color) {
    return InkWell(
        child: CircleAvatar(
          backgroundColor: color,
          radius: 15,
        ),
        onTap: () {
          print("${color.toString()}");
        });
  }
}
