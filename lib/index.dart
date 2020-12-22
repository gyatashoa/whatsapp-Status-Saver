import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_status_saver/config/app_theme.dart';
import 'package:whatsapp_status_saver/providers/images_provider.dart';
import 'package:whatsapp_status_saver/providers/tab_provider.dart';
import 'package:whatsapp_status_saver/providers/videos_provider.dart';
import 'package:whatsapp_status_saver/screens/home.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>TabProvider()),
      ChangeNotifierProvider(create: (_)=>ImagesProvider()),
      ChangeNotifierProvider(create: (_)=>VideosProvider()),
    ],child: MaterialApp(
      theme: LIGHT,
      home: Home(),
    ));
  }
}