import 'package:flutter/material.dart';

class VideosProvider extends ChangeNotifier{
  List<Map<String,String>> _paths = [];

  String currentVideo;

  List<Map<String,String>> get getVideo => _paths;

  String get getCurrentVideo => currentVideo;

  set setVideo(Map<String,String> vid){
    _paths.add(vid);
    notifyListeners();
  }
  set setCurrentVideo(String path){
    currentVideo = path;
    notifyListeners();
  }

  void refresh(List<Map<String,String>> vids){
    _paths = [...vids];
    notifyListeners();
  }
} 