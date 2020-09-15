import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String _title = "Whatsapp Status Saver";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
