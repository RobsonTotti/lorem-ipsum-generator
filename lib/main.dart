import 'package:flutter/material.dart';
import 'package:lorem_ipsum_generator/home.dart';
import 'package:toast/toast.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return new MaterialApp(
      title: 'Lorem Ipsum Generator',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
