import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'MyHomeListView.dart';
import 'mystate.dart';

void main() {
  var state = MyState();
  state.getList();

  bool debugMode = false;
  debugPaintSizeEnabled = debugMode;

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeList(),
    );
  }
}
