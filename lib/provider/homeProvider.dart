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
        subtitle: "<Unknown>",
        images: "assets/images/saiyara.jpg",
        song: "assets/audio/saiyara.mp3"),
    ModelData(
        title: "De Taali Song",
        subtitle: "<Unknown>",
        images: "assets/images/arabic_song.jpg",
        song: "assets/audio/aigiri.mp3"),
    ModelData(
        title: "Baaton ko teri Song",
        subtitle: "<Unknown>",
        images: "assets/images/download.jpg",
        song: "assets/audio/Baaton_Ko_Teri.mp3"),
    ModelData(
        title: "Bandeya Song",
        subtitle: "<Unknown>",
        images: "assets/images/download1.jpg",
        song: "assets/audio/Bandeya.mp3"),
    ModelData(
        title: "Basuri Song",
        subtitle: "<Unknown>",
        images: "assets/images/download2.jpg",
        song: "assets/audio/Basuri.mp3"),
    ModelData(
        title: "De taali Song",
        subtitle: "<Unknown>",
        images: "assets/images/download3.jpg",
        song: "assets/audio/De_taali.mp3"),
    ModelData(
        title: "Tu janene Song",
        subtitle: "<Unknown>",
        images: "assets/images/download4.jpg",
        song: "assets/audio/Tu_janene.mp3"),
    ModelData(
        title: "Galliya Song",
        subtitle: "<Unknown>",
        images: "assets/images/download5.jpg",
        song: "assets/audio/Galliya.mp3"),
    ModelData(
        title: "Mehbooba kgf2 Song",
        subtitle: "<Unknown>",
        images: "assets/images/images.jpg",
        song: "assets/audio/Mehbooba.mp3"),
    ModelData(
        title: "Panchhi Soor me Song",
        subtitle: "<Unknown>",
        images: "assets/images/images (1).jpg",
        song: "assets/audio/Panchhi_Soor.mp3"),
    ModelData(
        title: "Qaafirana Song",
        subtitle: "<Unknown>",
        images: "assets/images/images (2).jpg",
        song: "assets/audio/Qaafirana.mp3"),
    ModelData(
        title: "Har Har shambhu Song",
        subtitle: "<Unknown>",
        images: "assets/images/images (3).jpg",
        song: "assets/audio/shambhu.mp3"),
    ModelData(
        title: "Sunn raha na tu Song",
        subtitle: "<Unknown>",
        images: "assets/images/images (4).jpg",
        song: "assets/audio/Sunn_raha.mp3"),
    ModelData(
        title: "Wafa ne BeWafai Song",
        subtitle: "<Unknown>",
        images: "assets/images/images (5).jpg",
        song: "assets/audio/Wafa_ne.mp3"),
  ];

  List songData = [];
  ModelData? allData;
}
