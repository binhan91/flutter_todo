import 'package:flutter/material.dart';

class Todo {
  int id;
  String name;
  bool isDone;

  Todo(int _id, String _name, bool _isDone) {
    this.id = _id;
    this.name = _name;
    this.isDone = _isDone;
  }
}