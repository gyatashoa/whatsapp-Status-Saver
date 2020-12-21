import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp_status_saver/widgets/custom_card.dart';
import 'package:permission_handler/permission_handler.dart' as perm;
import 'package:path_provider/path_provider.dart' as path;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final String _title = "Whatsapp Status Saver";
  TabController _tabController;
  List<String> imgs = [];
  List<String> vids = [];

  Future get _localPath async {
    await perm.Permission.storage.request().then((value) => print(value));
    // path.StorageDirectory.ringtones
    final directory = Directory('/storage/emulated/0/Whatsapp/Media/.Statuses');
    directory.exists().then((value) => print(value));
    directory.list().forEach((element) { 
      // print(element.uri);
      // "".
      var file = element.path.split('.');
      if(file[2] == "jpg" || file[2] == "png"){
        imgs.add(element.path);
      }else if(file[2] == "mp4"){
        vids.add(element.path);
      }
    }).then((value) => setState((){}));
    // directory.
    // return directory;
  }

  @override
  void initState() {
    super.initState();

    _localPath.then((value) => print(value));
    _tabController = TabController(length: 2, vsync: this);
  }

  int _index = 0;

  final _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.image),title: Text("Pictures")),
    BottomNavigationBarItem(icon: Icon(Icons.videocam),title: Text("Videos")),
  ];

  final _tabs = <Widget>[
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          centerTitle: true,
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text("Pictures"),
                ),
                Tab(
                  child: Text("Videos"),
                )
              ]),
        ),
        body: TabBarView(
            physics: BouncingScrollPhysics(),
            controller: _tabController,
            children: [
              Container(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: imgs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) =>
                        CustomCard(path: imgs[index])),
              ),
              Container(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: vids.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) =>
                        CustomCard(path: vids[index],isVideo: true,)),
              ),
            ]),
            bottomNavigationBar:
             BottomNavigationBar(
               currentIndex: _index,
               onTap: (i)=>setState(()=>_index = i),
               items:_items,),
            );
  }
}
