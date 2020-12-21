import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class FullScreen extends StatefulWidget {
  final String path;
  final bool isVideo;
  const FullScreen({this.path,this.isVideo});

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  ChewieController chewieController;
  VideoPlayerController videoPlayerController;
  @override
  void initState() {
    this.widget.isVideo?initPlayer():null;
    super.initState();
  }

  void _save(BuildContext context)async{
    try{
        var dir = Directory("/storage/emulated/0/saver/");
        if(dir.existsSync()){
          print("exist");
        }else{
          dir.createSync();
        }
        var uuid = Uuid().v1();
        var ext = this.widget.path.split('.').last;
        File(this.widget.path).copySync('${dir.path}${uuid}.${ext}');
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved!"),duration: Duration(seconds: 1),));
    }catch(e){
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Err!"),duration: Duration(seconds: 1),));
    }
  }
  void initPlayer()async{
    videoPlayerController = VideoPlayerController.file(File(this.widget.path));
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
    setState(() {
      
    });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: widget.isVideo?
      ( chewieController == null ? Center(child: CircularProgressIndicator()) :Chewie(
        controller: chewieController,
      ))
      :Hero(
        tag: this.widget.path,
        child: Center(child: Image.file(File(this.widget.path)))),
        floatingActionButton: Builder(
          builder: (context,) {
            return FloatingActionButton(onPressed:()=>_save(context), child: Icon(Icons.save),);
          }
        ),
    );
  }
}