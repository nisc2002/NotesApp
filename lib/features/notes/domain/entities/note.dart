import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Note extends Equatable {
  @required final String text;
  @required final DateTime date;
  @required final Color color;

  Note({this.text, this.date, this.color});

  @override
  List<Object> get props => [text, date, color];
}