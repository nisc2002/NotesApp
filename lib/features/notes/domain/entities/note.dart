import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Note extends Equatable {
  String text;
  DateTime date;
  Color color;

  Note({this.text, this.date, this.color});

  @override
  List<Object> get props => [text, date, color];
}