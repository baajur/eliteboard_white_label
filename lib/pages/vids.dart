import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.deepPurple,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(YoutubePlayerDemoApp());
}

/// Creates [YoutubePlayerDemoApp] widget.
class YoutubePlayerDemoApp extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player Flutter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 20.0,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.purple,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

/// Homepage
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 80;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'OhJWg-0qdI0',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Topic Video'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: (){ Get.toNamed('/quizChapters');},
        ),
//        title: Text("Quiz Details"),
      ),
      body: ListView(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.deepPurple,
            topActions: <Widget>[
              SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  _controller.metadata.title,
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
                  _showSnackBar('Settings Tapped!');
                },
              ),
            ],
            onReady: () {
              _isPlayerReady = true;
            },
            onEnded: (data) {
              _controller
                  .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
              _showSnackBar('Next Video Started!');
            },
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _space,
                _text('Title', _videoMetaData.title),
                _space,
                _text('Channel', _videoMetaData.author),
                _space,
                _text('Video Id', _videoMetaData.videoId),
                _space,
                Row(
                  children: [
                    _text(
                      'Playback Quality',
                      _controller.value.playbackQuality,
                    ),
                    Spacer(),
                    _text(
                      'Playback Rate',
                      '${_controller.value.playbackRate}x  ',
                    ),
                  ],
                ),
                _space,
//                TextField(
//                  enabled: _isPlayerReady,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      onPressed: _isPlayerReady
                          ? () => _controller.load(_ids[
                      (_ids.indexOf(_controller.metadata.videoId) - 1) %
                          _ids.length])
                          : null,
                    ),
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: _isPlayerReady
                          ? () {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                        setState(() {});
                      }
                          : null,
                    ),
                    IconButton(
                      icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                      onPressed: _isPlayerReady
                          ? () {
                        _muted
                            ? _controller.unMute()
                            : _controller.mute();
                        setState(() {
                          _muted = !_muted;
                        });
                      }
                          : null,
                    ),
                    FullScreenButton(
                      controller: _controller,
                      color: Colors.deepPurple,
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next),
                      onPressed: _isPlayerReady
                          ? () => _controller.load(_ids[
                      (_ids.indexOf(_controller.metadata.videoId) + 1) %
                          _ids.length])
                          : null,
                    ),
                  ],
                ),
                _space,
                Row(
                  children: <Widget>[
                    Text(
                      "Volume",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Expanded(
                      child: Slider(
                        inactiveColor: Colors.transparent,
                        value: _volume,
                        min: 0.0,
                        max: 100.0,
                        divisions: 10,
                        label: '${(_volume).round()}',
                        onChanged: _isPlayerReady
                            ? (value) {
                          setState(() {
                            _volume = value;
                          });
                          _controller.setVolume(_volume.round());
                        }
                            : null,
                      ),
                    ),
                  ],
                ),


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
      ),
    );
  }

  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value ?? '',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700];
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.purple;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.purpleAccent;
      default:
        return Colors.purple;
    }
  }

  Widget get _space => SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.purple,
        onPressed: _isPlayerReady
            ? () {
          if (_idController.text.isNotEmpty) {
            var id = YoutubePlayer.convertUrlToId(
              _idController.text,
            );
            if (action == 'LOAD') _controller.load(id);
            if (action == 'CUE') _controller.cue(id);
            FocusScope.of(context).requestFocus(FocusNode());
          } else {
            _showSnackBar('Source can\'t be empty!');
          }
        }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.purple,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}