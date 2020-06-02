import 'package:eliteboard/controllers/classroom_live_controller.dart';
import 'package:eliteboard/controllers/dashboard_controller.dart';
import 'package:eliteboard/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/getflutter.dart';
import 'package:eliteboard/repositorys/local.dart';
import 'package:eliteboard/theme/light_colors.dart';
import 'package:eliteboard/widgets/dashboard_widgets.dart';
import 'package:get/get.dart';
import 'package:eliteboard/widgets/eliteboard_widgets.dart';
import 'package:eliteboard/utilities/constants.dart';
import 'package:eliteboard/widgets/appdrawer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ClassroomLive extends StatelessWidget {

  Widget get _space => const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {

    Widget _text(String title, String value) {
      return RichText(
        text: TextSpan(
          text: '$title : ',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: value ?? '',
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Live Classroom"),
      ),
      body: GetBuilder(
        init: ClassroomLiveController(),
        initState:(player){ClassroomLiveController.to.initPlayer();},
        builder:(player){
//          if(!player.isPlayerReady){
//            return CircularProgressIndicator(backgroundColor: Get.theme.primaryColor,);
//          }
//          else
          return ListView (
            children: [
              YoutubePlayer(

                controller: player.controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.deepPurple,
                topActions: <Widget>[
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      player.controller.metadata.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 25.0,
                    ),
                    onPressed: () {
                      player.showSnackBar('Settings Tapped!');
                    },
                  ),
                ],
                onReady: () {
                  ClassroomLiveController.to.playerReady();
                },
                onEnded: (data) {
                  player.controller
                      .load(player.ids[(player.ids.indexOf(data.videoId) + 1) % player.ids.length]);
                  player.showSnackBar('Next Video Started!');
                },
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _space,
                    _text('Title', player.videoMetaData.title),
//                    _space,
//                    _text('Channel', player.videoMetaData.author),
//                    _space,
//                    _text('Video Id', player.videoMetaData.videoId),
//                    _space,
//                    Row(
//                      children: [
//                        _text(
//                          'Playback Quality',
//                          player.controller.value.playbackQuality,
//                        ),
//                        Spacer(),
//                        _text(
//                          'Playback Rate',
//                          '${player.controller.value.playbackRate}x  ',
//                        ),
//                      ],
//                    ),
                    _space,
//                TextField(
//                  enabled: isPlayerReady,
//                  controller: _idController,
//                  decoration: InputDecoration(
//                    border: InputBorder.none,
//                    hintText: 'Enter youtube \<video id\> or \<link\>',
//                    fillColor: Colors.blueAccent.withAlpha(20),
//                    filled: true,
//                    hintStyle: TextStyle(
//                      fontWeight: FontWeight.w300,
//                      color: Colors.blueAccent,
//                    ),
//                    suffixIcon: IconButton(
//                      icon: Icon(Icons.clear),
//                      onPressed: () => _idController.clear(),
//                    ),
//                  ),
//                ),
                    _space,
//                Row(
//                  children: [
//                    _loadCueButton('LOAD'),
//                    SizedBox(width: 10.0),
//                    _loadCueButton('CUE'),
//                  ],
//                ),
                    _space,
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: [
//                        IconButton(
//                          icon: Icon(Icons.skip_previous),
//                          onPressed: player.isPlayerReady
//                              ? () => player.controller.load(player.ids[
//                          (player.ids.indexOf(player.controller.metadata.videoId) - 1) %
//                              player.ids.length])
//                              : null,
//                        ),
//                        IconButton(
//                          icon: Icon(
//                            player.controller.value.isPlaying
//                                ? Icons.pause
//                                : Icons.play_arrow,
//                          ),
//                          onPressed: player.isPlayerReady
//                              ? () {
//                            player.controller.value.isPlaying
//                                ? player.controller.pause()
//                                : player.controller.play();
////                            setState(() {});
//                          }
//                              : null,
//                        ),
//                        IconButton(
//                          icon: Icon(player.muted ? Icons.volume_off : Icons.volume_up),
//                          onPressed: player.isPlayerReady
//                              ? () {
//                            player.muted
//                                ? player.controller.unMute()
//                                : player.controller.mute();
////                            setState(() {
////                              muted = !muted;
////                            });
//                          }
//                              : null,
//                        ),
//                        FullScreenButton(
//                          controller: player.controller,
//                          color: Colors.deepPurple,
//                        ),
//                        IconButton(
//                          icon: Icon(Icons.skip_next),
//                          onPressed: player.isPlayerReady
//                              ? () => player.controller.load(player.ids[
//                          (player.ids.indexOf(player.controller.metadata.videoId) + 1) %
//                              player.ids.length])
//                              : null,
//                        ),
//                      ],
//                    ),
                    _space,
//                    Row(
//                      children: <Widget>[
//                        Text(
//                          "Volume",
//                          style: TextStyle(fontWeight: FontWeight.w300),
//                        ),
//                        Expanded(
//                          child: Slider(
//                            inactiveColor: Colors.transparent,
//                            value: player.volume,
//                            min: 0.0,
//                            max: 100.0,
//                            divisions: 10,
//                            label: '${(player.volume).round()}',
//                            onChanged: player.isPlayerReady
//                                ? (value) {
////                              setState(() {
////                                volume = value;
////                              });
//                              player.controller.setVolume(player.volume.round());
//                            }
//                                : null,
//                          ),
//                        ),
//                      ],
//                    ),


                    SizedBox(height:20),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text('Details: ', style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black, fontWeight: FontWeight.w800))
                        ),
                      ],
                    ),
                    SizedBox(height:5),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text('lorem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, \n\n when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the \n\n release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black),)
                        ),
                      ],
                    ),
                    _space,
//                AnimatedContainer(
//                  duration: Duration(milliseconds: 800),
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(20.0),
//                    color: _getStateColor(_playerState),
//                  ),
//                  padding: EdgeInsets.all(8.0),
//                  child: Text(
//                    _playerState.toString(),
//                    style: TextStyle(
//                      fontWeight: FontWeight.w300,
//                      color: Colors.white,
//                    ),
//                    textAlign: TextAlign.center,
//                  ),
//                ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}