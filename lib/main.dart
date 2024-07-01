import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Meals Flutter',
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: const Column(
      children: [
        Text('Hi here')
      ],
    ),
  ));
}
