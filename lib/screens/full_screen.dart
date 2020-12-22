import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:whatsapp_status_saver/services/ops.dart';


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
    widget.isVideo?videoPlayerController.dispose():null;
    widget.isVideo?chewieController.dispose():null;
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
            return FloatingActionButton(onPressed:()=>MainOps.save(context, this.widget.path), child: Icon(Icons.save),);
          }
        ),
    );
  }
}