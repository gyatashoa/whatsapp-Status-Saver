import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_status_saver/providers/tab_provider.dart';
import 'package:whatsapp_status_saver/services/path_services.dart';
import 'package:whatsapp_status_saver/tabs/pictures.dart';
import 'package:whatsapp_status_saver/tabs/videos.dart';
import 'package:whatsapp_status_saver/utils/permission.dart';
import 'package:whatsapp_status_saver/widgets/custom_card.dart';
import 'package:permission_handler/permission_handler.dart' as perm;
import 'package:path_provider/path_provider.dart' as path;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final String _title = "Whatsapp Status Saver";
  // TabController _tabController;
  // List<String> imgs = [];
  // List<String> vids = [];

  // Future get _localPath async {
  //   await perm.Permission.storage.request().then((value) => print(value));
  //   // path.StorageDirectory.ringtones
  //   final directory = Directory('/storage/emulated/0/Whatsapp/Media/.Statuses');
  //   directory.exists().then((value) => print(value));
  //   directory.list().forEach((element) { 
  //     // print(element.uri);
  //     // "".
  //     var file = element.path.split('.');
  //     if(file[2] == "jpg" || file[2] == "png"){
  //       imgs.add(element.path);
  //     }else if(file[2] == "mp4"){
  //       vids.add(element.path);
  //     }
  //   }).then((value) => setState((){}));
  //   // directory.
  //   // return directory;
  // }

  @override
  void initState() {
    final inst  = PathServices.instance;
    Perms.getPerms().then((value) => 
      value?inst.fetchFiles(context): print("Not granted")
    );
    super.initState();
  }

  final _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.image),title: Text("Pictures")),
    BottomNavigationBarItem(icon: Icon(Icons.videocam),title: Text("Videos")),
  ];

  final _tabs = <Widget>[
    Pictures(),
    Videos()
  ];

  @override
  Widget build(BuildContext context) {
    final tab = Provider.of<TabProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          centerTitle: true,
        ),
        body:_tabs[tab.index],
            bottomNavigationBar:
             BottomNavigationBar(
               currentIndex: tab.index,
               onTap: (i)=>tab.index = i,
               items:_items,),
            );
  }
}
