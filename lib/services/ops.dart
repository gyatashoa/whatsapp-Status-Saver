import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thumbnails/thumbnails.dart';
import 'package:uuid/uuid.dart';

class MainOps{
  static void save(BuildContext context,String path)async{
    try{
        var dir = Directory("/storage/emulated/0/saver/");
        if(dir.existsSync()){
          print("exist");
        }else{
          dir.createSync();
        }
        var uuid = Uuid().v1();
        var ext = path.split('.').last;
        File(path).copySync('${dir.path}${uuid}.${ext}');
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved!"),duration: Duration(seconds: 1),));
    }catch(e){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Err!"),duration: Duration(seconds: 1),));
    }
  }

  static Future<String> initThumbNail(String path)async{
    final tmp = await getTemporaryDirectory();
    String thumb = await Thumbnails.getThumbnail(videoFile: path,thumbnailFolder: tmp.path , imageType: ThumbFormat.PNG,quality: 30);
    return thumb;
  }
}