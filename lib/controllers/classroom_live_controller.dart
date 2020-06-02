import 'package:get/get.dart';
import 'package:eliteboard/models/classroom_live_lecture_list.dart';
import 'package:eliteboard/repositorys/local.dart';
import 'package:package_info/package_info.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ClassroomLiveController extends GetController {
  YoutubePlayerController controller;
  TextEditingController idController;
  TextEditingController seekToController;

  PlayerState playerState;
  YoutubeMetaData videoMetaData;
  double volume = 100;
  bool muted = false;
  bool isPlayerReady = false;
  Lecture lecture;
  static ClassroomLiveController get to => Get.find();


  final List<String> ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  void initPlayer(){
    lecture = Get.arguments;
    String videoId = YoutubePlayer.convertUrlToId(lecture.url);
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: true,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    idController = TextEditingController();
    seekToController = TextEditingController();
    videoMetaData = const YoutubeMetaData();
    playerState = PlayerState.unknown;
    update(this);
  }

  void listener() {
    if (isPlayerReady && !controller.value.isFullScreen) {
        playerState = controller.value.playerState;
        videoMetaData = controller.metadata;
        print("----------meta video---------");
        print(videoMetaData);
        update(this);
    }else{
      print("ERROR");
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    idController.dispose();
    seekToController.dispose();
    super.dispose();
  }

  void showSnackBar(String message) {
    print('snak bar shown');
  }


  void playerReady(){
    isPlayerReady = true;
    update(this);
  }
}