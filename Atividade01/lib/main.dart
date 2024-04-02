import 'dart:math';
import 'package:atividade01/pagina/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atividadee',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}