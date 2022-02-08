import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taillz/Localization/t_keys.dart';
import 'package:taillz/model/changeModel.dart';
import 'package:taillz/utills/constant.dart';
import 'package:video_player/video_player.dart';
import 'fullScreenVideoPlayer.dart';

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({Key key}) : super(key: key);

  @override
  _ChangeScreenState createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
 

  @override
  Widget build(BuildContext context) {
     List<ChangeModel> list = [
    ChangeModel(TKeys.Alive_Johan.translate(context), TKeys.change_the_way.translate(context), Constant.videoPath),
    ChangeModel(TKeys.Alive_Johan.translate(context), TKeys.communicate_better.translate(context), "assets/videos/123.mp4"),
    ChangeModel(TKeys.Alive_Johan.translate(context), TKeys.feel_better.translate(context), Constant.videoPath),
    // ChangeModel("Alive Johan 01:02", "Find Peace", Constant.videoPath),
  ];
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, i) {
          return itemDesign(list[i]);
        },
      ),
    );
  }

  Widget itemDesign(ChangeModel item) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 190,
        child: Stack(
          children: [VideoWidget(play: false, model: item)],
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key key, @required this.controller, @required this.model}) : super(key: key);

  final ChangeModel model;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.play_circle_fill_rounded,
                                      color: Colors.white,
                                      size: 45,
                                    )),
                                Text(
                                  model.author,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: Constant.fontFamilyName,
                                  ),
                                ),
                                Text(
                                  model.description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: Constant.fontFamilyName,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Visibility(
          visible: controller.value.isPlaying,
          child: controller.value.isPlaying
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 35,
                    child: SliderTheme(
                      data: SliderThemeData(
                        thumbColor: Colors.blue,
                        activeTrackColor: Colors.white,
                      ),
                      child: Slider(
                        inactiveColor: Colors.white,
                        onChanged: (v) {
                          final position = v * controller.value.duration.inMilliseconds;
                          controller.seekTo(Duration(milliseconds: position.round()));
                        },
                        value: (controller.value.duration != null)
                            ? controller.value.position.inMilliseconds / controller.value.duration.inMilliseconds
                            : 0.0,
                      ),
                    ),
                  ),
                )
              : Container(),
        ),
        Visibility(
          visible: controller.value.isPlaying,
          child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                controller.pause();
                return Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) => FullScreenVideoWidget(videoPath: model.videoPath, play: true)))
                    .then((value) => SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.fullscreen_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VideoWidget extends StatefulWidget {
  final ChangeModel model;
  final bool play;

  const VideoWidget({Key key, @required this.model, @required this.play}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(widget.url);
    _controller = VideoPlayerController.asset(widget.model.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });

    _controller.addListener(() {
      setState(() {});
    });

    if (widget.play) {
      _controller.play();
      _controller.setLooping(true);
    }
  }

  @override
  void didUpdateWidget(VideoWidget oldWidget) {
    if (oldWidget.play != widget.play) {
      if (widget.play) {
        _controller.play();
        _controller.setLooping(true);
      } else {
        _controller.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = _controller.value.size;
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.fitHeight,
                    child: Container(width: size.width, height: size.height, child: VideoPlayer(_controller))),
              ),
              _ControlsOverlay(
                controller: _controller,
                model: widget.model,
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}