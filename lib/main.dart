import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import './homelist.dart';
import './mystate.dart';


void main() {

  var state = MyState();

  //Kör 'true' för debug emulator (se linjer och avstånd, kräver omstart av app).
  bool debugMode = false;
  debugPaintSizeEnabled = debugMode;
  runApp(ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

//MaterialApp.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeList(),
    );
  } //Build end
} //End