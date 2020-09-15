import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/config/app_theme.dart';
import 'package:whatsapp_status_saver/screens/home.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LIGHT,
      home: Home(),
    );
  }
}