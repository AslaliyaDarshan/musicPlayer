import 'package:flutter/material.dart';
import 'package:musicplayer/model/modelData.dart';

class HomeProvider extends ChangeNotifier {
  bool isPlay = false;

  void play() {
    isPlay = !isPlay;
    notifyListeners();
  }

  List<ModelData> Data = [
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/saiyara.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/arabic_song.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/download.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/download1.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/download2.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/download3.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/download4.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/download5.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/images.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/images (1).jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/images (2).jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/images (3).jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/images (4).jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "Saiyara Song",
        images: "assets/images/images (5).jpg",
        song: "assets/audio/saiyara.mp3"),
  ];
}