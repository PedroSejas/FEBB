import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Telas/WidgetSplash.dart';


void main() => runApp(MyLock());


//Splash Screen - Tela de entrada
class MyLock extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Splash Screen Flutter'),
    );
  }
}





