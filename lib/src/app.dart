import 'package:flutter/material.dart';
import 'screens/home.dart';

class App extends StatelessWidget{
  Widget build(context){
    return MaterialApp(
      title: 'Hey!' ,
      theme: ThemeData(
        primarySwatch: Colors.pink),
        home : Home(),
        
      );
  }
}