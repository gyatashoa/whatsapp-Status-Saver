import 'package:flutter/material.dart';

class ImagesProvider extends ChangeNotifier{
  List<String> _paths = [];

  String currentImage;

  List<String> get getImage => _paths;

  String get getCurrentImage => currentImage;

  set setImage(String path){
    _paths.add(path);
    notifyListeners();
  }
  set setCurrentImage(String path){
    currentImage = path;
    notifyListeners();
  }

  void refresh(List<String> paths){
    _paths = [...paths];
    notifyListeners();
  }
} 